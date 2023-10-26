import { NextResponse } from "next/server"
import { mysqlaccess } from "@/utils/db"
import mysql, { ConnectionOptions } from 'mysql2';
// import mysql from 'mysql2/promise';

export async function GET(request: any){
  const mysql = require('mysql2/promise');
  const conn = await mysql.createConnection(mysqlaccess);
  const sql = 'SELECT * from employees where salary between ? and ? '
  const [rows, fields] = await conn.execute(sql, [2000, 5000]);
  // const [rows, fields] = await conn.query('')
  console.log(fields)
  // await conn.end();
  return NextResponse.json(rows);
}