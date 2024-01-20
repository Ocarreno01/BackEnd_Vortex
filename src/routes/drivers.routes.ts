import { Router } from "express";
import { injectable } from "inversify";
import { DriversController } from "../controllers/drivers.controller";
import { TYPES } from "../types";
import { asyncHandler } from "../middlewares/asyncHandler";
import container from "../inversify.config";

@injectable()
export class DriversRoutes {
  private readonly _router: Router;
  private readonly driversController: DriversController;

  constructor() {
    this._router = Router();

    this.driversController = container.get<DriversController>(
      TYPES.DriversController
    );

    this._router.post(
      "/create",
      asyncHandler(this.driversController.createDriver)
    );
    this._router.get(
      "/getDriversVehicles/:userId",
      asyncHandler(this.driversController.getDriversVehicles)
    );
    this._router.post(
      "/disassociateVehicles/:userId",
      asyncHandler(this.driversController.disassociateVehicles)
    );
  }

  get driverRouter(): Router {
    return this._router;
  }
}
