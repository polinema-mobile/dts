# Praktikum  1: Menampilkan Google Maps

Pada bagian ini kita akan menampilkan Google Maps dengan menunjuk pada koordinat yang kita tentukan. Namun sebelum menampilkan Maps, ada beberapa tahapan yang harus dilakukan, yaitu:
1. Instalasi Google Play Service
2. Mendaftar pada Google Maps API untuk mendapatkan API Key

## Pembuatan project

1. Buat project baru dengan memilih `Google Maps Activity`.

![create project](images/01.png)

2. Isikan nama project dan package.

![project name](images/02.png)

## Instalasi Google Play Services pada Android Studio

1. Sebelum mengimplementasikan Google Maps pada proyek Android, pastikan bahwa Google Play services telah terinstall pada Android Studio dengan cara buka **Tools > SDK Manager**, maka akan muncul kotak dialog seperti pada gambar di bawah ini. Pilih tab SDK Tools dan ceklis pada Google Play Services, jika statusnya *Not Installed*, klik *Apply* pada bagian bawah untuk memulai proses instalasi.

<div style="text-align:center"><img src="images/03.PNG" /></div>

2. Setelah Google Play Services terinstall, tambahkan referensi library dari google play service ke dalam proyek Android Studio. Pada bagian **Gradle Scripts > build.gradle (Module:app)**, tambahkan baris instruksi berikut pada dependencies, dan klik `Sync Now` di bagian atas untuk melakukan sinkronisasi:
```java
    implementation 'com.google.android.gms:play-services:12.0.1'
    implementation 'com.google.android.gms:play-services-maps:12.0.1'
    implementation 'com.google.android.gms:play-services-places:12.0.1'
    implementation 'com.google.android.gms:play-services-location:12.0.1'
```
## Membuat API Key

API key diperlukan untuk mengakses server Google Maps. Key ini bersifat gratis dan dapat digunakan dengan aplikasi apa pun. Tahapan untuk membuat API Key adalah sebagai berikut:

1. Buka [Google developer console] (https://console.developers.google.com/), dan kemudian login menggunakan email gmail. Satu akun gmail hanya bisa mendapatkan satu API key.
2. Buat project baru dengan cara klik `Create` pada bagian dashboard, atau melalui dropdown `Select a Project`.
    <div style="text-align:center"><img src="images/04.PNG" /></div>
3. Pada halaman New Project, isikan nama project dan lokasi, kemudian klik tombol `Create`. 
    <div style="text-align:center"><img src="images/05.png" /></div>
4. Klik link `ENABLE APIS AND SERVICES` pada dashboard, dan pilih Maps SDK for Android. ![enable api](images/06.PNG)
5. Klik tombol `ENABLE` . Setelah itu pilih tab `Credentials`, klik `Create Credentials` pada dropdown, dan pilih api key untuk membuat key.
    <div style="text-align:center"><img src="images/07.PNG" /></div>
    Maka akan muncul popup bahwa API key telah berhasil dibuat, klik `RESTRICT KEY`.
6. Pada bagian Restrict and rename API key, pilih Android apps, masukkan SHA1, nama package, dan selanjutnya simpan perubahan.
    <div style="text-align:center"><img src="images/08.PNG" /></div>
    SHA1 dapat diambil dari file `google_maps_api.xml` seperti pada gambar berikut.
    <div style="text-align:center"><img src="images/09.PNG" /></div>
6. Setelah menyimpan pengaturan, copy API Key untuk digunakan di tahap selanjutnya.

## Menampilkan maps pada Android Studio

1. Tambahkan permission yang diperluka pada file manifest, antara lain:
    - `ACCESS_NETWORK_STATE` untuk memeriksa apakah perangkat terhubung ke suatu jaringan atau tidak
    - `INTERNET` Untuk memeriksa apakah perangkat terhubung ke Internet atau tidak
    - `ACCESS_COARSE_LOCATION` Untuk memperkirakan lokasi pengguna menggunakan WiFi atau sinyal mobile
    - `ACCESS_FINE_LOCATION` untuk memperkirakan lokasi terkini pengguna, dan OpenGL ES V2 dibutuhkan untuk Google Maps V2.
    Kode yang digunakan untuk menambahkan permission adalah sebagai berikut:
```java
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="com.google.android.providers.gsf.permission.READ_GSERVICES" />
```

2. Tambahkan API Key ke dalam file manifest dengan cara ganti value=`YOUR_KEY_HERE` dengan API Key yag telah dibuat pada proses sebelumnya. Selain itu juga perlu diambahkan versi dari Google play services. Sehingga meta-data yang terdapat pada file manifest menjadi seerti berikut:
```xml
    <meta-data
        android:name="com.google.android.gms.version"
        android:value="@integer/google_play_services_version" />

    <meta-data android:name="com.google.android.maps.v2.API_KEY"
        android:value="AIza*****"/>
```

3. API Key juga perlu ditambahkan pada file `google_maps_api.xml`, seperti berikut ini:
```xml
    <string name="google_maps_key" templateMergeStrategy="preserve" translatable="false"> AIzaSyBWLO0mRKzS4vPJP8yzcR90lxbscH9Xbzo</string>
```

4. Setelah semua pengaturan selesai dilakukan, buka file MapsActivity.java, dimana semua logic pemetaan pada aplikasi tersimpan pada file ini. MapsActivity.java memiliki fungsi onMapReady yang merupakan fungsi callback yang akan dipanggil jika maps telah siap. Di dalam fungsi ini kita dapat menambahkan marker, garis, atau menambahkan listener. Secara default, isi dari fungsi onMapReady adalah sebagai berikut:

    ```java
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        LatLng sydney = new LatLng(-34, 151);
        mMap.addMarker(new MarkerOptions().position(sydney).title("Marker in Sydney"));
        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney));
    }
    ```

    Pada kode program di atas, aplikasi akan membuat sebuah instance dari GoogleMap (objek map). Kemudian akan dibuat sebuah Marker baru untuk diletakkan pada peta. Lokasi Marker yang akan diletakkan pada peta mengacu pada variable LatLng, yang berisi koordinat latitude dan longitude (-34, 151). Terakhir, method moveCamera() akan dipanggil sehingga ketika aplikasi pertama kali dibuka, peta akan mengarah ke titik sesuai dengan koordinat yang sudah diberikan, yang dalam default adalah Sydney.

5. Jika default program di atas dijalankan, maka akan muncul Google Maps dengan maker yang mengarah ke Sydney, seperti pada gambar berikut:
    <div style="text-align:center"><img src="images/10.png" /></div>

6. Kita dapat mengubah titik koordinat (latitude, longitude), nama marker, dan beberapa fitur seperti:
    - Untuk mengubah jenis tampilan maps, gunakan: `setMapType(GoogleMap.MAP_TYPE_HYBRID)`
    - Untuk mengubah icon marker, tambahkan `icon( BitmapDescriptorFactory.fromResource(R.drawable.marker))` pada markerOptions.
    - Sedangkan untuk memperbesar tampilan peta ketika pertama kali tampil, dapat menggunakan fungsi newLatLngZoom, seperti berikut:
        `float zoomLevel = 18.0f;`
        `mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(place, zoomLevel));`
    Setelah melakukan beberapa perubahan tersebut fungsi onMapReady() akan berisi:
    ```java
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;
        LatLng place = new LatLng(-7.870978, 112.526967);
        float zoomLevel = 17.0f;

        mMap.setMapType(GoogleMap.MAP_TYPE_HYBRID);
        mMap.addMarker(new MarkerOptions().position(place)
                .title("Alun-Alun Kota Batu")
                .icon( BitmapDescriptorFactory.fromResource(R.drawable.marker)));
        mMap.moveCamera(CameraUpdateFactory.newLatLngZoom(place, zoomLevel));
    }
    ```
    Dan tampilan maps ketika pertama kali dibuka adalah seagai berikut:
    <div style="text-align:center"><img src="images/11.png" /></div>