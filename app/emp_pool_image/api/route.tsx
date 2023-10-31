import { writeFile } from 'fs/promises'
import { NextRequest, NextResponse } from "next/server"
import mysql, { PoolOptions } from 'mysql2/promise';
import { mysqlaccess_pool } from "@/utils/dbpool";
import type { NextApiRequest, NextApiResponse } from 'next'

const randomId = function (length = 6) {
  return Math.random().toString(36).substring(2, length + 2);
};

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
  image: string,
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
  console.log('11111111111111')
  if (req.method === "POST") {
    console.log('22222222222')

    const data = await req.formData()

    console.log(data)

    const file: File | null = data.get('file') as unknown as File
    const bytes = await file.arrayBuffer()
    const buffer = Buffer.from(bytes)
    // generate a new filename
    // https://www.npmjs.com/package/mime-types
    const mime = require('mime-types')
    const extension = mime.extension(mime.lookup(file.name))
    const newfilename = randomId(10) + '.' + extension
    const path = `public/${newfilename}`
    await writeFile(path, buffer)
    console.log(`open ${path} to see the uploaded file`)

    const fname = data.get('first_name')
    const employee: emp_type = {
      id: Math.floor(Math.random() * 201) + 300,
      first_name: data.get('first_name') as string,
      last_name: data.get('last_name') as string,
      email: data.get('email') as string,
      phone_number: "650.501.2876",
      hire_date: "1998-07-01",
      salary: 9999,
      commission_pct: 0,
      iddepartment: 80,
      idmanager: 101,
      idjob: "IT_PROG",
      image: newfilename
    }

    // const sql = 'insert into employees(`id`,`first_name`,`last_name`,`email`,`idjob`) values (?,?,?,?,?)'
    // const [rows, fields] = await pool.query(sql, [employee.id, employee.first_name, employee.last_name, employee.email, 'IT_PROG']);
    const sql = 'insert into employees values (?)'
    const [rows, fields] = await pool.query(sql, [Object.values(employee)]);

    return NextResponse.json({ employees: rows });
  }
}

export async function PUT(req: NextRequest, res: NextResponse) {
  const pool = await mysql.createPool(mysqlaccess_pool);
  if (req.method === "PUT") {
    const data = await req.formData()

    console.log(data)

    // const fname = data.get('first_name')
    const employee: emp_type = {
      id: data.get('id') as number,
      first_name: data.get('first_name') as string,
      last_name: data.get('last_name') as string,
      email: data.get('email') as string,
      phone_number: "650.501.2876",
      hire_date: "1998-07-01",
      salary: 9999,
      commission_pct: 0,
      iddepartment: 80,
      idmanager: 101,
      idjob: "IT_PROG",
      image: 'user.png'
    }

    // const sql = 'insert into employees(`id`,`first_name`,`last_name`,`email`,`idjob`) values (?,?,?,?,?)'
    // const [rows, fields] = await pool.query(sql, [employee.id, employee.first_name, employee.last_name, employee.email, 'IT_PROG']);
    const sql = 'update employees set ? where id = ?'
    const [rows, fields] = await pool.query(sql, [employee,employee.id]);
    console.log(rows)
    return NextResponse.json({ employees: rows });
  }
}