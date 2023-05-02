---
title: "Sinau Docker"
date: 2023-04-04T10:27:10+07:00
draft: false
---
# Docker. Why?

Ketika kalian memulai suatu project. Tentu saja kalian mengerjakan project tersebut pada workstation pribadi kalian. dan biasanya workstation yang digunakan memiliki os yang berbeda dengan server production perusahaan. Hal ini dapat menyebabkan Aplikasi yang anda kembangkan memiliki kemungkinan untuk tidak dapat berjalan pada server production. Padahal, Aplikasi yang anda buat dapat berjalan dengan sat set sat set pada workstation anda. Hal ini pun akhirnya menambah waktu kalian untuk menyelesaikan permasalahan tersebut.

Memang, Kita bisa menyamakan OS Workstation yang digunakan untuk sama dengan OS pada Server Production. Emang anda mau menggunakan Headless linux di Laptop Pribadi? Tentu saja tidak. saya aja gamau wkkwkwk... dan apabila kita menggunakan Windows sebagai os server production, ya gapapa sih... cuman akhirnya nanti kita harus beli lisensi apabila kita tidak ingin terkena masalah legalitas.

>"Terus min apa solusinya?" 

Nah, solusinya kita dapat menggunakan teknologi virtualisasi.

>"Install VM di Linux? Bukannya itu malah make resource gede ya min?" 

Eits. Virtualisasi bukan berarti menggunakan VM ya. Virtualisasi itu ada banyak macamnya. Disini mimin gabisa jelasin karna ya... saya aja blm memahami banget tentang virtualisasi ;).

Disini Mimin rekomendasiin untuk menggunakan container untuk virtualisasinya. Kalau biasanya kita menggunakan VMware / VirtualBox untuk membuat VM. Disini kita akan menggunakan Docker untuk membuat containernya

## Apa Itu Docker?

> Docker? apa itu?

Dikutip dari ibm.com

>Docker is an open source containerization platform. It enables developers to package applications into containers—standardized executable components combining application source code with the operating system (OS) libraries and dependencies required to run that code in any environment. Containers simplify delivery of distributed applications, and have become increasingly popular as organizations shift to cloud-native development and hybrid multicloud environments.

Kalau mimin Terjemahin pake bahasa sendiri

Docker adalah aplikasi kontainerisasi yang bersifat open source. Aplikasi ini dapat digunakan untuk membuat bundle / paket dimana developer dapat memasukan aplikasi kedalam container yang memiliki operasi sistem dan dependencies yang diperlukan untuk menjalakan aplikasi tersebut pada komputer manapun.

> Kenapa engga pakai VM aja min? Kan kita - kita udah kebiasa pake VM.

Nah. nanti saya jelasin di bawah, Sebelumnya kita bahas dulu sejarah docker


## Sejarah Docker

Dikutip Dari Wikipedia dan di Translate dengan menggunakan DeepL

>Docker Inc. didirikan oleh Kamel Founadi, Solomon Hykes, dan Sebastien Pahl selama kelompok inkubator startup Y Combinator Summer 2010 dan diluncurkan pada tahun 2011. Startup ini juga merupakan salah satu dari 12 startup di kohort pertama Founder's Den. Hykes memulai proyek Docker di Prancis sebagai proyek internal dalam dotCloud, sebuah perusahaan platform-as-a-service. Docker memulai debutnya ke publik di Santa Clara di PyCon pada tahun 2013.  

>Docker memulai debutnya ke publik di Santa Clara di PyCon pada tahun 2013. Docker dirilis sebagai sumber terbuka pada bulan Maret 2013. Pada saat itu, Docker menggunakan LXC sebagai lingkungan eksekusi default-nya. Satu tahun kemudian, dengan rilis versi 0.9, Docker menggantikan LXC dengan komponennya sendiri, libcontainer, yang ditulis dalam bahasa pemrograman Go.  

>Pada tahun 2017, Docker menciptakan proyek Moby untuk penelitian dan pengembangan terbuka.


## Cara Kerja Docker

Docker membuat container dengan mengikuti template (yang kita sebut dengan Docker Image) yang sudah ditentukan oleh developer. Tiap Images memiliki fungsi yang berbeda. Namun biasanya tiap image memiliki dependencies yang sama, ya contohnya seperti kernel linux, package manager, dsb . Disini docker memanfaatkan Kesamaan tersebut dan menyebarkannya ke Container yang membutuhkan. Bagaikan pohon yang bercabang. sehingga dapat membuat proses deployment container menjadi cepat.

Ilustrasi Sederhananya adalah sebagai berikut
```
.
└─┬─ Linux Kernel
  ├─┬─ Debian
  │ └─── MariaDB
  └─┬─ Alpine
    ├─── Nginx
    └─── Tachidesk
```
Disini dapat terlihat bahwa aplikasi Nginx menggunakan operasi sistem Alpine dan aplikasi Maria DB menggunakan operasi sistem Debian. Nah Alpine dan Debian ini sama sama menggunakan Linux Kernel sehingga Mereka dapat saling berbagi Kernel tersebut. Tanpa perlu menginstall kernel untuk tiap operasi sistemnya

## Mengapa menggunakan Docker

Ada Beberapa Alasan mengapa mimin menyarankan untuk menggunakan docker, yaitu :

1. Virtualisasi pada Level Kernel

    Docker Engine melakukan virtualisasi pada level kernel sehingga membuat tiap container menjadi ringan. tidak seperti Virtual Machine dimana Virtualisasinya pada level Hardware sehingga tiap Virtual Machine harus melakukan instalasi Kernelnya sendiri - sendiri
2. Cepat. 

    Container docker mudah di deploy dan disimpan konfigurasi deploymentnya sehingga developer dapat dengan mudah melakukan deployment pada server yang berbeda
3. Aman dan Terisolasi. 

    Tiap Aplikasi Memiliki containernya sendiri sehingga apabila Salah satu servicenya mengalami hang / kerusakan. Tidak akan mengganggu Aplikasi Lainnya (Contoh MySQL dan PHP)

## Mengapa tidak menggunakan docker

1. Tambahan Penggunaan Resource

    Ya namanya virtualisasi tentu saja menggunakan resource. tidak terkecuali untuk docker. Meskipun penggunaannya kecil. namun kadang ada server dimana performa itu kritikal sehingga resource yang digunakan harus semaksimal mungkin

2. Dalamnya Rabbit Hole Docker

      Program docker memiliki banyak ilmu yang harus dipelajari. Beberapa diantaranya yaitu membuat docker image, networking pada docker, docker compose, dll. Sehingga akan memakan waktu untuk mempelajari semua ilmu tersebut


3. Gatau lagi apa nanti tanya mas ha / mas abas

## Tata Cara Install Docker Pada Local Machine

Mending nanti dibahas ke [sini](instalasi.md) aja (insert next page)

#### Source

https://www.ibm.com/cloud/learn/docker

https://www.ekrut.com/media/mengenal-docker-dan-penggunaannya-seperti-apa-sih

https://www.howtogeek.com/devops/when-not-to-use-docker-cases-where-containers-dont-help/

https://stackoverflow.com/a/42190352
