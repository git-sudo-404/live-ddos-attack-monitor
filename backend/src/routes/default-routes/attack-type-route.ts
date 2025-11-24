import express, { type Request, type Response } from "express";

const router = express.Router();

router.get("/:attack_type", (req: Request, res: Response) => {
  const attack_type = req.params.attack_type;
  res.status(200).send(`Requested attack type : ${attack_type}`);
});

export default router;
