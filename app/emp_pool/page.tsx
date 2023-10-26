import Image from "next/image"
import Link from "next/link"
import { UserPlus,Pencil,Eraser  } from "lucide-react"

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
async function getData() {
    const postData = {
        method: "GET",
        headers:{
            "Content-Type": "application/json"
        }
    }
    
    const res = await fetch('http://localhost:3000/emp_pool/api/',postData)
    if (!res.ok) {
        throw new Error('Failed to fetch data')
    }
    return res.json()
}

export default async function Page() {
    const data = await getData()

    return (
        <div>
            <h1>Employee list</h1>
            
            <Link href="emp_pool/create" className="flex"> <UserPlus /> Create Emp</Link>
            
            <ul className="list-disc list-inside">
                {data.employees.map((emp:emp_type) => (
                    <li key={emp.id} >
                        <div className="flex">
                        {/* <Image src='/user.png' width={50} height={50} alt="{emp.first_name}"/> */}
                        <Link href={`emp_pool/${emp.id}`} className="hover:font-semibold">{emp.first_name} {emp.last_name} {emp.id} </Link>
                        
                        <Link href='#' className="hover:bg-slate-100"> <Pencil/> </Link>
                        <Link href='#' className="hover:bg-slate-100"> <Eraser/> </Link>
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    )
}  