import express from "express";
import cors from "cors";
import fs from "fs";
import path from "path";
import morgan from "morgan";
import { errorHandler } from "./middlewares/error.middleware";
import todosRouter from "./routes/todos.routes";

export function createServer() {
  const app = express();

  app.use(
    cors({
      origin: ["http://localhost:5173"], // allow frontend
      methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
      credentials: true,
    })
  );
  app.use(express.json());

  // ---------- Logging Setup (Requests/Responses) ----------
  // Ensure logs directory exists
  const logDir = path.join(__dirname, "logs");
  if (!fs.existsSync(logDir)) {
    fs.mkdirSync(logDir);
  }

  // Create a write stream for app.log
  const accessLogStream = fs.createWriteStream(
    path.join(logDir, "app.log"),
    { flags: "a" } // append mode
  );

  // Use morgan to log all HTTP requests to app.log
  app.use(morgan("combined", { stream: accessLogStream }));
  // Also log to console (optional, helps in debugging locally)
  app.use(morgan("dev"));

  // ---------- Routes ----------
  app.get("/health", (_req, res) => res.json({ ok: true }));

  app.use("/api/todos", todosRouter);

  // ---------- Error Handler ----------
  app.use(errorHandler);

  return app;
}
