import { Container } from "inversify";
import { DriversService } from "./services/drivers.service";
import { VehiclesService } from "./services/vehicles.service";
import { DriversController } from "./controllers/drivers.controller";
import { VehiclesController } from "./controllers/vehicles.controller";
import { DriversRoutes } from "./routes/drivers.routes";
import { VehiclesRoutes } from "./routes/vehicles.routes";
import { TYPES } from "./types";

const container = new Container();

// Servicios
container.bind<DriversService>(TYPES.DriversService).to(DriversService);
container.bind<VehiclesService>(TYPES.VehiclesService).to(VehiclesService);

// Controladores
container
  .bind<DriversController>(TYPES.DriversController)
  .to(DriversController);
container
  .bind<VehiclesController>(TYPES.VehiclesController)
  .to(VehiclesController);

// Rutas
container.bind<DriversRoutes>(TYPES.DriversRoutes).to(DriversRoutes);
container.bind<VehiclesRoutes>(TYPES.VehiclesRoutes).to(VehiclesRoutes);

export default container;
