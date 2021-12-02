## Sirsak - Oskuh

Simple OS for learning. Forked from agusk/sirsak. 

Modifikasian dari OS-nya bapak Agus K.

## Usage

Please read my article (written in Indonesia language), http://blog.aguskurniawan.net/post/Membuat-Sistem-Operasi-Sederhana.aspx.

Berdasarkan modifikasi, untuk build bisa jalankan saja
```shell
make build
```

Untuk membuat iso file cukup jalankan
```shell
make build-iso
```

Pastikan sudah menginstall requirements yaa.

## License

The MIT License (MIT)

Copyright (c) 2013 Agus Kurniawan

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Requiremets

- qemu-system
- GCC Mulitilib
- GCC

Build jadi iso:

- mtools
- xorriso

## Buat debugging pakai GDB

Jalanin qemunya dengan cara:

```shell
make debug-qemu
```

Jalanin di gdb:

```
target remote: 1234
continue
```

Hei, jangan lupa pasang breakpoint sebelum pencet continue yaah.

Fyi, kamu bisa juga looh pasang breakpoint kayak gini:

```
b src/kernel.c:4
```

Artinya pasang breakpoint di src/kernel.c di baris ke 4. Selamat Mencoba :D.
