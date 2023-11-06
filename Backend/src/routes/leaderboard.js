const express = require("express");
const router = express.Router();
const pool = require("../db.js");
const sessionChecker = require("./account.js");

// Get latest leaderboard top 10 based on least emission
router.get("/", sessionChecker, async (req, res) => {
  try {
    const users = await pool.query(`WITH LatestEmissions AS (
            SELECT
              user_id,
              total_emission,
              ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY date DESC) as rn
            FROM 
              carbon_footprints
          )
          SELECT
            u.id,
            u.username,
            u.name,
            le.total_emission
          FROM 
            users u
          JOIN 
            LatestEmissions le ON u.id = le.user_id
          WHERE 
            le.rn = 1
          ORDER BY 
            le.total_emission ASC;`);
    res.json(users.rows);
  } catch (e) {
    console.log(e.message);
    res.status(500).json("Error fetching.");
  }
});

module.exports = router;
