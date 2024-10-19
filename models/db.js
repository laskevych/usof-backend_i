const config = require('./../config/app.json');
const mysql = require('mysql2/promise');
const connection = mysql.createPool(config.database);

const originalQuery = connection.query;
connection.query = async function (...args) {
    const formattedQuery = args[0]
        .replace(/\s+/g, ' ')
        .trim();
    console.log('Executing SQL:', formattedQuery, args[1] ? '' : '\n');
    if (args[1]) {
        console.log('With values:', args[1], '\n');
    }
    return originalQuery.apply(this, args);
};

module.exports = connection;