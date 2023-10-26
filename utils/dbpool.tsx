import mysql, { PoolOptions } from 'mysql2/promise';

export const mysqlaccess_pool: PoolOptions = {
    user: process.env.MYSQL_USER,
    database: process.env.MYSQL_DATABASE,
    password: process.env.MYSQL_PASSWORD,
    host: process.env.HOST,
    port: 3306,
    multipleStatements: false,    
    // rowsAsArray: true,

  };