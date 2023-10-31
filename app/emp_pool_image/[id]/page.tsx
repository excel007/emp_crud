import Image from "next/image"
import Link from "next/link"
import { Router } from "next/router"

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
async function getData(id: any) {
    const postData: RequestInit = {
        method: "GET",
        next: { revalidate: 0 },
        headers:{
            "Content-Type":"application/json"
        }
    }
    const res = await fetch(`http://localhost:3000/emp_pool_image/${id}/api`, postData)
    if (!res.ok) {
        throw new Error('Failed to fetch data')
    }
    return res.json()
}

export default async function page({ params }: any) {
    const data = await getData(params.id)
    // console.log(data)

    return (
        <div>
            {data.employee.map((emp: emp_type) => (
                <div key={emp.id} >
                    <Image src={`/${emp.image}`} width={200} height={200} alt={emp.first_name} />
                    {emp.first_name} {emp.last_name}
                </div>
            ))}

            <Link href="/emp_pool_image"> back </Link>
        </div>

    )
}