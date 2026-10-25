import express from "express";
import { config } from "dotenv";

config();

const port = process.env.PORT || 5000
const app = express()

app.use(express.json());

app.get("/", (req, res) => {
    return res.status(200).json({ success: true, message: "all okay from express server! 😁" })
})

app.get("/new", (req, res) => {
    return res.status(200).json({ success: true, message: "this is new change 👉👉🫷👨🏻‍💼" })
})

app.get("/health", (req, res) => {
    return res.status(200).json({ success: true, message: "health all okay!" })
})

app.listen(port, () => {
    console.log("Server started at port " + port);
})