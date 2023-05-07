import { sq } from "../server";
import { DataTypes } from "sequelize";

const users = sq.define("users", {
  user_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    allowNull: false,
  },
  username: {
    type: DataTypes.CHAR,
    allowNull: false,
  },
  password: {
    type: DataTypes.CHAR,
    allowNull: false,
  },
  email: {
    type: DataTypes.CHAR,
    allowNull: false,
  },
  fecha_creacion: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  fecha_actualizacion: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
});

export default users;
