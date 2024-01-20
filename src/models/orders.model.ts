import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
} from "sequelize-typescript";
import Driver from "./drivers.model";

@Table({
  tableName: "orders",
})
class Order extends Model {
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  })
  id!: number;

  @Column({
    type: DataType.STRING(20),
    allowNull: false,
    field: "order_type",
  })
  orderType!: string;

  @Column(DataType.STRING(50))
  address?: string;

  @ForeignKey(() => Driver)
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
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
    allowNull: false,
    field: "updated_at",
  })
  updatedAt!: Date;
}
export default Order;
