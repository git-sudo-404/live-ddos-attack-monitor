import express, { Request, Response } from "express";
import app from "./server";
app.get("/api/health", (req: Request, res: Response) => {
  res.status(200).json({ status: "ok" });
});

app.listen(8080, () => console.log("Server is listening on PORT : 8080"));
