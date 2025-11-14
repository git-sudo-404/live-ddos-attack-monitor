import express from "express";
import { type Request, type Response } from "express";
import pool from "./DB/connection.js";
import cors from "cors";

const app = express();

app.use(cors());

app.get("/api", (req: Request, res: Response) => {
  res.send("This is the Home Page Route");
});

app.get("/api/test-connection", (req: Request, res: Response) => {
  console.log("test-connection Request from Frontend");
  res.status(200).json({
    msg: "Message from Express Backend",
  });
});

export default app;
