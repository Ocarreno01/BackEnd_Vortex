import { Table, Column, Model, DataType } from "sequelize-typescript";

@Table({
  tableName: "parameters",
})
class Parameter extends Model {
  @Column({
    type: DataType.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  })
  id!: number;

  @Column({
    type: DataType.STRING(50),
    allowNull: false,
    unique: true,
    field: "name",
  })
  name!: string;

  @Column(DataType.TEXT)
  value?: string;

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
export default Parameter;
