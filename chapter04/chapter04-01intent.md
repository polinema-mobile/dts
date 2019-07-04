# Pendahuluan
Jika membuat aplikasi mobile khususnya andorid, tentunya tidak mungkin hanya terdiri satu buah activity melainkan terdiri lebih dari satu activity. Selain itu terdapat kebutuhan untuk melakukan pengolahan data atau menjalankan tugas tertentu tidak pada sebuah main thread, karena ketika menjalankan pada sebuah main thread jika terlalu lama aplikasi android akan force close. Dan yang terakhir adalah aplikasi android juga dapat dibuat menjalankan perintah tertentu berdasarkan event. Hal tersebut dapat dilakukan menggunakan konsep intent.  

## Pengertian Intent
Intent merupakan sebuah mekanisme yang digunakan untuk melakukan sebuah aksi dari komponen aplikasi. Untuk dapat melakukan sebuah aksi pada sebuah intent, ada 3 cara yang dapat dilakukan;
- Menjalankan sebuah activity lain baik dengan data ataupun tanda data
- Membuat sebuah service untuk menjalankan pekerjaan tertentu pada sebuah background/non main thread
- Mengirimkan sebuah broadcast. Pesan yang dikirimkan dalam keadaan tertentu, misalkan ketika booting atau sedang melakukan pengisian daya baru mengirimkan data

Terdapat 2 model intent dalam pemrograman android yaitu

### Intent Explicit
Dikatakan intent explicit karena intent tersebut biasanya dibuat oleh seorang programmer berdasarkan kebutuhan yang ada. Untuk memanggil intent tersebut biasanya digunakan nama kelas, misalkan `id.ac.polinema.WelcomeActivity`

### Intent Implicit
Model intent ini sebaliknya dari intent explicit, kita tidak perlu menggunakan nama kelas untuk memanggilnya. Intent model ini sudah disediakan oleh system android, sebagai contoh kita akan melakukan pemanggilan telp maka seorang programmer tanpa harus membuat intent untuk melakukan pemanggilan telp.

### Intent Explicit dengan Parcelable
Dengan menggunakan parcelable kita tidak hanya dapat melewatkan sebuah nilai pada sebuah intent, tetapi kita dapat melewatkan sebuah objek. Objek yang akan dilewatkan melalui intent harus implement interface Parcelable

### Intent dengan ResultActivity
Intent dengan ResultActivity berkaitan dengan sebuah perpindahan dari
Activity satu ke Activity yang lain. Jadi ada kebutuhan ketika ada
sebuah activity yang dijalankan oleh Activity pemanggilnya menginginkan
nilai balik/kembalian, Activity dapat mengembalikan nilai balik ketika
sudah ditutup atau memanggil fungsi `finish()`. Misalkan Activity A
memanggil Activity B, Activity A dapat menerima nilai tertentu dari
Activity B setelah Activity B ditutup atau memanggil fungsi `finish()`

### Source Code 
Untuk memudahkan proses praktikum, Anda bisa mendapatkan started code di
[github](https://github.com/polinema-mobile/dtschapter04-starter.git) .