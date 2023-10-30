import { writeFile } from 'fs/promises'
import { NextRequest, NextResponse } from 'next/server'

//create a random ID
const randomId = function (length = 6) {
  return Math.random().toString(36).substring(2, length + 2);
};

export async function POST(request: NextRequest) {
  const data = await request.formData()
  const file: File | null = data.get('file') as unknown as File

  if (!file) {
    return NextResponse.json({ success: false })
  }

  const bytes = await file.arrayBuffer()
  const buffer = Buffer.from(bytes)

  // generate a new filename
  const mime = require('mime-types')
  const extension = mime.extension(mime.lookup(file.name))
  const newfilename = randomId(10) + '.' + extension

  // With the file data in the buffer, you can do whatever you want with it.
  // For this, we'll just write it to the filesystem in a new location
  const path = `public/${newfilename}`
  await writeFile(path, buffer)
  console.log(`open ${path} to see the uploaded file`)
  return NextResponse.json({ success: true })
}
