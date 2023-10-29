const passport = require("passport");
const bcrypt = require("bcryptjs");
const pool = require("./db");

const LocalStrategy = require("passport-local").Strategy;

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

            // return user
            return done(null, user.rows[0]);
        } catch (error) {
            return done(error);
        }
    })
);

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

