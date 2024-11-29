const { response } = require('express');
const { product } = require('../models/products.model')

async function getProduct(p, cbk) {

    let condition = {};
    const productName = p.productName;

    if (productName) {
        condition = {
            productName:
                { $regex: new RegExp(productName), $options: 'i' }
        }
    }
    product.find(condition).then((response) => {
        return cbk(null, response);
    }).catch((err) => {
        return cbk(err, null);
    });
}

async function deleteProduct(p, cbk) {
    if (!p.productName) {
        return cbk({ message: "product name is REQUIRED" }, null)
    }

    const productName = p.productName;
    const deletedProduct = await product.findOneAndDelete({ productName });
}

async function createProduct(p, cbk) {
    if (!p.productName) {
        return cbk({ message: "product name is REQUIRED" }, null)
    }

    const productModel = new product(p);

    productModel.save().then((response) => {
        return cbk(null, response);
    }).catch((err) => { return cbk(err, null) });
};

async function updateProduct(productId, p, cbk) {
    if (!productId) {
        return cbk({ message: "Product ID is REQUIRED" }, null);
    }

    if (!p.productName) {
        return cbk({ message: "Product name is REQUIRED" }, null);
    }

    try {
        // Find and update the product
        const updatedProduct = await product.findByIdAndUpdate(
            productId, // ID of the product to update
            p,         // Updated fields
            { new: true, runValidators: true } // Options to return the updated document and validate the update
        );

        if (!updatedProduct) {
            return cbk({ message: "Product not found" }, null);
        }

        return cbk(null, updatedProduct); // Success
    } catch (err) {
        return cbk(err, null); // Error handling
    }
}

module.exports = { getProduct, createProduct , deleteProduct, updateProduct}

