const express = require('express');
const router = express.Router();
const page = require('../controller/PageController');
const upload = require('../middleware/upload'); // Import your multer setup

// Define your routes
router.get('/', page.home);
router.get('/products', page.products);
router.get('/products/buy/:id', page.buyProduct);
router.post('/purchase/:id', page.processPurchase);
router.get('/addProduct', page.addProductForm);
router.post('/products/add', upload.single('image'), page.addProduct); // Handle adding a new product
router.get('/message', page.message);
router.post('/message', page.message);
router.get('/contact', page.contact);
router.get('/faqs', page.faqs);
router.get('/about', page.about);
router.get('/policies', page.policies);
router.get('/gallery', (req, res) => {
    res.render('gallery');
});
router.get('/confirmation', (req, res) => {
    res.render('confirmation'); // Render confirmation view
});

module.exports = router;
