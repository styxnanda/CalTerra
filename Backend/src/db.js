// for .env file
require("dotenv").config();

const { Client } = require("pg");

// connect to database using pg
const { PGHOST, PGDATABASE, PGUSER, PGPASSWORD, ENDPOINT_ID } = process.env;
const passwordDB = process.env.PGPASSWORD || null;

// const db = new Client({
//   connectionString: URL,
//   ssl: {
//     rejectUnauthorized: false,
//   },
//   idleTimeoutMillis: 0,
//   connectionTimeoutMillis: 0,
// });

const db = new Client({
  user: PGUSER,
  host: PGHOST,
  database: PGDATABASE,
  password: passwordDB,
  port: 5432,
  ssl: {
    rejectUnauthorized: false,
  },
  idleTimeoutMillis: 0,
  connectionTimeoutMillis: 0,
});

db.connect((err) => {
  try {
    console.log("Connected to DB!");
  } catch (error) {
    console.log(err);
    return;
  } 
});

module.exports = db;