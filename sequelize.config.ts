import { Sequelize } from "sequelize-typescript";
import * as dotenv from "dotenv";

dotenv.config();
const sequelize = new Sequelize({
  dialect: "postgres",
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT),
  username: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  models: [__dirname + "/src/models"],
  storage: ":memory:",
  logging: false,
});
export default sequelize;
