# Buka Project Starter Code

## Yang sudah ada di starter code
Clone repository starter code [Starter Code Chapter 3](https://github.com/siubie/dtschapter03-starter), jika menggunakan git jalankan perintah ini di console
```
git clone https://github.com/polinema-mobile/dtschapter03-starter.git
```
Atau jika tidak memiliki git silahkan download zip dari url repository
![download zip github](images/03zipdl.png)

## Screen Layout Desain
Screen layout desain sudah disediakan di dalam starter code layout ini dapat anda lihat pada folder `design`, untuk melihat isi folder design ganti view pada android studio menjadi `project`
![folder design](images/03folderdesign2.png)

## Cara Import Drawable
Untuk mengubah desain layout menjadi layout android xml diperlukan asset berupa potongan gambar yang sudah disesuaikan ukurannya dengan sistem resolusi sistem operasi android mulai dari `hdpi`,`mdpi`,`xdpi`,`xxhdpi`,dan `xxxhdpi`. Untuk semua layout pada folder design sudah dipotongkan dan disiapkan gambarnya di starter code. Sebagai pengetahuan tambahan proses untuk memasukkan gambar ke folder res pada android studio dilakukan dengan cara berikut.

1. Buka tab Resource Manager
![resource manager](images/03resourcemanager.png)
2. Klik tombol `+`
![resource manager plus](images/03resourcemanagerplus.png)
3. Pilih menu import drawables
![import drawable](images/03imagedrawable.png)
4. Select semua folder kemudian klik open
![import](images/03importhdpo.png)
5. Pilih gambar yang akan di import kemudian klik import
![import again](images/03importhem.png)

## Cara Import Custom Font
Pada starter code juga sudah disediakan dua varian custom font yang dapat digunakan pada layout android. Untuk mengimport custom font dilakukan dengan langkah langkah berikut :
1. Klik kanan pada folder `res` kemudian pilih `new -> android resource directory`
![import font](images/03resourcedirectory.png)
2. Pilih Resource type `font`
![font](images/03fontfolder.png)
3. Copy dan paste custom font yang anda miliki ke dalam folder font ini, dengan syarat penamaan font semua menggunakan huruf kecil dan disambungkan dengan menggunakan underscore.
