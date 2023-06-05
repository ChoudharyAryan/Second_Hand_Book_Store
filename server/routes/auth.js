const express = require('express');
const User = require('../models/user');

const authRouter = express.Router();

authRouter.post("/api/signup", async (req,res) => {
    try{
        const {name,email,password} = req.body;

        const existingUser = await User.findOne({email: email});
        if(existingUser){
            return res.status(400).json({msg:'User already exists!'});
        }
    
        let user =  new User({
            email,
            password,
            name
        }); 
        user = await user.save();
        res.json({user: user});
    } catch(e) {
        res.status(500).json({error : e.message});
    }



});

module.exports = authRouter