import { injectable, inject } from "inversify";
import { DriversService } from "../services/drivers.service";
import { TYPES } from "../types";
import { Request } from "express";
import Driver from "../models/drivers.model";

@injectable()
export class DriversController {
  private readonly driversService: DriversService;

  constructor(@inject(TYPES.DriversService) _driversService: DriversService) {
    this.driversService = _driversService;
  }

  public createDriver = async (req: Request) => {
    const { id, identification, lastName, firstName, phone, address } =
      req.body;

    if (
      !id ||
      !identification ||
      !lastName ||
      !firstName ||
      !phone ||
      !address
    ) {
      throw { message: "Missing parameters" };
    }

    const existDriverId = await this.driversService.doesDriverExist(<number>id);
    if (!existDriverId) {
      const driverData: Partial<Driver> = {
        id: Number(id),
        identification: String(identification),
        lastName: String(lastName),
        firstName: String(firstName),
        phone: String(phone),
        address: String(address),
      };
      return {
        status: true,
        newDriver: await this.driversService.createDrivers(driverData),
      };
    }
    return {
      status: false,
      message: "Driver already exists",
    };
  };

  public getDriversVehicles = async (req: Request) => {
    const { userId } = req.params;
    if (!userId) {
      throw { message: "Missing parameters" };
    }
    return {
      status: true,
      vehicles: await this.driversService.getDriversVehicles(Number(userId)),
    };
  };

  public disassociateVehicles = async (req: Request) => {
    const { userId } = req.params;
    const { vehicles = [] }: { vehicles: number[] } = req.body;
    if (!userId || !vehicles || vehicles?.length === 0) {
      throw { message: "Missing parameters" };
    }
    const idUser = Number(userId);
    const vehicleUnassignedOrNonExistent = await this.validateDriverVehicles(
      vehicles,
      idUser
    );
    if (vehicleUnassignedOrNonExistent) {
      return {
        status: false,
        message: "One or more vehicles are already unassigned or do not exist",
      };
    }
    await Promise.all(
      vehicles.map((vehicleId) => this.driversService.deleteDriverId(vehicleId))
    );
    return { status: true };
  };

  public getAllDrivers = async () => {
    return await this.driversService.getAllDrivers();
  };

  private validateDriverVehicles = async (
    vehicles: number[],
    userId: number
  ) => {
    for (const vehicleId of vehicles) {
      if (
        !(await this.driversService.doesVehicleExist(<number>vehicleId)) ||
        !(await this.driversService.doesVehicleAssigned(
          <number>vehicleId,
          userId
        ))
      ) {
        return true;
      }
    }
    return false;
  };
}
