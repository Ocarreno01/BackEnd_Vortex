import { injectable } from "inversify";
import Vehicle from "../models/vehicles.model";

@injectable()
export class VehiclesService {
  public async createVehicles(vehicleData: Partial<Vehicle>): Promise<Vehicle> {
    return await Vehicle.create(vehicleData);
  }

  public async getVehiclesWithoutDriver(): Promise<Vehicle[]> {
    return await Vehicle.findAll({
      where: {
        conductor_id: null,
      },
    });
  }

  public async doesVehicleExist(vehicleId: number): Promise<boolean> {
    const vehicle = await Vehicle.findByPk(vehicleId);
    return !!vehicle;
  }

  public async doesVehicleAssigned(vehicleId: number): Promise<boolean> {
    const vehicle = await Vehicle.findByPk(vehicleId);
    return !!vehicle?.conductor_id;
  }

  public async updateDriverId(
    vehicleId: number,
    driverId: number
  ): Promise<void> {
    const existingVehicle = await Vehicle.findByPk(vehicleId);
    if (existingVehicle) {
      await existingVehicle.update({ conductor_id: driverId });
    }
    return;
  }
}
