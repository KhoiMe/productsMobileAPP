const express = require('express');
const productsService = require('../services/products.service');
const router = express.Router();

router.get('/products', (req, res, next) => {
    let p = {
        productName: req.query.productName
    };

    productsService.getProduct(p, (err, result) => {
        if (err) {
            return next(err)
        }

        return res.status(200).send({
            message: "Success",
            data: result,
        })
    });
});

router.delete('/products', (req, res, next) => {
    let p = {
        productName: req.query.productName
    };

    productsService.deleteProduct(p, (err, result) => {
        if (err) {
            return next(err)
        }

        return res.status(200).send({
            message: "Success",
            data: result,
        })
    });
});

router.put('/edit-product/:id', (req, res, next) => {
    const productId = req.params.id;
    const updatedData = req.body;  

    productsService.updateProduct(productId, updatedData, (err, updatedProduct) => {
        if (err) {
            return res.status(400).json({ message: err.message });
        }

        res.status(200).json({
            message: "Product updated successfully",
            product: updatedProduct,
        });
    });
});

router.post('/add-products', (req, res, next) => {
    let p = {
        productName: req.body.productName,
        productDescription: req.body.productDescription,
        productPrice: req.body.productPrice,
        productImage: req.body.productImage
    };

    productsService.createProduct(p, (err, result) => {
        if (err) {
            return next(err)
        }

        return res.status(200).send({
            message: "Success",
            data: result,
        })
    });
});

module.exports = router;
