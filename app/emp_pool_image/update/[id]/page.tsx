'use client'

import { useState, useEffect } from 'react'
import { useParams } from 'next/navigation'

import { useRouter } from 'next/navigation'
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"



// import { useToast } from "@/components/ui/use-toast"
import toast, { Toaster } from 'react-hot-toast';

export default function Update() {
    const [first_name, setFname] = useState('')
    const [last_name, setLname] = useState('')

    const { id } = useParams();

    useEffect(() => {
        fetch(`http://localhost:3000/emp_pool_image/${id}/api`)
            .then(res => res.json())
            .then(
                (result) => {
                    setFname(result.employee[0].first_name)
                    setLname(result.employee[0].last_name)
                }
            )
    }, [id])

    const [file, setFile] = useState<File>()
    const router = useRouter()

    const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault()
        // if (!file) {
        //     toast.error('please upload image');
        //     return
        // }

        const data = new FormData(event.currentTarget)
        // data.set('file', file)

        const postData = {
            method: "PUT",
            body: data
        }

        const res = await fetch('/emp_pool_image/api/', postData)

        if (res.ok) {
            toast.success('บันทึกเรียบร้อย');
            router.push('/emp_pool_image');
            router.refresh();
        }
    }

    return (

        <div>
            <h1>Update Employee</h1>



            <form onSubmit={handleSubmit}>
                <Label htmlFor="first_name">First Name</Label>
                <Input type="text" name="first_name" id="first_name" placeholder="First Name" value={first_name} onChange={(e => setFname(e.target.value))} className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="last_name">Last Name</Label>
                <Input type="text" name="last_name" id="last_name" placeholder="Last Name" value={last_name} onChange={(e => setLname(e.target.value))} className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="email">E-Mail</Label>
                <Input type="text" name="email" id="email" placeholder="nam@mail.com" className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="file">Profile Image</Label>
                <Input type='file' name="file" id='file' onChange={(e) => setFile(e.target.files?.[0])} />
                <Input type='hidden' name='id' id='id' value={id}></Input>
                <Button> Submit </Button>
            </form>
        </div>
    )
}
