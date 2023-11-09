require("dotenv").config();

const express = require("express");
const router = express.Router();
// const pool = require("../db.js");
const fs = require("fs");
const Guardian = require("guardian-js").default;
const sessionChecker = require("./account.js");

const guardianApiKey = process.env.GUARDIAN_API_KEY;
const guardian = new Guardian(guardianApiKey, false);
const path = "./assets/cache/news_cache.json";

// Check for cached file
function isCacheValid(cachePath) {
  if (!fs.existsSync(cachePath)) {
    return false;
  }
  const cacheTime = fs.statSync(cachePath).mtime;
  const timeNow = new Date();
  return timeNow - cacheTime < 24 * 3600 * 1000; // Less than 24 hours of last fetching
}

function saveNewsCache(data) {
  fs.writeFileSync(path, JSON.stringify(data), "utf-8");
}

async function fetchNewsFromAPI() {
  // Fetch news from Open Platform, show thumbnails as well
  return guardian.content.search("carbon emission", {
    "show-fields": "thumbnail",
  });
}

router.get("/", sessionChecker, async (req, res) => {
  try {
    if (isCacheValid(path)) {
      const cachedNews = fs.readFileSync(path, "utf-8");
      res.send(JSON.parse(cachedNews));
    } else {
      const newsData = await fetchNewsFromAPI();
      if (newsData) {
        saveNewsCache(newsData);
        res.send(newsData.results);
      } else {
        res.status(500).send("Failed to fetch from API router.");
      }
    }
  } catch (error) {
    res.status(500).send("Error fetching news: " + error);
  }
});

module.exports = router;
