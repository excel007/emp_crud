'use client'
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"

export default function Page() {
    const handleSubmit = (event:any) => {
        event.preventDefault()
        // console.log(event.target.first_name.value)
        const data = {
            "first_name" : event.target.first_name.value,
            "last_name" : event.target.last_name.value,
            "email" : event.target.email.value
        }
        // console.log(data)
        fetch('http://')
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
