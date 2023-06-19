const express = require('express');
const productRouter = express.Router();
const Product = require('../models/product');
const auth = require('../middlewares/auth');
const ratingSchema = require('../models/rating');

//FETCHING ALL PRODUCT OF A CATEGORY
productRouter.get('/api/products',auth, async (req,res) => {
    try{  
        const products = await  Product.find({category: req.query.category});
        res.json(products);        
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});

//SEARCHING FOR PRODUCT
productRouter.get('/api/products/search/:name',auth, async (req,res) => {
    try{       
        const products = await  Product.find({
            name: {$regex: req.params.name, $options: "i"},
        });
        res.json(products);        
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});


//RATING PRODUCT
productRouter.post('/api/rate-product',auth, async (req,res) => {
    try {
        console.log(`COMMING IN PRODUCT>JS FILE`);
        const {id,rating} = req.body;
        let product = await Product.findById(id);
        for(let i = 0; i<product.ratings.length;i++){
            if(product.ratings[i].userId == req.user){
                product.ratings.splice(i,1);
                break;
            }
        }
        const ratingSchema = {
            userId: req.user,
            rating:rating
        }

        product.ratings.push(ratingSchema);
        product = await product.save();
        res.json(product);

    } catch(e) {
        res.status(500).json({error:e.message});
    }
});




module.exports = productRouter;