import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
} from "sequelize-typescript";
import Driver from "./drivers.model";

@Table({
  tableName: "vehicles",
})
class Vehicle extends Model {
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  })
  id!: number;

  @Column({
    type: DataType.STRING(4),
    allowNull: false,
  })
  model!: string;

  @Column(DataType.STRING(7))
  plate?: string;

  @Column(DataType.STRING(7))
  ability?: string;

  @ForeignKey(() => Driver)
  @Column({
    type: DataType.INTEGER,
    allowNull: true,
    field: "conductor_id",
  })
  conductor_id!: number;

  @Column({
    type: DataType.DATE,
    allowNull: false,
    field: "created_at",
  })
  createdAt!: Date;

  @Column({
    type: DataType.DATE,
    allowNull: true,
    field: "updated_at",
  })
  updatedAt!: Date;
}
export default Vehicle;
