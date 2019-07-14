## Teori Komponen Arsitektur (Architecture Components)

Tujuan dari komponen arsitektur adalah memberikan panduan tentang arsitektur aplikasi dengan library untuk tasks yang umum, seperti manajemen lifecycle dan data presistance. Komponen arsitektur dapat membantu dalam menyusun aplikasi dengan cara yang robust, dapat diuji (testable), dan dapat dikelola dengan kode yang lebih sederhana. Diagram berikut ini menunjukkan bentuk dasar dari Komponen Arsitektur.
![ArchitectureComponents](images/ArchitectureComponent.png)

1. __Entity__ : merupakan kelas beranotasi yang menggambarkan tabel pada database
2. __SQLite database: merupakan tempat penyimpanan data di dalam perangkat
3. __Data Access Object (DAO)__ : merupakan pemetaan query SQL ke dalam sebuah fungsi. Kita harus mendifinisikannya di kelas SQLiteOpenHelper.
4. __Room database__ : merupakan lapisan (layer) basis data di atas SQLite database yang menangani tasks di SQLiteOpenHelper. Room database berfungsi sebagai titik akses ke database SQLite dengan memanfaatkan DAO.
5. __Repository__ : merupakan kelas yang dibuat, misalnya kelas WordRepository. Repository digunakan untuk mengelola sumber data yang bermacam-macam.
6. __ViewModel__: merupakan penyedia data ke User Interface (UI). ViewModel bertindak sebagai pusat komunikasi antara Repository dan UI, serta menyembunyikan asal mula data.
7. __LiveData__: merupakan kelas data yag dapat diamati, dan selalu menyimpan data versi terbaru. LiveData akan menginformasikan ketika terjadi perubahan data


## PRAKTIKUM

1. Membuat Entity
2. Membuat DAO
    Di Data Access Object (DAO), kita akan menentukan query SQL dan menghubungkannya dengan pemanggilan metode. Compiler akan memeriksa SQL dan menghasilkan query dari anotasi untuk query umum, seperti @Insert. Secara default, semua query harus dijalankan pada thread yang terpisah. DAO harus berupa interface atau abstract class. 

```java

```



