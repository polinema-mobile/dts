# Room Persistence Library 

## Teori

Room adalah library baru bawaan Android yang menyediakan abstraksi di atas SQLite untuk memungkinkan akses database yang lebih mudah tanpa menghilangkan keuntungan-keuntungan powerful yang dimiliki oleh SQLite.

Aplikasi yang menangani jumlah data terstruktur yang kompleks dan besar akan sangat diuntungkan bila dimampukan untuk menyimpan datanya secara lokal di SQLite database. Kasus paling umum adalah untuk meng-cache sejumlah besar data yang paling relevan/penting dari suatu aplikasi sehingga ketika perangkat tidak dapat mengakses jaringan, pengguna masih dapat membaca-baca konten aplikasi tersebut saat sedang offline. Setiap perubahan konten yang dilakukan pengguna kemudian disinkronkan ke server setelah perangkat kembali online nantinya.

Karena library Room yang sudah sangat lengkap dan mampu meng-handle skenario semacam itu maka kita dianjurkan untuk menggunakan Room alih-alih SQLite. Namun, jika Anda lebih suka menggunakan API SQLite secara langsung, juga sah-sah saja.

Catatan: Untuk menggunakan Room di aplikasi Anda, Anda perlu menambahkan beberapa library ke file build.gradle aplikasi Anda.

Ada 3 komponen utama pada Room:

1.	__Database__ (atau AppDatabase): Merupakan sebuah class yang diturunkan dari class RoomDatabase dan berfungsi sebagai titik akses utama untuk koneksi ke SQLite yang tertanam pada perangkat Android. Class tersebut harus diberi notasi __@Database__ dan juga harus memenuhi ketentuan sebagai berikut:

	- Merupakan class abstract yang meng-extend class RoomDatabase.
	- Menyertakan daftar entitas (tabel-tabel) yang terkait dengan database di bagian anotasi-nya.
	- Memiliki method-method abstrak yang memiliki 0 argumen dan mengembalikan kelas yang DAO (beranotasi @Dao).

	Pada saat runtime, kita dapat memperoleh instance dari class Database dengan memanggil method Room.databaseBuilder() atau Room.inMemoryDatabaseBuilder().

2.	__Entity__: Merupakan class yang merepresentasikan tabel di dalam database.

3. 	__DAO__: Class yang berisi method-method untuk mengakses (baca/tulis) data dari/ke database.

Secara hunbungan kierja ketiga komponen Room tersebut di atas pada suatu aplikasi adalah seperti berikut:

- Aplikasi menggunakan instance database Room untuk mendapatkan objek akses data, atau DAO, yang terkait dengan database. 
- Aplikasi kemudian menggunakan setiap DAO untuk mendapatkan Entity dari database dan menyimpan perubahan apa pun pada entitas tersebut kembali ke database. 
- Pada akhirnya, aplikasi menggunakan entitas untuk meng-get/set nilai yang sesuai dengan kolom tabel dalam database.

Hubungan tersebut secara umum seperti digambarkan pada bagan di bawah ini.
![Arsitektur Room](images/room-architecture.png)

Gambar diambil dari: https://developer.android.com/training/data-storage/room/index.html
