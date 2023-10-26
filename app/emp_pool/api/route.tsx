import { NextRequest, NextResponse } from "next/server"
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

export async function GET(req: NextRequest, res: NextResponse) {
  const pool = await mysql.createPool(mysqlaccess_pool);

  if (req.method === "GET") {
    const sql = 'SELECT * from employees'
    const [rows, fields] = await pool.query(sql);

    // res.status(200).json({ employees: rows})

    return NextResponse.json({ employees: rows });
  }
}

export async function POST(req: NextRequest, res: NextResponse) {
  const pool = await mysql.createPool(mysqlaccess_pool);
  if (req.method === "POST") {
    const body = await req.json()
    const employee: Partial<emp_type> = {};
    employee.id = Math.floor(Math.random() * 1001) + 300,
    employee.first_name = body.first_name
    employee.last_name = body.last_name
    employee.email = body.email
    employee.phone_number = "650.501.2876"
    employee.hire_date = "1998-07-01"
    employee.salary = 9999
    employee.commission_pct = 0
    employee.iddepartment = 80
    employee.idmanager = 101
    employee.idjob = "IT_PROG"

    // const sql = 'insert into employees(`id`,`first_name`,`last_name`,`email`,`idjob`) values (?,?,?,?,?)'
    // const [rows, fields] = await pool.query(sql, [employee.id, employee.first_name, employee.last_name, employee.email, 'IT_PROG']);
    const sql = 'insert into employees values (?)'
    const [rows, fields] = await pool.query(sql,[employee]);
    console.log("=====Function POST=====")
    console.log(employee)
    console.log(sql)
    console.log(typeof(employee))
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