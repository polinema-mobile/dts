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

1. Buka **activity_main.xml** yang terletak di **app -> res -> layout -> activity_main.xml**. 
   ![activity main awal](images/2.1_activity_main_kosong.png)
2. Buat layout dengan jenis `Constraint Layout`. tambahkan id dengan nama `activity_main`.
   ![activity main](images/2.2_id_activity_main.png)
3. Tambahkan sebuah komponen `radio group`. Perhatikan bahwa constraint yang berlaku pada komponen radio grup ini antara lain:
`app:layout_constraintEnd_toEndOf="parent"`,
`app:layout_constraintStart_toStartOf="parent"`, dan
`app:layout_constraintTop_toTopOf="parent"`.
![radio grup](images/2.3_radio_grup.png)
4. Item-item pada `radio group` diwujudkan sebagai `radio button`, tambahkan properti-properti berikut di `radio button`,abaikan sementara tanda merah di kode program.
![radio button](images/2.4_radio_button.png)
5. Tambahkan tiga buah TextView, berikan nama masing-masing **Bobot(kg)**, **Tinggi(cm)**, **Umur(th)**.
   ![textview satu](images/2.6_textview1.png)
   ![text view 2](images/2.7_textview2.png)
6. Tambahkan dua buah `Button` dan sebuah `EditText` dengan posisi setelah `TextView` yang telah dibuat. Perhatikan bahwa `Button` dan `EditText` memiliki id yang berbeda.

    a. `Button` dan `EditText` pada bobot.
    ![bobot text dan button 1](images/2.8_btn_edt_bobot.png)
    ![bobot text dan button 2](images/2.9_btn_edt_bobot2.png)

    b. `Button` dan `EditText` pada tinggi.
    ![tinggi text dan button 1](images/2.10_btn_edt_tinggi.png)
    ![tinggi text dan button 2](images/2.11_btn_edt_tinggi2.png)

    c. `Button` dan `EditText` pada umur.
    ![umur text dan button 1](images/2.12_btn_edt_umur.png)
    ![umur text dan button 2](images/2.13_btn_edt_umur2.png)
7. Tambahkan sebuah `Button` di bagian layout paling bawah untuk tombol proses hitung BMI.
   ![button bmi](images/2.14_btn_hitbmi.png) 
8. Tanda merah yang terdapat di kode program diatasi dengan memperhatikan posisi `value` yang seharusnya diletakkan, seperti **@string/** berarti terletak di **app -> res -> values -> string**.

    a. **string.xml**, di dalam **string.xml** selain `logo_plus` dan `logo_minus` terdapat beberapa string yang sudah tertulis, oleh karena itu sebaiknya peserta menuliskan semua string sesuai dengan petunjuk di bawah ini sehingga seluruh sumber daya string yang digunakan pada aplikasi yang dibuat langsung tersedia tanpa harus menyediakan string tersebut pada setiap langkah penulisan kode program.
    ![strings xml](images/2.15_stringxml.png)

    b. **dimen.xml**
    
    ![dimens xml](images/2.16_dimenxml.png)

    c. **drawable**, berdasarkan properti pada `RadioButton` yang sudah dibuat di **activity_main.xml** yaitu `android:background="@drawable/radio_flat_selector"` dan `android:textColor="@drawable/radio_flat_text_selector"`, maka di direktori drawable perlu penambahan berkas sumber daya bernama **radio_flat_selector.xml** yang berfungsi memberikan efek ganti warna pada `RadioButton` ketika dipilih (berwarna pink) atau tidak dipilih (warna putih) dan **radio_flat_text_selector.xml** yang berfungsi untuk memberikan warna yang khas ketika terpilih (teks berwarna putih) dan tidak terpilih (teks berwarna pink) bagi setiap teks di `RadioButton` tersebut.

    ### radio_flat_selector.xml

    ![radio_flat_text_selector xml](images/2.18_warna_rdbtn.png)

    Perlu diketahui bahwa di dalam **radio_flat_selector.xml** ternyata membutuhkan **radio_flat_selected.xml** sebagai penanda perubahan warna untuk `RadioButton` yang terpilih dan **radio_flat_regular.xml** sebagai penanda perubahan warna untuk `RadioButton` yang tidak terpilih di direktori **drawable**, oleh karena itu tambahkan dua berkas tersebut.

    ### radio_flat_selected.xml

    ![radio_flat_selected xml](images/2.19_rd_selected.png)

    ### radio_flat_regular.xml
    
    ![radio_flat_reguler xml](images/2.20_rd_reguler.png)

    Perhatikan tag `<shape>` di kedua berkas radio flat, terdapat `android:shape="rectangle"` yang menandakan `RadioButton` yang dibuat berbentuk persegi (mirip `Button`, bukan bulatan point seperti `RadioButton` pada umumnya). 
    Jika `@color/colorWhite` belum terdaftar di **colors.xml** di **values** maka tambahkan `<color name="colorWhite">#FFFFFF</color>` di dalamnya

    Adapun isi dari **radio_flat_text_selector.xml** adalah sebagai berikut:

    ### radio_flat_text_selector.xml

    ![radio_flat_text_selector xml](images/2.17_warna_teks_rdbtn.png)

## Fitur BMI

Fungsi yang dikembangkan dibuat di **MainActivity.java** meliputi: fungsi dasar, fungsi hitung BMI, dan tampilan hasil melalui Dialog Box.

### Fungsi Dasar

1. Berdasarkan kegiatan sebelumnya, diketahui terdapat tiga komponen antarmuka untuk masukan yang dibuat, yaitu: `EditText`, `RadioGroup`, dan `RadioButton`. Walaupun terdapat beberapa `Button` yang memiliki id yaitu `calc`, `krgBerat`, `tmbBerat`, `krgTinggi`, `tmbTinggi`, `krgUmur`, dan  `tmbUmur` untuk memproses nilai masukan, `Button` tersebut tidak perlu diinisialisasikan di **MainActivity.java** karena sudah didaftarkan `android:onClick=""` di `Button` tersebut (secara otomatis mengarah ke method yang dituju). 

    ![dasarsatu MainActivity java](images/2.21_dasarsatu.png)

2. Tambahkan inisialisasi tipe data dari setiap `EditText` yang ditampilkan di antarmuka.

    ![dasardua MainActivity java](images/2.22_dasardua.png)

3. Kenalkan komponen tersebut sesuai id yang didaftarkan melalui activity_main.xml.

    ![dasartiga MainActivity java](images/2.23_dasartiga.png)

    Khusus `RadioGroup` pastikan juga diberikan sebuah variabel bernama `pilihGender` untuk mendapatkan id dari `RadioButton` yang dipilih.

    ![dasarempat MainActivity java](images/2.24_dasarempat.png)

4. Supaya tombol plus dan minus yang terdapat pada setiap menu bobot, tinggi, dan umur berfungsi maka buat method untuk mengaktifkan pengurangan dan penambahan nilai pada `EditText` di setiap menu.
Contoh pada menu bobot

    ![dasarlima MainActivity java](images/2.25_dasarlima.png)

    Buat juga method yang lain untuk menu tinggi dan umur sesuai yang terdaftar di `android:onClick=""` di **activity_main.xml**. Jika `displayBerat()` masih berwarna merah, abaikan saja karena method ini dibuat di langkah selanjutnya.

5. Supaya method yang dibuat pada langkah 4 (langkah sebelumnya) berfungsi di EditText, maka tambahkan method display untuk setiap menu.

    ![dasarenam MainActivity java](images/2.26_dasarenam.png)

    Buat juga method yang lain untuk menu tinggi dan umur.

6. Versi lengkap dari langkah 4 dan 5 adalah sebagai berikut

    **method krg dan tmb**.

    ![dasartujuh MainActivity java](images/2.27_dasartujuh.png)

    **method display**.

    ![dasarenam MainActivity java](images/2.28_dasardelapan.png)

### Hitung BMI 

Penghitungan BMI membutuhkan method `calculateBMI()` sesuai dengan properti `android:onClick="calculateBMI"` pada `Button` dengan id `calc`.

1. Buat method `calculateBMI()`.

    ![bmisatu MainActivity java](images/2.29_bmisatu.png)

2. Inisialisasi tipe data string untuk variabel `bobotStr` dan `tinggiStr`.

    ![bmidua MainActivity java](images/2.30_bmidua.png)

3. Untuk menghitung BMI, pastikan kolom bobot dan tinggi tidak null (kosong).

    ![bmitiga MainActivity java](images/2.31_bmitiga.png)

4. Tambahkan penghitungan BMI.

    ![bmiempat MainActivity java](images/2.32_bmiempat.png)

5. Tambahkan `displayBMI()` untuk menampilkan hasil penghitungan BMI. Jika `displayBMI()` bertanda merah, abaikan dulu karena method akan dibuat pada subbab selanjutnya.

    ![bmilima MainActivity java](images/2.33_bmilima.png)

### Tampil Hasil Hitung BMI

Hasil peghitungan BMI ditampilkan dalam bentuk `AlertDialog` yang diproses di method `displayBMI()`.

1. Buat method `displayBMI()`.

    ![tampilsatu MainActivity java](images/2.34_tampilsatu.png)

2. Buat variabel dengan tipe data String bernama `bmiLabel` (untuk menampilkan hasil penghitungan BMI) dan `infoUmur` (untuk menampilkan nilai dari kolom umur yang telah dimasukkan).

    ![tampildua MainActivity java](images/2.35_tampildua.png)

3. Tambahkan informasi kategori BMI berdasarkan kriteria berikut.

    **Kriteria BMI**

    Terlalu sangat kurus : 0 - 15.0
    
    Sangat kurus : 15.0 - 16.0
    
    Kurus : 16 - 18.5
    
    Normal : 18.5 - 25
    
    Gemuk : 25 - 30
    
    Cukup Gemuk : 30 - 35
    
    Sangat Gemuk : 35 - 40
    
    Terlalu sangat gemuk : > 40

    ![tampiltiga MainActivity java](images/2.36_tampiltiga.png)

4. Tambahkan `bmiLabel` sebagai variabel penampung data yang dimasukkan dan hasil penghitungan BMI.
    ```
    bmiLabel = "Jenis kelamin: " +  rdGender.getText() + "\n\n" + "Hasil     Penghitungan BMI : " + bmi + " --- " +  "Kategori: " + "(" + bmiLabel + ")" + "\n\n"     + "Umur : " + infoUmur;
    ```

5. Hasil yang ditampilkan berupa `AlertDialog`, buat `AlertDialog` dengan mengambil data dari `bmiLabel` dan jenis tombol penutupnya adalah `NeutralButton` tanpa perintah apapun di dalam `onClick`.

    ```
    AlertDialog.Builder tampilBMI = new AlertDialog.Builder(this);

    tampilBMI.setTitle("Hasil Penghitunan BMI");

    tampilBMI.setMessage(bmiLabel).setNeutralButton("Tutup", new DialogInterface.OnClickListener() {
        @Override
        public void onClick(DialogInterface dialogInterface, int i) {

            }
        });

    AlertDialog alertDialog = tampilBMI.create();
    alertDialog.show();
    ```

## Fitur Splash Screen

**SplashScreen** dibuat sebagai pengantar dari aplikasi dibuka.

### Layout splash screen

1. Buat layout baru bernama **splashbmi.xml** dengan satu komponen `TextView` (boleh ditambah komponen lain). Warna background pada modul ini menggunakan warna `#3395ff`.

    ![splashsatu MainActivity java](images/3.1_splashscreensatu.png)

2. Hasil layout **splashbmi.xml**.

    ![splashdua MainActivity java](images/3.2_splashscreendua.png)

### Fungsi splash screen

Buat **SplashActivity.java**, intent diarahkan ke **MainActivity.java** melalui `handler`, splash screen diatur selama 3.000 second.
    ![splashtiga MainActivity java](images/3.3_splashscreentiga.png)

### Konfigurasi Android Manifest

Karena tampilan awal dari aplikasi ini adalah splash screen, maka harus dilakukan perubahan pengaturan di **AndroidManifest.xml** dengan cara sebagai berikut:

1. Buka **AndroidManifest.xml** di **app -> manifest - AndroidManifest.xml**.
2. Ubah `<activity android:name=".MainActivity">` menjadi `<activity android:name=".SplashActivity">`.
3. Tambahkan activity baru dengan nama `.MainActivity` sehingga kode di dalam **AndroidManifest.xml** secara keseluruhan adalah sebagai berikut.
    ![splashempat MainActivity java](images/3.4_splashscreenempat.png)

## Hasil Aplikasi

Jalankan aplikasi yang telah dibuat, jika berhasil maka aplikasi akan berjalan sesuai tahapan berikut:

1. Muncul splashscreen sebagai tampilan pembuka aplikasi.
    ![hasilsatu MainActivity java](images/4.1_hasilsatu.png)

2. Tampilan berikutnya adalah tampilan kalkulator dengan set nilai pada setiap menu bobot, tinggi, dan umur adalah 0 (sesuai set saat inisialisasi di kode program).
    ![hasildua MainActivity java](images/4.2_hasildua.png)

3. Percobaan pengisian data.
    ![hasiltiga MainActivity java](images/4.3_hasiltiga.png)

4. Tekan tombol **Hitung BMI** dan laporan hasil penghitungan ditampilkan.
    ![hasilempat MainActivity java](images/4.4_hasilempat.png)
