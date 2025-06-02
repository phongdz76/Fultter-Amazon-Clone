// IMPORTS FROM PACKAGES
const express = require('express');

// IMPORTS FROM OTHERS FILES
const authRouter = require("./routes/auth");

// middleware
// CLIENT -> SERVER -> CLIENT

// INIT
const PORT = 5500;
const app = express();

app.listen(PORT,  () => {
    console.log(`connected at port ${PORT}`);
});


