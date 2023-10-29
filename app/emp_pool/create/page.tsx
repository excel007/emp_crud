'use client'
import { useRouter } from 'next/navigation'
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"

// import { useToast } from "@/components/ui/use-toast"
import toast, { Toaster } from 'react-hot-toast';

export default async function Create() {
    const router = useRouter()
    // const { toast } = useToast()

    const handleSubmit = async (event: any) => {
        event.preventDefault()
        // console.log(event.target.first_name.value)
        const formData = {
            "first_name": event.target.first_name.value,
            "last_name": event.target.last_name.value,
            "email": event.target.email.value
        }
        // console.log(formData)
        const postData = {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        }

        const res = await fetch('/emp_pool/api/', postData)
        // const result = await res.json()
        // console.log(result.employees.affectedRows)
        // console.log(res)
        if (res.ok) {
            // toast({
            //     duration:2000,
            //     title: "Message",
            //     description: event.target.first_name.value + " " + event.target.last_name.value + " inserted.",
            //   })

            toast.success('บันทึกเรียบร้อย');  
            router.push('/emp_pool');
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

                <Button> Submit </Button>
            </form>
        </div>
    )
}
