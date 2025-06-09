import express from "express";
import User from "../models/User.js";
import bcrypt from "bcryptjs";

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

    if (password !== user.password) {
      return res.status(400).json({ msg: "Incorrect password." });
    }

    res.json({ user, msg: "Login successful!" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// TOKEN VALIDATION
authRouter.post("/api/tokenIsValid", async (req, res) => {
  try {
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// GET USER DATA
authRouter.get("/api/user", async (req, res) => {
  try {
    res.json({ msg: "User data endpoint" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// TEST ROUTE
authRouter.get("/api/test", (req, res) => {
  res.json({ msg: "Auth router is working!" });
});

export default authRouter;