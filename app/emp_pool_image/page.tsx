import Image from "next/image"
import Link from "next/link"
import { UserPlus,Pencil,Eraser  } from "lucide-react"
import { RocketIcon } from "lucide-react"

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
    image: string
}

async function getData() {
    const postData : RequestInit = {
        method: "GET",
        // cache: "no-cache",
        next: { revalidate: 0 } ,
        headers:{
            "Content-Type": "application/json"
        }
    }

    const res = await fetch('http://localhost:3000/emp_pool_image/api/',postData)
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
          
            <Link href="emp_pool_image/create" className="flex"> <UserPlus /> Create Emp</Link>
            <div className="grid gap-10 p-2 grid-cols-6">
                {data.employees.map((emp: emp_type) => (
                    <div className="h-20" key={emp.id}>
                        <div className="flex w-full h-12 justify-center align-middle">
                            <Image src={`/${emp.image}`} width={50} height={50} alt="user" className="object-contain"/>
                        </div>
                        <div className="w-full text-center">
                            <Link href={`emp_pool_image/${emp.id}`} className="hover:font-semibold">
                                {emp.first_name} {emp.last_name}
                            </Link>
                        </div>
                        <div className="w-full flex justify-center">
                            <Link href={`emp_pool_image/update/${emp.id}`} className="hover:bg-slate-100"> <Pencil /> </Link>
                            <Link href='#' className="hover:bg-slate-100"> <Eraser /> </Link>
                        </div>
                    </div>
                ))}
            </div>

            <ul className="list-disc list-inside">
                {data.employees.map((emp:emp_type) => (
                    <li key={emp.id} >
                        <div className="flex">
                        <Image src={`/${emp.image}`} width={50} height={50} alt="{emp.first_name}" className="rounded-full"/>
                        <Link href={`emp_pool_image/${emp.id}`} className="hover:font-semibold">{emp.first_name} {emp.last_name} {emp.id} </Link>
                        
                        <Link href='#' className="hover:bg-slate-100"> <Pencil/> </Link>
                        <Link href='#' className="hover:bg-slate-100"> <Eraser/> </Link>
                        </div>
                    </li>
                ))}
            </ul>
        </div>
    )
}  