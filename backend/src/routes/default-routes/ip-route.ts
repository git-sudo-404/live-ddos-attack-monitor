import express, { type Request, type Response } from "express";

const router = express.Router();

router.get("/:ip", (req: Request, res: Response) => {
  const ip = req.params.ip;
  res.status(200).send(`Got ip is : ${ip}`);
});

export default router;
