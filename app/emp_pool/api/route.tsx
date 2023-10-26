import { NextRequest , NextResponse } from "next/server"
import mysql, { PoolOptions } from 'mysql2/promise';
import { mysqlaccess_pool } from "@/utils/dbpool";
import type { NextApiRequest, NextApiResponse } from 'next'

type emp_type = {
  id: number,
  first_name: string,
  last_name: string,
  email: string,
  phone_number: string,
  hire_date: string,
  salary: number,
  commission_pct: number,
  iddepartment: number
  idmanager: number,
  idjob: string,
}

export async function GET(req: NextApiRequest, res: NextApiResponse) {
  const pool = await mysql.createPool(mysqlaccess_pool);

  if (req.method === "GET") {
    const sql = 'SELECT * from employees'
    const [rows, fields] = await pool.query(sql);
    
    // res.status(200).json({ employees: rows})
    
    return NextResponse.json({ employees: rows });
  }
}

export async function POST(req: NextApiRequest, res: NextApiResponse) {
  const pool = await mysql.createPool(mysqlaccess_pool);
  if (req.method === "POST") {

    const employee: Partial<emp_type> = {};
    employee.first_name = req.body.first_name
    employee.first_name = req.body.last_name
    employee.email = req.body.email
    // const sql = 'insert into employees(`first_name`,`last_name`,`email`) values (?,?,?)'
    const sql = 'insert into employees values (?)'
    const [rows, fields] = await pool.query(sql,[{employee}]);
    // res.status(200).json({ employees: rows})
    return NextResponse.json({ employees: rows });
  }

}

// export async function GET(request: any) {
//   const pool = await mysql.createPool(mysqlaccess_pool);

//   // const sql = 'SELECT * from employees where salary between ? and ? '
//   // const [rows, fields] = await pool.query(sql, [2000, 5000]);

//   const sql = 'SELECT * from employees'
//   const [rows, fields] = await pool.query(sql);
//   // console.log(fields)
//   return NextResponse.json(rows);
// }