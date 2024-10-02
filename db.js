const mysql = require('mysql2');

// Create a connection to the database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root', // replace with your database username
    password: '', // replace with your database password
    database: 'merchandise'
});

// Connect to the database
connection.connect((err) => {
    if (err) throw err;
    console.log('Connected to the database!');
});


// Export the connection for use in other modules
module.exports = connection;
