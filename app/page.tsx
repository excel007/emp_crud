'use client'
import Image from 'next/image'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Toaster } from "@/components/ui/toaster"
import { useToast } from "@/components/ui/use-toast"

export default function Home() {
  const { toast } = useToast()
  return (
    <main>
      <Image src="/erd.png" width={600} height={200} alt='ERD' />
      <div className='flex'>
        <Button >Submit</Button>
        <Button variant="outline">Submit</Button>
        <Button variant="secondary">Submit</Button>
        <Button variant="destructive">Submit</Button>
        <Button variant="ghost">Submit</Button>
        <Badge variant="secondary"> Badge Secondary</Badge>
      </div>
      <Button
                variant="outline"
                onClick={() => {
                    toast({
                        title: "Scheduled: Catch up ",
                        description: "Friday, February 10, 2023 at 5:57 PM",
                    })
                }}
            >
                Add to calendar
            </Button>
    </main>
  )
}
