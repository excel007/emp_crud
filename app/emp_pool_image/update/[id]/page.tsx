'use client'

import { useState, useEffect } from 'react'
import { useParams } from 'next/navigation'

import { useRouter } from 'next/navigation'
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Button } from "@/components/ui/button"



// import { useToast } from "@/components/ui/use-toast"
import toast, { Toaster } from 'react-hot-toast';
import Image from 'next/image'

export default function Update() {
    // const [first_name, setFname] = useState('')
    // const [last_name, setLname] = useState('')
    // const [image, setImage] = useState('')

    const [user, setUser] = useState({
        id: "",
        first_name: "",
        last_name: "",
        email: "",
        phone_number: "",
        hire_date: "",
        salary: "",
        commission_pct: "",
        iddepartment: "",
        idmanager: "",
        idjob: "",
        image: "",
    })
    // const handleChange = (e: any) =>
    //     setUser(prevState => ({ ...prevState, [e.target.name]: e.target.value }))



    const handleChange = () => {
        setUser((user) => {
            return {
                ...user,
                // email:"a@a.com",
            };
        });
    }

    const { id } = useParams();

    useEffect(() => {
        fetch(`http://localhost:3000/emp_pool_image/${id}/api`)
            .then(res => res.json())
            .then(
                (result) => {
                    setUser((user) => {
                        return {
                            ...user,
                            first_name: result.employee[0].first_name,
                            last_name: result.employee[0].last_name,
                            email: result.employee[0].email,
                            image: result.employee[0].image,
                        };
                    });
                    // ((e:any) => setUser(Object.values(result.employee[0])));
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
        // console.log(file)
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
        } else {
            toast.error(res.statusText)
        }
    }

    return (

        <div>
            <h1>Update Employee</h1>

            <form onSubmit={handleSubmit}>
                <Label htmlFor="first_name">First Name</Label>
                <Input type="text" name="first_name" id="first_name" placeholder="First Name" defaultValue={user.first_name} onChange={handleChange} className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="last_name">Last Name</Label>
                <Input type="text" name="last_name" id="last_name" placeholder="Last Name" defaultValue={user.last_name} onChange={handleChange} className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="email">E-Mail</Label>
                <Input type="text" name="email" id="email" placeholder="nam@mail.com" defaultValue={user.email} onChange={handleChange} className="lg:w-1/4 sm:w-full" />
                <Label htmlFor="file">Profile Image</Label>
                <Image src={`/${user.image}`} width={50} height={50} alt='user' />
                <Input type='file' name="file" id='file' defaultValue={user.image} onChange={(e) => setFile(e.target.files?.[0])} />
                <Input type='hidden' name='oldfilename' id='oldfilename' value={user.image} />
                <Input type='hidden' name='id' id='id' value={id} />
                <Button type='submit'> Submit </Button>
                <Button type='button' onClick={(e) => router.back()}> Back </Button>
            </form>
        </div>
    )
}
