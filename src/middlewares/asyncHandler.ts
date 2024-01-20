import { Request, Response, NextFunction } from "express";

export const asyncHandler =
  (fn: Function) => async (req: Request, res: Response, next: NextFunction) => {
    try {
      const result = await fn(req, res, next);
      res.status(200).json(result);
    } catch (error) {
      console.error("Error:", error);
      res.status(500).json({ message: "Internal Server Error" });
    }
  };
