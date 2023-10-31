const express = require('express');
const session = require('express-session');
const passport = require('passport');
const cors = require('cors');
const connect_pg = require('connect-pg-simple');
const account_router = require('./src/routes/account.js');
const calculation_router = require('./src/routes/calculation.js');
const leaderboard_router = require('./src/routes/leaderboard.js');
require('./src/passport.js')

const pool = require('./src/db.js');

const app = express();
const PosgresStore = connect_pg(session);
const sessionStore = new PosgresStore({
    pool: pool,
    tableName: "session",
});

// for .env file
require('dotenv').config();


app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(session({
    secret: 'your-secret-key',
    //create cookie with max age 1 week
    cookie: { 
        maxAge: 7 * 24 * 60 * 60 * 1000, 
        secure: 'auto',
        sameSite: 'lax',
    },
    resave: false,
    saveUninitialized: true,
    store: sessionStore,
}));

// use cors
app.use(cors({
    origin: process.env.CLIENT_URL,
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
}));

// initialize passport
app.use(passport.initialize());
app.use(passport.session());


const port = 4322;

const router = express.Router();

router.get('/', (req, res) => {
    res.send('Calterra Backend');
});

app.use('/', router);
app.use('/account', account_router);
app.use('/calculation', calculation_router);
app.use('/leaderboard', leaderboard_router);


app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
