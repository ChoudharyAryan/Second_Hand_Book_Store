const jwt = require("jsonwebtoken");

const auth = async (req, res, next) => {
    try {
        console.log(`COMMING AUTH MIDDLEWARE`);
        const token = req.header("auth_token");
        if (!token) {
            return res.status(401).json({ msg: "Not authenticated!, acess denied" });}
            const verified = jwt.verify(token, "passKey");
            if (!verified)
                return res
                    .status(401)
                    .json({ msg: "Verification failed!,authorization denied" });
        req.user = verified.id;
        req.token = token;  
        next();
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
};

module.exports = auth;
