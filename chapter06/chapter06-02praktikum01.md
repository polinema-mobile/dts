# Praktikum  1: Aplikasi BMI Sederhana
Aplikasi yang hendak dibuat pada kegiatan kali ini adalah aplikasi penghitung indeks bobot tubuh atau dikenal dengan istilah *body mass index* (BMI).

Secara ringkas, urutan perjalanan aplikasi yang dibuat berawal dari kemunculan sebuah *splash screen* dan dilanjutkan dengan antarmuka utama yaitu kalkulator BMI dengan aturan pengguna harus memasukkan beberapa data antara lain:
1. Jenis kelamin (*Radio Group*), 
2. Berat badan (*Edit Text*),
3. Tinggi badan (*Edit Text*), dan
4. Umur (*Edit Text*).

Hasil ditampilkan melalui *dialog box* berisi informasi dari masukan yang telah diberikan oleh pengguna.

Pada bagian ini, template yang digunakan adalah template asli yang disediakan oleh Android Studio.

## Pembuatan project 
1. Buka aplikasi Android Studio, pilih `Start a new Android Studio Project`. ![buat project](images/1.1_buat_project.png)
2. Jenis project yang dipilih adalah `empty activity`.![pilih project](images/1.2_pilih_empty_activity.png)
3. Beri nama project (contoh: Aplikasi Kalkulator BMI) dan nama packagenya (contoh: polinema.ac.id.aplikasikalkulatorbmi) yang sesuai.![pilih project](images/1.3_tentukan_nama_package.png)
4. Project awal selesai dibuat.![project berhasil](images/1.4_project_dibuat.png)
## Penataan Layout
Layout yang dibuat meliputi beberapa komponen yaitu `RadioGroup`, `TextView`, `EditText`, dan `Button`. Layout yang akan dibuat akan berbentuk seperti berikut.

![layout full](images/2.5_layout.png)
1. Buka **activity_main.xml** yang terletak di **app -> res -> layout -> activity_main.xml**. ![activity main awal](images/2.1_activity_main_kosong.png)
2. Buat layout dengan jenis `Constraint Layout`. tambahkan id dengan nama `activity_main`.![id: activity main](images/2.2_id_activity_main.png)
3. Tambahkan sebuah komponen `radio group`. Perhatikan bahwa constraint yang berlaku pada komponen radio grup ini antara lain:
`app:layout_constraintEnd_toEndOf="parent"`,
`app:layout_constraintStart_toStartOf="parent"`, dan
`app:layout_constraintTop_toTopOf="parent"`.![radio grup](images/2.3_radio_grup.png)
4. Item-item pada `radio group` diwujudkan sebagai `radio button`, tambahkan properti-properti berikut di `radio button`, abaikan sementara tanda merah di kode program.![radio button](images/2.4_radio_button.png)
5. Tambahkan tiga buah TextView, berikan nama masing-masing **Bobot(kg)**, **Tinggi(cm)**, **Umur(th)**.![textview satu](images/2.6_textview1.png)![text view 2](images/2.7_textview2.png)
6. Tambahkan dua buah `Button` dan sebuah `EditText` dengan posisi setelah `TextView` yang telah dibuat. Perhatikan bahwa `Button` dan `EditText` memiliki id yang berbeda.

    a. `Button` dan `EditText` pada bobot.
    
    ![bobot text dan button 1](images/2.8_btn_edt_bobot.png)![bobot text dan button 2](images/2.9_btn_edt_bobot2.png)


    b. `Button` dan `EditText` pada tinggi.
    
    ![tinggi text dan button 1](images/2.10_btn_edt_tinggi.png)![tinggi text dan button 2](images/2.11_btn_edt_tinggi2.png)


    c. `Button` dan `EditText` pada umur.
    
    ![umur text dan button 1](images/2.12_btn_edt_umur.png)![umur text dan button 2](images/2.13_btn_edt_umur2.png)
7. Tambahkan sebuah `Button` di bagian layout paling bawah untuk tombol proses hitung BMI.![button bmi](images/2.14_btn_hitbmi.png) 
8. Tanda merah yang terdapat di kode program diatasi dengan memperhatikan posisi `value` yang seharusnya diletakkan, seperti **@string/** berarti terletak di **app -> res -> values -> string**.

    a. string.xml

    ![strings xml](images/2.15_stringxml.png)

    b. dimen.xml

    ![dimens xml](images/2.16_dimenxml.png)

    c. drawable

## Fitur BMI

### Fungsi Dasar

### Menu Pilih Gender (RadioGrup)

### Hitung BMI 

### Tampil Hasil (Dialog Box)

## Fitur Splash Screen

### Layout splash screen

### Fungsi splash screen

### Konfigurasi Android Manifest

