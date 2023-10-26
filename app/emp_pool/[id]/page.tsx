import Image from "next/image"

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
async function getData(id: any) {
    const res = await fetch(`http://localhost:3000/emp_pool/${id}/api`)
    if (!res.ok) {
        throw new Error('Failed to fetch data')
    }
    return res.json()
}

export default async function page({ params }: any) {
    const data = await getData(params.id)
    return (
        <div>
            {data.map((emp: emp_type) => (
            <div>
                <Image src='/user.png' width={50} height={50} alt="{emp.first_name}"/>
                {emp.first_name} {emp.last_name}
                </div>
            ))}
        </div>
    )
}