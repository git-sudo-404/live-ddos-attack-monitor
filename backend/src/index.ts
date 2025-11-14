import express, { type Request, type Response } from "express";
import app from "./server.ts";
app.get("/api/health", (req: Request, res: Response) => {
  res.status(200).json({ status: "ok" });
});

app.listen(8080, () => console.log("Server is listening on PORT : 8080"));
