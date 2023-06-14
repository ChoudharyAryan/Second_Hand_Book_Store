//IMPORT FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');


//IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth.js');


//INIT
const PORT =3000;
const app = express();//INITIALIZING AND SAVING IN app VARIABLE
const DB = "mongodb+srv://ChoudharyAryan:Aryan%40123@cluster0.pdxmngy.mongodb.net/?retryWrites=true&w=majority"


app.use(express.json());
app.use(authRouter);//MIDDLEWARE

//CONNECTIONS
mongoose.connect(DB).then(() => {
    console.log("CONNECTION DONE");
}).catch((e) => {
    console.log('ERROR IN INDEX.JS');
    console.log(e);
});

app.listen(PORT ,"0.0.0.0", () => {
    console.log(`Connected at port ${PORT} HELLO`);
})


