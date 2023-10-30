const express = require("express");
const router = express.Router();
const pool = require("../db.js");
const fs = require("fs");
const xlsx = require("xlsx");

const baseURI = "/calculation";

const vehicle_emission_factor = []

// read excel file
const workbook = xlsx.readFile("./assets/vehicle_emission_factor.xlsx"); 
const sheet_name_list = workbook.SheetNames;
const xlData = xlsx.utils.sheet_to_json(workbook.Sheets[sheet_name_list[0]]);
xlData.forEach((data) => {
    vehicle_emission_factor.push(data);
});

console.log(vehicle_emission_factor[0].vehicle_type);


// session checker
const sessionChecker = (req, res, next) => {
    // console.log(req.session.passport);
    if (req.session.passport) {
        next();
    } else {
        res.redirect(baseURI +'/sessionError');
    }
};

// session error
router.get("/sessionError", (req, res) => {
    res.status(401).json({
      success: false,
      message: "User not logged in or session expired",
    });
});

router.post("/vehicle", sessionChecker, async (req, res) => {
    let { vehicle_type, distance, fuel_type, vehicle_size } = req.body;
    let emission_factor = 0;
    let carbon_emission = 0;
    let filter_data = vehicle_emission_factor.filter((data) => data.vehicle_type == vehicle_type && data.fuel_type == fuel_type && data.vehicle_size == vehicle_size);
    console.log(filter_data);

    emission_factor = filter_data[0].factor; 
    carbon_emission = emission_factor * distance;

    const carbon_footprints = await pool.query(
        "INSERT INTO carbon_footprints (user_id, total_emission) VALUES ($1, $2) RETURNING *",
        [req.session.passport.user, carbon_emission]
    );

    const vehicle_contrib = await pool.query(
        "INSERT INTO vehicle_contributors (carbon_footprint_id, vehicle_type, distance, fuel_type, vehicle_size) VALUES ($1, $2, $3, $4, $5) RETURNING *", 
        [carbon_footprints.rows[0].id, vehicle_type, distance, fuel_type, vehicle_size]);

    res.json({
        success: true,
        message: "Vehicle carbon emission calculated successfully",
        data: {
            carbon_footprints: carbon_footprints.rows[0],
            vehicle_contributors: vehicle_contrib.rows[0],
        },
    });
});

module.exports = router;
