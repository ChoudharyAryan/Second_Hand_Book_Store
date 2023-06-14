const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

const authRouter = express.Router();

//SIGN UP ROUTE
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email: email });
        if (existingUser) {
            return res.status(400).json({ msg: "User already exists!" });
        }
        const hashedPassword = await bcryptjs.hash(password, 10);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        });
        user = await user.save();
        res.json({ user: user });
    } catch (e) {
        console.log("ERROR IN AUTH.JS");
        res.status(500).json({ error: e.message });
    }
});

//SIGN IN ROUTE
authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;
        const existingUser = await User.findOne({ email: email });
        if (!existingUser) {
            return res.status(400).json({ msg: "User does not exist!" });
        }
        const isMatch = await bcryptjs.compare(password, existingUser.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Invalid credentials!" });
        }
        const token = jwt.sign({ id: existingUser._id }, "passKey");
        res.json({ token, ...existingUser._doc });
    } catch (e) {
        console.log("ERROR IN AUTH.JS SIGN IN");
        res.status(500).json({ error: e.message });
    }
});

// VALIDATING TOKEN
authRouter.post("/tokenIsValid", async (req, res) => {
    try {
        const token = req.header("auth_token");
        if (!token) return res.json(false);
        const verified = jwt.verify(token, "passKey");
        if (!verified) return res.json(false);
        const user = await User.findById(verified.id);
        if (!user) return res.json(false);
        res.json(true);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//GETING USER DATA

authRouter.get('/',auth, async (req,res) => {
    const user = await User.findById(req.user);
    res.json({...user._doc, token: req.token});
} );

module.exports = authRouter;    
