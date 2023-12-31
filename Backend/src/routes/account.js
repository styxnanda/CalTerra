const express = require("express");
const router = express.Router();
const passport = require("passport");
const bcrypt = require("bcryptjs");
const pool = require("../db.js");

const baseURI = "/account";
// register
router.post("/register", async (req, res) => {
  let { username, name, email, password } = req.body;
  try {
    // check if user exists
    const user = await pool.query("SELECT * FROM users WHERE username = $1", [
      username,
    ]);
    if (user.rows.length > 0) {
      return res.status(401).json("User already exists!");
    }

    // hash password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // save user to db
    const newUser = await pool.query(
      "INSERT INTO users (username, name, email, password_hash) VALUES ($1, $2, $3, $4) RETURNING *",
      [username, name, email, hashedPassword]
    );
    // save new user current monthly emission to db
    const newMonthEmission = await pool.query(
      `INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) 
       VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *`,
      [newUser.rows[0].id, new Date().toISOString().slice(0, 7), 0]
    );

    // login user after register
    req.login(newUser.rows[0], (err) => {
      if (err) throw err;
      res.json("Registered!");
    });
  } catch (error) {
    console.log(error.message);
    res.status(500).json("Server error");
  }
});

// login local
router.post("/login/local", (req, res, next) => {
  passport.authenticate("local", (err, user) => {
    if (err) {
      throw err;
    }
    if (!user) {
      return res.status(401).json("Invalid credentials!");
    }
    req.login(user, (err) => {
      if (err) throw err;
      res.json(user);
    });
  })(req, res, next);
});

// logout
router.get("/logout", (req, res) => {
  req.logout((err) => {
    if (err) throw err;
    else {
      req.session.destroy();
      res.status(200).json({
        success: true,
        message: "Logged out!",
      });
    }
  });
});

// session checker
const sessionChecker = (req, res, next) => {
  // console.log(req.session.passport);
  if (req.session.passport) {
    next();
  } else {
    res.redirect(baseURI + "/sessionError");
  }
};

// session error
router.get("/sessionError", (req, res) => {
  res.status(401).json({
    success: false,
    message: "User not logged in or session expired",
  });
});

// get user endpoint
router.get("/user", sessionChecker, async (req, res) => {
  try {
    const user = await pool.query("SELECT * FROM users WHERE id = $1", [
      req.session.passport.user,
    ]);
    res.json(user.rows[0]);
  } catch (error) {
    console.log(error.message);
    res.status(500).json("Server error");
  }
});

// get user monthly emission endpoint
router.get("/user/monthly-emission", sessionChecker, async (req, res) => {
  try {
    const user = await pool.query(
      "SELECT * FROM user_monthly_emissions WHERE user_id = $1",
      [req.session.passport.user]
    );
    res.json(user.rows[0]);
  } catch (error) {
    console.log(error.message);
    res.status(500).json("Server error");
  }
});

// Get change of emission based on last month usage
router.get("/user/change", sessionChecker, async(req, res) => {
  try {
    const userEmissions = await pool.query(
      "SELECT * FROM user_monthly_emissions WHERE user_id = $1 ORDER BY year_month DESC LIMIT 2",
      [req.session.passport.user]
    );

    if(userEmissions.rows.length === 2){
      const change = userEmissions.rows[0].monthly_total_emission - userEmissions.rows[1].monthly_total_emission;

      const responseData = {
        latestMonth: userEmissions.rows[0],
        previousMonth: userEmissions.rows[1],
        change: parseFloat(change.toFixed(2))
      };
      res.json(responseData);
    } else if (userEmissions.rows.length === 1){
      res.json({
        latestMonth: userEmissions.rows[0],
        change: null
      });
    } else {
      res.status(404).json("No emission data found.");
    }
  } catch (error) {
    res.status(500).json("Server error");
  }
});

router.post("/history/", sessionChecker, async (req, res) => {
  const { userId, startDate, endDate } = req.body;
  try {
    const vehicleEmissions = await pool.query(
      `SELECT 'Vehicle' AS type, vehicle_type, distance, fuel_type, emission, timestamp
        FROM vehicle_emissions WHERE user_id = $1 AND timestamp BETWEEN $2 AND $3
        ORDER BY timestamp DESC;`,
      [userId, startDate, endDate]
    );

    const powerSourceEmissions = await pool.query(
      `SELECT 'Power Source' AS type, power_source_type AS sub_type, usage_kwh, emission, timestamp
        FROM power_sources_emissions
        WHERE user_id = $1 AND timestamp >= $2 AND timestamp <= $3
        ORDER BY timestamp DESC;`,
      [userId, startDate, endDate]
    );

    const homeApplianceEmissions = await pool.query(
      `SELECT 'Home Appliance' AS type, appliance_type AS sub_type, duration_hours, emission, timestamp
        FROM home_appliances_emissions
        WHERE user_id = $1 AND timestamp >= $2 AND timestamp <= $3
        ORDER BY timestamp DESC;`,
      [userId, startDate, endDate]
    );

    const foodEmissions = await pool.query(
      `SELECT 'Food' AS type, food_type AS sub_type, emission, timestamp
        FROM food_emissions
        WHERE user_id = $1 AND timestamp >= $2 AND timestamp <= $3
        ORDER BY timestamp DESC;`,
      [userId, startDate, endDate]
    );

    const flightEmissions = await pool.query(
      `SELECT 'Flight' AS type, CONCAT(departure_airport, ' to ', destination_airport) AS sub_type, flight_distance, emission, timestamp
        FROM flight_emissions
        WHERE user_id = $1 AND timestamp >= $2 AND timestamp <= $3
        ORDER BY timestamp DESC;`,
      [userId, startDate, endDate]
    );

    const allEmissions = [
      ...vehicleEmissions.rows,
      ...powerSourceEmissions.rows,
      ...homeApplianceEmissions.rows,
      ...foodEmissions.rows,
      ...flightEmissions.rows,
    ];

    allEmissions.sort((a, b) => new Date(b.timestamp) - new Date(a.timestamp));
    res.json(allEmissions);
  } catch (error) {
    console.log(error.message);
    res.status(500).json({ error: error.message });
  }
});

router.get("/user/contribution", sessionChecker, async (req, res) => {
  try {
    const currentDate = new Date();
    const pastDate = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, currentDate.getDate());
    const userContribution = await pool.query(`SELECT 'vehicle' as type, SUM(emission) as total_emission
    FROM public.vehicle_emissions
    WHERE user_id = $1 AND "timestamp" > $2
    UNION ALL
    SELECT 'house' as type, SUM(emission) as total_emission
    FROM (
      SELECT emission FROM public.power_sources_emissions WHERE user_id = $1 AND "timestamp" > $2
      UNION ALL
      SELECT emission FROM public.home_appliances_emissions WHERE user_id = $1 AND "timestamp" > $2
    ) as house_emissions
    UNION ALL
    SELECT 'food' as type, SUM(emission) as total_emission
    FROM public.food_emissions
    WHERE user_id = $1 AND "timestamp" > $2
    UNION ALL
    SELECT 'flight' as type, SUM(emission) as total_emission
    FROM public.flight_emissions
    WHERE user_id = $1 AND "timestamp" > $2;
  `, [req.session.passport.user, pastDate]);

      if(userContribution.rows.length > 0){
        res.json(userContribution.rows);
      } else {
        res.status(404).json("No contribution data found.");
      }
  } catch (error) {
    console.error(err);
    res.status(500).send("Server error");
  }
});

// update username and password
router.put("/user/update", sessionChecker, async (req, res) => {
  const { username, oldPassword, newPassword } = req.body;
  try {
    // check if user exists
    const user = await pool.query("SELECT * FROM users WHERE id = $1", [
      req.session.passport.user,
    ]);
    if (!user.rows.length > 0) {
      return res.status(401).json("User not found!");
    }
    // if user only wants to update username
    if (oldPassword === "" && newPassword === "") {
      const updatedUser = await pool.query(
        "UPDATE users SET username = $1 WHERE id = $2 RETURNING *",
        [username, req.session.passport.user]
      );
      return res.json(updatedUser.rows[0]);
    }

    // check if old password is correct
    const validPassword = await bcrypt.compare(
      oldPassword,
      user.rows[0].password_hash
    );
    if (!validPassword) {
      return res.status(401).json("Invalid credentials!");
    }

    // hash password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(newPassword, salt);

    // update user
    const updatedUser = await pool.query(
      "UPDATE users SET username = $1, password_hash = $2 WHERE id = $3 RETURNING *",
      [username, hashedPassword, req.session.passport.user]
    );

    res.json(updatedUser.rows[0]);
  } catch (error) {
    console.log(error.message);
    res.status(500).json("Server error");
  }
});

module.exports = [router, sessionChecker];
