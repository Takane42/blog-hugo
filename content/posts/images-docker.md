---
title: "Image Docker"
date: 2023-04-03T10:27:12+32:00
draft: false
---

# Images

> Docker Images? Kayak ISO Linux gitu?

Engga. Engga gitu, Sini ku jelasin

#### Penjelasan Docker Images

Docker Images adalah sebuah set instruksi yang digunakan untuk membuat Container pada Docker. Ya kayak template container lah. Docker Images ini memiliki beberapa layer, Dimana tiap layer dapat digunakan ulang oleh Images lain. Tergantung pada Images yang digunakan apakah memiliki keterkaitan satu sama lain. Ini menyebabkan docker menjadi hemat storage ( engga juga sih ).

Tiap Layer ini bersifat Read-Only sehingga tidak akan menyebabkan corrupt ke image" lain. Ketika Image dijalankan. Docker akan membuat Layer image khusus untuk container yang dapat diubah sehingga tidak menyebabkan container lain mengalami perubahan yang sama meskipun menggunakan Image Yang sama 

#### Cara Menggunakan Docker Images

Cara menggunakannya pun cukup mudah. Kita tentukan dulu image mana yang akan digunakan lalu ikuti arahan dokumentasinya. Karna tiap image terkadang memiliki cara tersendiri untuk menggunakan image tersebut.

Saya Ambil contoh image nginx dan image node. Untuk Image nginx. Paling sederhana kita cukup mendownload image nginx di hub.docker.com dan menjalankan image tersebut. Sedangkan untuk image node. Kita perlu membuat image sendiri berdasarkan image node yang tersedia pada hub.docekr.com . Alasan kita harus membuat image sendiri dikarenakan kita sebelumnya harus memasukan aplikasi yang kita buat dan menginstall librari yang digunakan oleh aplikasi tersebut.

Untuk Image Nginx kita cukup menjalankan Command

```
docker run -d -p 3000:80 --name web-server --rm nginx:alpine
```

Mari kita pecah command tersebut secara terperinci :

docker -> ya tentu saja kita menggunakan program docker

run -> Menjalankan command di kontainer baru

-d -> (Detachable) yang dimaksud disini adalah kita akan menjalankan kontainer tersebut di background / tanpa memasuki shell container tersebut. Apabila kita tidak menggunakan flag ini, maka docker akan menampilkan log process dari kontainer tersebut

-p 80:3000 -> flag -p digunakan untuk melakukan mapping port. Untuk cara penggunaannya adalaha ` -p port-host:port-container. Disini terlihat jelas bahwa port 80 dari kontainer ini akan diarahkan pada port 3000 pada host tersebut.

--name web-server -> flag --name digunakan untuk memberikan nama pada kontainer yang akan dibuat. Disini kita beri nama web-server

--rm -> flag --rm digunakan untuk menghapus kontainer apabila ada kontainer dengan nama yang sama dan apabila kontainer tersebut dihentikan (`docker stop`)

nginx:alpine -> disini kita menggunakan image "nginx" dengan versi "alpine".

![Test Nginx Image](/images/nginx-run.gif)

Cukup Mudah Kan. Hal Ini berbeda dengan image deploy aplikasi seperti node, go(lang), PHP, dan lain sebagainya. Kita Harus membuat terlebih dahulu image yang sudah berisi aplikasi kita. Hal ini akan kita bahas pada subbab dibawah

#### Membuat Docker Images Sendiri

Membuat Image docker tidaklah susah. Biasanya pada dokumentasi image yang akan kita gunakan. sudah terdapat dokumentasi tata cara membuat custom docker images. Disini mimin ambil contoh Mendeploy aplikasi [NodeJS API Simple](https://github.com/Takane42/API-Test) Milik [Saya Sendiri](https://github.com/Takane42)

1. Buat Folder baru. Dan Buat file bernama Dockerfile.

    ```
    mkdir backend && cd backend && touch Dockerfile
    ```

2. Clone Aplikasi Backend menggunakan git

    ```
    git clone https://github.com/Takane42/API-Test code
    ```

    Saya Tambahkan code dibelakang agar folder yang kita clone berubah nama menjadi code

3. Tambahkan Line berikut Kedalam Dockerfile

    ```
   # Kita Menggunakan Image node versi 16 sebagai dasar image kita 
    FROM node:16
   # CD ke folder /home/node/app
    WORKDIR /home/node/app
   # COPY file yang berada pada folder code ke images
    COPY ./code .
   # Install Dependecies yang dibutuhkan oleh Aplikasi
    RUN npm i
   # Jalankan "npm start" ketika container berjalan
    ENTRYPOINT ["npm", "start"]
   # Buka Port 3000 pada container
    EXPOSE 3000
    ```

4. Build image dan tambahkan nama repository dan tag image tersebut

    ```
    docker build -t node-app:latest .
    ```

5. Jalankan Container dengan menggunakan Image yang telah kita buat

    ```bash
    docker run -d -p 127.0.0.1:3000:3000 --rm --name node-app node-app
    ```

Selamat. Anda sudah bisa membuat image docker sendiri. Sekarang teman anda ingin menggunakan image tersebut. bagaimana caranya? Kita Upload image tersebut ke repository public / private

#### Mengupload docker Images buatan sendiri

Untuk Mengupload image docker kita. kita harus menyiapkan repository terlebih dahulu. disini kita akan menggunakan repository yang sudah disediakan oleh docker untuk mengupload image kita.

1. Login ke Dockerhub. 

    Bila anda belum membuat Akun hub.docker.com. Buat terlebih dahulu dengan mengisi Form yang terletak pada sebelah kanan dan ikuti prosedurnya

![Docker Login](/images/docker-login.png)

2. Klik Menu Repository pada sebelah atas. dan Klik Create Repository

![Create Repository](/images/create-repo.png)

3. Isi Form sesuai dengan kebutuhan

4. Login dengan menggunakan user dockerhub pada Docker CLI kita

    ```bash
    docker login
    ```

5. Ubah Nama image yang tersimpan pada local machine anda ke username/nama-repo:tag

    ```bash
    docker tag <nama-repo-image>:<tag> <username>/<nama-repo-docker>:<tag>
    ```

6. Push image ke repository

    ```bash
    docker push <username>/<nama-repo>:<image-tag>
    ```

7. Image pun Terupload ;)

![Repository Done!](/images/result-repo.png)

Nah. Sekian 
