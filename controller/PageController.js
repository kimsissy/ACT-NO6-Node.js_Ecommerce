const fs = require('fs');
const path = require('path');
const db = require('../db'); // Import your database connection

let products = [];
let comments = []; // Declare comments array at the top

const page = {
    home: (req, res) => {
        res.render('index');
    },

    products: (req, res) => {
        db.query('SELECT * FROM Products', (err, results) => {
            if (err) {
                return res.status(500).send('Error fetching products');
            }
            products = results; // Store fetched products in the variable
            res.render('products', { products });
        });
    },

    addProductForm: (req, res) => {
        res.render('addProduct'); // Render the form to add a new product
    },

    addProduct: (req, res) => {
        const { name, description, price } = req.body;
        const numericPrice = parseFloat(price); // Convert string to float

        // Validate price
        if (isNaN(numericPrice) || numericPrice <= 0) {
            return res.status(400).send('Invalid price provided');
        }

        const image = req.file;

        if (image) {
            const imageName = `${Date.now()}_${image.originalname}`;
            const uploadPath = path.join(__dirname, '../public/images', imageName);

            // Move the uploaded file to the public/images directory
            fs.rename(image.path, uploadPath, (err) => {
                if (err) return res.status(500).send('Error uploading image');

                // Insert the new product into the database
                db.query('INSERT INTO Products (name, description, price, image) VALUES (?, ?, ?, ?)', 
                [name, description, numericPrice, `/images/${imageName}`], (err, result) => {
                    if (err) {
                        console.error('Error inserting product:', err);
                        return res.status(500).send('Error inserting product');
                    }

                    console.log('Inserted Product ID:', result.insertId);

                    // Redirect to products page after adding
                    res.redirect('/products'); 
                });
            });
        } else {
            res.status(400).send('No image uploaded'); // Handle the case where no image was uploaded
        }
    },

    buyProduct: (req, res) => {
        const productId = req.params.id;
        const productIndex = parseInt(productId, 10);

        if (!products[productIndex]) {
            return res.status(404).send('Product not found');
        }

        const product = products[productIndex];
        console.log('Product:', product);
        console.log('Product Price:', product.price);

        if (typeof product.price !== 'number') {
            console.error('Invalid product price:', product.price);
            return res.status(500).send('Internal Server Error: Invalid product price');
        }

        res.render('buyProduct', { product });
    },

    processPurchase: (req, res) => {
        const productId = req.params.id;

        if (!productId) {
            return res.status(400).send('Invalid product ID');
        }

        db.query('INSERT INTO Purchases (product_id) VALUES (?)', [productId], (err, result) => {
            if (err) {
                return res.status(500).send('Error processing purchase');
            }

            res.redirect('/confirmation');
        });
    },

    faqs: (req, res) => {
        res.render('faqs');
    },

    message: (req, res) => {
        if (req.method === 'POST') {
            const comment = req.body.comment;
            const dateTime = new Date().toLocaleString(); // Get current date and time
            comments.push({ text: comment, date: dateTime, author: 'Anonymous' }); // Store comment
            res.redirect('/message');
        } else {
            res.render('message', { comments }); // Render the message page with comments
        }
    },

    contact: (req, res) => {
        res.render('contact');
    },

    about: (req, res) => {
        res.render('about');
    },

    policies: (req, res) => {
        res.render('policies');
    }
};

module.exports = page;
