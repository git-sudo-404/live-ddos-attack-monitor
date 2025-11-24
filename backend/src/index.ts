import app from "./server.ts";
import "dotenv/config";
import { type Request, type Response } from "express";
const PORT = process.env.PORT;

// app.get("/", (req: Request, res: Response) => {
//   res.status(200).send("Hi from the server.");
// });

app.listen(PORT, () => console.log("Server is running on PORT :  ", PORT));
