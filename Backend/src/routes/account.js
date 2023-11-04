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
    if (!user){
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
  req.logout(err => {
    if (err) throw err;
    else{
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
      res.redirect(baseURI+'/sessionError');
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
      const user = await pool.query("SELECT * FROM users WHERE id = $1", [req.session.passport.user]);
      res.json(user.rows[0]);
  } catch (error) {
      console.log(error.message);
      res.status(500).json("Server error");
  }
});

module.exports = [router, sessionChecker];