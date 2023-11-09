const express = require("express");
const router = express.Router();
const pool = require("../db.js");
const sessionChecker = require("./account.js");

// Get latest leaderboard top 10 based on least total emission
router.get("/", sessionChecker, async (req, res) => {
  try {
    const users = await pool.query(`WITH LatestUserEmissions AS (
      SELECT
        user_id,
        monthly_total_emission,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY year_month DESC) as rn
      FROM 
        user_monthly_emissions
    )
    SELECT
      u.id,
      u.username,
      u.name,
      lue.monthly_total_emission
    FROM 
      users u
    JOIN 
      LatestUserEmissions lue ON u.id = lue.user_id
    WHERE 
      lue.rn = 1
    ORDER BY 
      lue.monthly_total_emission ASC
    LIMIT 10;`);
    res.json(users.rows);
  } catch (e) {
    console.log(e.message);
    res.status(500).json("Error fetching.");
  }
});

module.exports = router;
