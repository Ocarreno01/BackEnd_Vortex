import { injectable, inject } from "inversify";
import { Request } from "express";
import { VehiclesService } from "../services/vehicles.service";
import { TYPES } from "../types";
import Vehicle from "../models/vehicles.model";

@injectable()
export class VehiclesController {
  private readonly vehicleService: VehiclesService;

  constructor(@inject(TYPES.VehiclesService) _vehicleService: VehiclesService) {
    this.vehicleService = _vehicleService;
  }

  public createVehicle = async (req: Request) => {
    const { id, plate, ability, model } = req.body;

    if (!id || !plate || !ability || !model) {
      throw { message: "Missing parameters" };
    }
    const existVehicleId = await this.vehicleService.doesVehicleExist(
      <number>id
    );
    if (!existVehicleId) {
      const vehicleData: Partial<Vehicle> = {
        id: Number(id),
        plate: String(plate),
        ability: String(ability),
        model: String(model),
      };
      return {
        newVehicle: await this.vehicleService.createVehicles(vehicleData),
      };
    }
    return {
      status: false,
      message: "Vehicle already exists",
    };
  };

  public getVehiclesWithoutDriver = async () => {
    return {
      status: true,
      vehiclesList: await this.vehicleService.getVehiclesWithoutDriver(),
    };
  };

  public associateVehicles = async (req: Request) => {
    const { userId } = req.params;
    const { vehicles = [] }: { vehicles: number[] } = req.body;

    if (!userId || !vehicles || vehicles?.length === 0) {
      throw { message: "Missing parameters" };
    }
    const vehicleAssignedOrNonExistent = await this.validateDriverFreeVehicles(
      vehicles
    );
    if (vehicleAssignedOrNonExistent) {
      return {
        status: false,
        message: "One or more vehicles are already assigned or do not exist",
      };
    }
    await Promise.all(
      vehicles.map((vehicleId) =>
        this.vehicleService.updateDriverId(vehicleId, Number(userId))
      )
    );
    return { status: true };
  };

  private validateDriverFreeVehicles = async (vehicles: number[]) => {
    for (const vehicleId of vehicles) {
      if (
        !(await this.vehicleService.doesVehicleExist(<number>vehicleId)) ||
        (await this.vehicleService.doesVehicleAssigned(<number>vehicleId))
      ) {
        return true;
      }
    }
    return false;
  };
}
