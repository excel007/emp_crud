import Image from 'next/image'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { mysqlaccess } from '@/utils/db'

import mysql, { ConnectionOptions } from 'mysql2';

const conn = mysql.createConnection(mysqlaccess);

conn.query('SELECT * from employees AS `test`;', (_err, rows) => {
  // console.log(_err)
  // console.log(rows)
  /**
   * @rows: [ { test: 2 } ]
   */
});

export default function Home() {
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
    </main>
  )
}
