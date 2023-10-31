'use client'

import { useState } from 'react'

import { useRouter } from 'next/navigation'
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"



// import { useToast } from "@/components/ui/use-toast"
import toast, { Toaster } from 'react-hot-toast';

export default function Create() {
    const [ file , setFile ] = useState<File>()
    const router = useRouter()

    const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
        event.preventDefault()
        if (!file) return

        const data = new FormData(event.currentTarget)
        data.set('file', file)

        const postData = {
            method: "POST",
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
            <h1>Create Employee</h1>



            <form onSubmit={handleSubmit}>
                <Label htmlFor="first_name">First Name</Label>
                <Input type="text" name="first_name" id="first_name" placeholder="First Name" className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="last_name">Last Name</Label>
                <Input type="text" name="last_name" id="last_name" placeholder="Last Name" className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="email">E-Mail</Label>
                <Input type="text" name="email" id="email" placeholder="nam@mail.com" className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="file">Profile Image</Label>
                <Input type='file' name="file" id='file' onChange={(e) => setFile(e.target.files?.[0])} />
                <Button> Submit </Button>
            </form>
        </div>
    )
}
