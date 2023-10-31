import { NextResponse } from "next/server"
import mysql, { PoolOptions } from 'mysql2/promise';
import { mysqlaccess_pool } from "@/utils/dbpool";

export async function GET(request: Request, { params }: any) {
  const pool = await mysql.createPool(mysqlaccess_pool);

  const sql = 'SELECT * from employees where id = ?'
  const [rows, fields] = await pool.query(sql, [params.id]);
  
  // console.log(fields)
  return NextResponse.json({employee : rows});
}