import express, { type Request, type Response } from "express";

const router = express.Router();

router.get("/:country", (req: Request, res: Response) => {
  const country = req.params.country;
  res.status(200).send(`Requested country is : ${country}`);
});

export default router;
