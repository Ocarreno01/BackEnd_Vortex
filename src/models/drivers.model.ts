import { Table, Column, Model, DataType } from "sequelize-typescript";

@Table({
  tableName: "drivers",
})
class Driver extends Model {
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  })
  id!: number;

  @Column({
    type: DataType.STRING(11),
    allowNull: false,
  })
  identification!: string;

  @Column({
    type: DataType.STRING(20),
    allowNull: false,
    field: "last_name",
  })
  lastName!: string;

  @Column({
    type: DataType.STRING(20),
    allowNull: false,
    field: "first_name",
  })
  firstName!: string;

  @Column(DataType.STRING(10))
  phone?: string;

  @Column(DataType.STRING(50))
  address?: string;

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
export default Driver;
