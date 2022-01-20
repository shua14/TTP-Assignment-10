const Pool = require("pg").Pool;

const pool = new Pool({
    user: "postgres",
    password:"Jiao.8200",
    database: "book_database",
    host: "localhost",
    port: 5432
});

module.exports = pool;