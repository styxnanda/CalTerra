const express = require("express");
const router = express.Router();
const pool = require("../db.js");
const xlsx = require("xlsx");
const sessionChecker  = require("./account.js")

// const baseURI = "/calculation";

var vehicle_emission_factor = [];
var airport_list = [];
var food_emission_factor = [];
var home_appliances_emission_factor = [];


// try {
//     // read vehicle emission factor
//     const workbook = xlsx.readFile("./assets/vehicle_emission_factor.xlsx"); 
//     const sheet_name_list = workbook.SheetNames;
//     const xlData = xlsx.utils.sheet_to_json(workbook.Sheets[sheet_name_list[0]]);
//     xlData.forEach((data) => {
//         vehicle_emission_factor.push(data);
//     });

//     // read airport list
//     const airport_list_workbook = xlsx.readFile("./assets/iata-airport.xlsx");
//     const airport_list_sheet_name_list = airport_list_workbook.SheetNames;
//     const airport_list_xlData = xlsx.utils.sheet_to_json(airport_list_workbook.Sheets[airport_list_sheet_name_list[0]]);
//     airport_list_xlData.forEach((data) => {
//         airport_list.push(data);
//     });

//     // read food emission factor
//     const food_emission_factor_workbook = xlsx.readFile("./assets/food_emission_factor.xlsx");
//     const food_emission_factor_sheet_name_list = food_emission_factor_workbook.SheetNames;
//     const food_emission_factor_xlData = xlsx.utils.sheet_to_json(food_emission_factor_workbook.Sheets[food_emission_factor_sheet_name_list[0]]);
//     food_emission_factor_xlData.forEach((data) => {
//         food_emission_factor.push(data);
//     });

//     // read home appliances emission factor
//     const home_appliances_emission_factor_workbook = xlsx.readFile("./assets/home_appliances_emission_factor.xlsx");
//     const home_appliances_emission_factor_sheet_name_list = home_appliances_emission_factor_workbook.SheetNames;
//     const home_appliances_emission_factor_xlData = xlsx.utils.sheet_to_json(home_appliances_emission_factor_workbook.Sheets[home_appliances_emission_factor_sheet_name_list[0]]);
//     home_appliances_emission_factor_xlData.forEach((data) => {
//         home_appliances_emission_factor.push(data);
//     });
    

// } catch (err) {
//     console.error(err.message);
//     // handle the exception here
// }

pool.query("SELECT * FROM vehicle_emission_factor", (err, res) => {
    if (err) {
        console.error(err.message);
        return;
    }
    vehicle_emission_factor = res.rows;
});

pool.query("SELECT * FROM airport", (err, res) => {
    if (err) {
        console.error(err.message);
        return;
    }
    airport_list = res.rows;
});

pool.query("SELECT * FROM food_emission_factor", (err, res) => {
    if (err) {
        console.error(err.message);
        return;
    }
    food_emission_factor = res.rows;
});

pool.query("SELECT * FROM home_appliances_emission_factor", (err, res) => {
    if (err) {
        console.error(err.message);
        return;
    }
    home_appliances_emission_factor = res.rows;
});


// calculate distance with lattitude and longitude between two locations
const distanceCalc = (lat1, lon1, lat2, lon2) => {
    const deg2rad = (deg) => {
        return deg * (Math.PI / 180);
    };

    const R = 6371; // Radius of the earth in km
    const dLat = deg2rad(lat2 - lat1); // deg2rad below
    const dLon = deg2rad(lon2 - lon1);
    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
    + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2))
    * Math.sin(dLon / 2) * Math.sin(dLon / 2); 
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    return R * c; // Distance in km
};


// session error
router.get("/sessionError", (req, res) => {
    res.status(401).json({
      success: false,
      message: "User not logged in or session expired",
    });
});

// get airport
router.get("/airport", async (req, res) => {
    try{
        const airport = await pool.query(
            "SELECT iata, airport FROM airport WHERE country_code IN ('ID', 'MY', 'SG', 'PH', 'SA')"
        );
        res.json(
            airport.rows
        );
    }
    catch(err){
        console.error(err.message);
        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
});

// vehicle emission calculation
router.post("/vehicle", sessionChecker, async (req, res) => {
    // current year and month
    const currentYearMonth = new Date().toISOString().slice(0, 7);
    // console.log(vehicle_emission_factor);

    try {
        let { vehicle_type, distance, fuel_type, vehicle_size } = req.body;
        let emission_factor = 0;
        let carbon_emission = 0;
        let filter_data = vehicle_emission_factor.filter((data) => data.vehicle_type == vehicle_type && data.fuel_type == fuel_type && data.vehicle_size == vehicle_size);
        // console.log(filter_data);

        emission_factor = filter_data[0].factor; 
        carbon_emission = emission_factor * distance;

         // check if user has current year and month record
         const userMonthlyEmission = await pool.query(
            "SELECT * FROM user_monthly_emissions WHERE user_id = $1 AND year_month = to_date($2, 'YYYY-MM')",
            [req.session.passport.user, currentYearMonth]
        );
        if (userMonthlyEmission.rows.length === 0) {
            // create new user current monthly emission to db
            await pool.query(
                "INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *",
                [req.session.passport.user, currentYearMonth, 0]
            );
        }
        // else, update the current monthly emission
        const currentMonthlyEmission =  await pool.query(
            "UPDATE user_monthly_emissions SET monthly_total_emission = monthly_total_emission + $1 WHERE user_id = $2 AND year_month = to_date($3, 'YYYY-MM')",
            [carbon_emission, req.session.passport.user, currentYearMonth]
        );

        const vehicle_emission = await pool.query(
            "INSERT INTO vehicle_emissions (user_id, vehicle_type, distance, fuel_type, emission) VALUES ($1, $2, $3, $4, $5) RETURNING *",
            [req.session.passport.user, vehicle_type, distance, fuel_type, carbon_emission]
        );

        res.json({
            success: true,
            message: "Vehicle carbon emission calculated successfully",
            data: {
                current_monthly_emission: currentMonthlyEmission.rows[0],
                vehicle_emissions: vehicle_emission.rows[0],
            },
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
});

// flight emission calculation
router.post("/flight", sessionChecker, async (req, res) => {
    const currentYearMonth = new Date().toISOString().slice(0, 7);
    try {
        let { from, to, trip_type, distance_op, flight_class } = req.body;
        let carbon_emission = 0;
        let distance = 0;
        if (from != null && to != null) {
            let filter_data = airport_list.filter((data) => data.iata == from);
            let from_lat = filter_data[0].latitude;
            let from_lon = filter_data[0].longitude;
            filter_data = airport_list.filter((data) => data.iata == to);
            let to_lat = filter_data[0].latitude;
            let to_lon = filter_data[0].longitude;
            distance = distanceCalc(from_lat, from_lon, to_lat, to_lon); 
        } else {
            distance = distance_op;
        }

        if (flight_class == "economy") {
            carbon_emission = 0.158 * distance;
        } else if (flight_class == "business") {
            carbon_emission = 0.209 * distance;
        } else if (flight_class == "first") {
            carbon_emission = 0.263 * distance;
        }
        if (trip_type == "round") {
            carbon_emission = carbon_emission * 2;
        }

        // check if user has current year and month record
        const userMonthlyEmission = await pool.query(
            "SELECT * FROM user_monthly_emissions WHERE user_id = $1 AND year_month = to_date($2, 'YYYY-MM')",
            [req.session.passport.user, currentYearMonth]
        );
        if (userMonthlyEmission.rows.length === 0) {
            // create new user current monthly emission to db
            await pool.query(
                "INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *",
                [req.session.passport.user, currentYearMonth, 0]
            );
        }
        // else, update the current monthly emission
        const currentMonthlyEmission =  await pool.query(
            "UPDATE user_monthly_emissions SET monthly_total_emission = monthly_total_emission + $1 WHERE user_id = $2 AND year_month = to_date($3, 'YYYY-MM')",
            [carbon_emission, req.session.passport.user, currentYearMonth]
        );

        const flight_emissions = await pool.query(
            "INSERT INTO flight_emissions (user_id, departure_airport, destination_airport, flight_distance, emission) VALUES ($1, $2, $3, $4, $5) RETURNING *",
            [req.session.passport.user, from, to, distance, carbon_emission]
        );

        res.json({
            success: true,
            message: "Flight carbon emission calculated successfully",
            data: {
                current_monthly_emission: currentMonthlyEmission.rows[0],
                flight_contributors: flight_emissions.rows[0],
            },
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
});

// power sources emission calculation
router.post("/power_sources", sessionChecker, async (req, res) => {
    const currentYearMonth = new Date().toISOString().slice(0, 7);
    try {
        let { power_sources_type, usage } = req.body; // power sources type: electricity, gas, water
        let carbon_emission = 0;
        switch(power_sources_type){
            case "electricity":
                carbon_emission = 0.6745 * usage; // in Kwh
                break;
            case "gas":
                carbon_emission = 2.02135 * usage; // in m3
                break;
            case "water":
                carbon_emission = 0.14900 * usage; // in m3
                break;
            default:
                break;
        }

        // check if user has current year and month record
        const userMonthlyEmission = await pool.query(
            "SELECT * FROM user_monthly_emissions WHERE user_id = $1 AND year_month = to_date($2, 'YYYY-MM')",
            [req.session.passport.user, currentYearMonth]
        );
        if (userMonthlyEmission.rows.length === 0) {
            // create new user current monthly emission to db
            await pool.query(
                "INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *",
                [req.session.passport.user, currentYearMonth, 0]
            );
        }
        // else, update the current monthly emission
        const currentMonthlyEmission =  await pool.query(
            "UPDATE user_monthly_emissions SET monthly_total_emission = monthly_total_emission + $1 WHERE user_id = $2 AND year_month = to_date($3, 'YYYY-MM')",
            [carbon_emission, req.session.passport.user, currentYearMonth]
        );

        const power_sources_emissions = await pool.query(
            "INSERT INTO power_sources_emissions (user_id, power_source_type, usage_kwh, emission) VALUES ($1, $2, $3, $4) RETURNING *",
            [req.session.passport.user, power_sources_type, usage, carbon_emission]
        );

        res.json({
            success: true,
            message: "Power sources carbon emission calculated successfully",
            data: {
                current_monthly_emission: currentMonthlyEmission.rows[0],
                power_sources_emissions: power_sources_emissions.rows[0],
            },
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
});


// home appliances emission calculation
router.post("/home_appliances", sessionChecker, async (req, res) => {
    const currentYearMonth = new Date().toISOString().slice(0, 7);
    try {
        let { appliances_type, duration_or_cycles } = req.body;
        let carbon_emission = 0;
        let filter_data = home_appliances_emission_factor.filter((data) => data.appliances_type == appliances_type);
        // console.log(filter_data);
        carbon_emission = filter_data[0].factor * duration_or_cycles;
        switch (filter_data[0].unit_count) {
            case "hours":
                break;
            case "cycles":
                break;
            default:
                break;
        }
        // check if user has current year and month record
        const userMonthlyEmission = await pool.query(
            "SELECT * FROM user_monthly_emissions WHERE user_id = $1 AND year_month = to_date($2, 'YYYY-MM')",
            [req.session.passport.user, currentYearMonth]
        );
        if (userMonthlyEmission.rows.length === 0) {
            // create new user current monthly emission to db
            await pool.query(
                "INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *",
                [req.session.passport.user, currentYearMonth, 0]
            );
        }
        // else, update the current monthly emission
        const currentMonthlyEmission =  await pool.query(
            "UPDATE user_monthly_emissions SET monthly_total_emission = monthly_total_emission + $1 WHERE user_id = $2 AND year_month = to_date($3, 'YYYY-MM')",
            [carbon_emission, req.session.passport.user, currentYearMonth]
        );

        const home_appliances_emissions = await pool.query(
            "INSERT INTO home_appliances_emissions (user_id, appliance_type, duration_hours, emission) VALUES ($1, $2, $3, $4) RETURNING *",
            [req.session.passport.user, appliances_type, duration_or_cycles, carbon_emission]
        );

        res.json({
            success: true,
            message: "Home appliances carbon emission calculated successfully",
            data: {
                current_monthly_emission: currentMonthlyEmission.rows[0],
                home_appliances_emission: home_appliances_emissions.rows[0],
            },
        })
        
    } catch (err) {
        console.error(err.message);
        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
});

// food emission calculation
router.post("/food", sessionChecker, async (req, res) => {
    const currentYearMonth = new Date().toISOString().slice(0, 7);
    try {
        let { food_type } = req.body;
        let carbon_emission = 0;

        let filter_data = food_emission_factor.filter((data) => data.food_type == food_type);
        carbon_emission = filter_data[0].factor;

        // check if user has current year and month record
        const userMonthlyEmission = await pool.query(
            "SELECT * FROM user_monthly_emissions WHERE user_id = $1 AND year_month = to_date($2, 'YYYY-MM')",
            [req.session.passport.user, currentYearMonth]
        );
        if (userMonthlyEmission.rows.length === 0) {
            // create new user current monthly emission to db
            await pool.query(
                "INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *",
                [req.session.passport.user, currentYearMonth, 0]
            );
        }
        // else, update the current monthly emission
        const currentMonthlyEmission =  await pool.query(
            "UPDATE user_monthly_emissions SET monthly_total_emission = monthly_total_emission + $1 WHERE user_id = $2 AND year_month = to_date($3, 'YYYY-MM')",
            [carbon_emission, req.session.passport.user, currentYearMonth]
        );

        const food_emissions = await pool.query(
            "INSERT INTO food_emissions (user_id, food_type, emission) VALUES ($1, $2, $3) RETURNING *",
            [req.session.passport.user, food_type, carbon_emission]
        );

        res.json({
            success: true,
            message: "Food carbon emission calculated successfully",
            data: {
                current_monthly_emission: currentMonthlyEmission.rows[0],
                food_emissions: food_emissions.rows[0],
            },
        });
    } catch (err) {
        console.error(err.message);
        res.status(500).json({
            success: false,
            message: "Server Error"
        });
    }
});

module.exports = router;
