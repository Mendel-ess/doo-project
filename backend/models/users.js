import { sequelize } from "../database/database.js";
import { DataTypes } from "sequelize";
import { users_review } from "./users_review.js";

export const users = sequelize.define("users", {
    id : {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    username: {
        type: DataTypes.TEXT,
    },
    password: {
        type: DataTypes.TEXT,
    },
    email: {
        type: DataTypes.TEXT,
    },
    
}, {
    timestamps: false
});
