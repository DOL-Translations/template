endian msb // GameCube PPC requires Big-Endian Encoding (Most Significant Bit)
output "../output/Template [U].iso", create
origin $000000; insert "../input/Template [J].iso"

//Note: there is an experimental upgrade to Text() that simplified this process

macro Text(OFFSET, TEXT) {
  map 0, 0, 256 // Map Default ASCII Chars
  map '\n', 0x0A // End of string
  //add additional characters here

  origin {OFFSET}
  db {TEXT} // ASCII Text To Print
}

macro TextShiftJIS(OFFSET, TEXT) {
  // Map Shift-JIS Words
  map ' ',  $8140
  map $2C,  $8143 // Comma ","
  map '.',  $8144
  map ':',  $8146
  map '?',  $8148
  map '!',  $8149
  map '~',  $8160
  map '\s', $8166 // Single Quote "'"
  map '\d', $8168 // Double Quote '"'
  map '+',  $817B
  map '&',  $8195
  map '0',  $824F, 10 // Map Numbers
  map 'A',  $8260, 26 // Map English "Upper Case" Characters
  map 'a',  $8281, 26 // Map English "Lower Case" Characters

  origin {OFFSET}
  dw {TEXT} // Shift-JIS Text To Print
}

macro ReplaceAsset(ORIGIN, FILE, SIZE) {
  if !file.exists({FILE}) {
    print "{FILE} doesn't exist!"
  } else if file.exists({FILE}) {
    if (file.size({FILE}) > {SIZE} && {SIZE} != -1) {
      Assert("File {FILE} is bigger than Size {SIZE}")
    } else if (file.size({FILE}) <= {SIZE}) {
      origin {ORIGIN}
      insert {FILE}
      fill {SIZE} - file.size({FILE})
    }
  }
}

//Region
Text($3, "E")
origin $45B; db $01

//include "System.asm"
//add more source files here
