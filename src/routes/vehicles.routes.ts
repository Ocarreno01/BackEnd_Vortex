import { Router } from "express";
import { injectable } from "inversify";
import { VehiclesController } from "../controllers/vehicles.controller";
import { TYPES } from "../types";
import { asyncHandler } from "../middlewares/asyncHandler";
import container from "../inversify.config";

@injectable()
export class VehiclesRoutes {
  private readonly _router: Router;
  private readonly vehiclesController: VehiclesController;

  constructor() {
    this._router = Router();

    this.vehiclesController = container.get<VehiclesController>(
      TYPES.VehiclesController
    );

    this._router.post(
      "/create",
      asyncHandler(this.vehiclesController.createVehicle)
    );

    this._router.get(
      "/getVehiclesWithoutDriver",
      asyncHandler(this.vehiclesController.getVehiclesWithoutDriver)
    );

    this._router.post(
      "/associateVehicles/:userId",
      asyncHandler(this.vehiclesController.associateVehicles)
    );
  }

  get vehicleRouter(): Router {
    return this._router;
  }
}
