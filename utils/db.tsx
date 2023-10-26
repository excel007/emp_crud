import mysql, { ConnectionOptions } from 'mysql2';

export const mysqlaccess: ConnectionOptions = {
    user: 'root',
    database: 'hr',
    password: '123456',
    host: 'localhost',
    port: 3306,
    multipleStatements: false,    
    // rowsAsArray: true,

  };