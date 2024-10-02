const bodyParser = require('body-parser');
const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const routes = require('./routes/router.js');
const app = express();

// Set up multer for file uploads
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'uploads/'); // Ensure this directory exists
    },
    filename: (req, file, cb) => {
        cb(null, Date.now() + '-' + file.originalname); // Create a unique filename
    }
});
const upload = multer({ storage });

// Set up middleware
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));
app.use('/uploads', express.static('uploads')); // Serve uploaded files

// Routes
app.use('/', routes); // Use the routes defined in your router

// Start server
app.listen(3026, () => {
    console.log('Server initialized on http://localhost:3026');
});
