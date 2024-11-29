const mongoose = require('mongoose');

// schema stuff

const { Schema } = mongoose;

const comSchema = new Schema(
    {
        productName: String,
        productDescription: String, 
        productPrice: Number,
        productImage: String,
    },
    { timestamps: true }
)

const product = mongoose.model('product', comSchema);

module.exports = { product }

