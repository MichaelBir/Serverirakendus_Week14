
const dotenv = require('dotenv');
dotenv.config(); 
const { Pool } = require('pg');

const itemsPool = new Pool ({
    connectionString: process.env.DBConnectinString ,
    ssl: {
        rejectUnauthorized: false
    }
});

module.exports = itemsPool;

/* const { Pool } = require('pg');
const itemsPool = new Pool({
    user: 'postgres',
    password: '1234',
    host: 'localhost',
    port: 5432,
    database: 'myrecipies'
});

module.exports = itemsPool; */