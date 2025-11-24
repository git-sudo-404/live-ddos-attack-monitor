import express, { type Request, type Response } from "express";
const router = express.Router();

router.get("/last-24hr", (req: Request, res: Response) => {
  res.status(200).send("Last 24hr attacks");
});

export default router;
