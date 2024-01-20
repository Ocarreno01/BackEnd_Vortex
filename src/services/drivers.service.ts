import { injectable } from "inversify";
import Driver from "../models/drivers.model";
import Vehicle from "../models/vehicles.model";

@injectable()
export class DriversService {
  public async createDrivers(driverData: Partial<Driver>): Promise<Driver> {
    return await Driver.create(driverData);
  }

  public async doesDriverExist(driverId: number): Promise<boolean> {
    const driver = await Driver.findByPk(driverId);
    return !!driver;
  }

  public async getDriversVehicles(driverId: number): Promise<Vehicle[]> {
    return await Vehicle.findAll({
      where: {
        conductor_id: driverId,
      },
    });
  }

  public async doesVehicleExist(vehicleId: number): Promise<boolean> {
    const vehicle = await Vehicle.findByPk(vehicleId);
    return !!vehicle;
  }

  public async doesVehicleAssigned(
    vehicleId: number,
    idUser: number
  ): Promise<boolean> {
    const vehicle = await Vehicle.findByPk(vehicleId);
    return vehicle?.conductor_id === idUser;
  }

  public async deleteDriverId(vehicleId: number): Promise<void> {
    const existingVehicle = await Vehicle.findByPk(vehicleId);
    if (existingVehicle) {
      await existingVehicle.update({ conductor_id: null });
    }
    return;
  }

  public async getAllDrivers(): Promise<Driver[]> {
    return await Driver.findAll();
  }
}
