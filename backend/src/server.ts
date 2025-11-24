import express, { type Request, type Response } from "express";

import timeRoute from "./routes/default-routes/time-route.ts";
import ipRoute from "./routes/default-routes/ip-route.ts";
import geoRoute from "./routes/default-routes/geography-route.ts";
import attackTypeRoute from "./routes/default-routes/attack-type-route.ts";

const app = express();

app.get("/", (req: Request, res: Response) => {
  res.status(200).send("Hi from the server.");
});

app.use("/time", timeRoute);
app.use("/ip", ipRoute);
app.use("/geo", geoRoute);
app.use("/attack-type", attackTypeRoute);

export default app;
