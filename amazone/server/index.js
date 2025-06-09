import express from "express";
import mongoose from "mongoose";
import cors from "cors";
import authRouter from "./routes/auth.js";

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
// app.use(cors)
const DB =
  "mongodb+srv://phongnguyen07062004:Chauchau8@cluster0.6hzwav2.mongodb.net/amazon_clone?retryWrites=true&w=majority&appName=Cluster0";


// middleware
app.use(express.json());
app.use(authRouter);  
// app.use(userRouter);

// Connections
mongoose
.connect(DB)
.then(() => {
  console.log("Connection Successful");
})
.catch((e) => {
        console.log(e);
    });
    


    app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`); 
});


