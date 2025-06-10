import express from "express";
import User from "../models/User.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
const authRouter = express.Router();

// SIGN UP
authRouter.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    // console.log("Received signup request:", { name, email, password });

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }
    
        const passwordHash = await bcrypt.hash(password, 6);

    let user = new User({
      email,
      password: passwordHash,
      name,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// SIGN IN
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist!" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        return res.status(400)
        .json({ msg: "Incorrect password." });
      }

    const token = jwt.sign({id: user._id,}, "passwordKey");
    res.json({token, ...user._doc});
        
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



export default authRouter;