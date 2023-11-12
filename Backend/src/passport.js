const passport = require("passport");
const bcrypt = require("bcryptjs");
const pool = require("./db");

const LocalStrategy = require("passport-local").Strategy;
// const GoogleTokenStrategy = require("passport-google-id-token").Strategy;

// Local strategy
passport.use(
    new LocalStrategy(async (username, password, done) => {
        try {
            // check if user exists
            const user = await pool.query("SELECT * FROM users WHERE username = $1", [
                username,
            ]);
            if (user.rows.length === 0) {
                return done(null, false);
            }

            // check if password is correct
            const validPassword = await bcrypt.compare(password, user.rows[0].password_hash);
            if (!validPassword) {
                return done(null, false);
            }

            // get current year and month
            const currentYearMonth = new Date().toISOString().slice(0, 7);

            // check if user has current year and month record
            const userMonthlyEmission = await pool.query(
                "SELECT * FROM user_monthly_emissions WHERE user_id = $1 AND year_month = to_date($2, 'YYYY-MM')",
                [user.rows[0].id, currentYearMonth]
            );
            if (userMonthlyEmission.rows.length === 0) {
                // create new user current monthly emission to db
                await pool.query(
                    `INSERT INTO user_monthly_emissions (user_id, year_month, monthly_total_emission) 
                    VALUES ($1, to_date($2, 'YYYY-MM'), $3) RETURNING *`,
                    [user.rows[0].id, currentYearMonth, 0]
                );
            }
            // return user
            return done(null, user.rows[0]);
        } catch (error) {
            return done(error);
        }
    })
);

// Google token strategy
// passport.use(
//     new GoogleTokenStrategy(
//         {
//             clientID: process.env.GOOGLE_CLIENT_ID,
//         },
//         async (parsedToken, googleId, done) => {
//             let account = parsedToken.payload;
//             let user = {};
//             try {
//                 // check if user exists
//                 user = await pool.query("SELECT * FROM users WHERE email = $1", [
//                     account.email,
//                 ]);
//                 if (user.rows.length === 0) {
//                     // create new user
//                     const newUser = await pool.query(
//                         "INSERT INTO users (username, name, email) VALUES ($1, $2, $3) RETURNING *",
//                         [account.username, account.name, account.email]
//                     );
//                     return done(null, newUser.rows[0]);
//                 }

//                 // return user
//                 return done(null, user.rows[0]);
//             } catch (error) {
//                 return done(error);
//             }
//         }
//     )
// );

// serialize user
passport.serializeUser((user, done) => {
    done(null, user.id);
});

// deserialize user
passport.deserializeUser(async (id, done) => {
    try {
        const user = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
        done(null, user.rows[0]);
    } catch (error) {
        done(error);
    }
});

