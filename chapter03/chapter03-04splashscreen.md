# Splashscreen
**Splash screen** merupakan tamoilan awal yang pertama kali dibuka ketika aplikasi dijalankan. Ada banyak aplikasi yang menggunakan splash screen, namun ada juga yang tidak menggunakannya. Akan tetapi,  kemampuan untuk membuat splash screen tetap harus dimiliki oleh seorang junior mobile programmer.

## Buka Main Activity
Bukalah file `MainActivity.java`, file ini akan kita jadikan sebagai splash screen. Pada file `MainActivity.java`, Anda akan menemukan bahwa pada fungsi onCreate, layout yang dipanggil atau di tampilkan adalah `activity_main.xml`. Oleh karena itu, untuk mengubah tampilannya kita harus mengubah isi dari file `activity_main.xml`

## Edit file activity_main.xml
Lakukan langkah langkah berikut untuk membuat splash screen. Desain yang diinginkan untuk splash screen dapat Anda lihat pada folder `design`.
![splash](images/0304splash.png)

### Tambahkan Logo
1. Hapuslah `TextView` Hello World dari halaman activity_main.xml
2. Buatlah sebuah `ImageView` dan atur posisinya di tengah layar dengan menggunakan constraint layout

```xml
    <ImageView
        android:id="@+id/imageView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginTop="8dp"
        android:layout_marginEnd="8dp"
        android:layout_marginBottom="8dp"
        android:src="@drawable/ic_logo"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
```

### Tambahkan Text
1. Buatlah sebuah `TextView` dengan font **montsterrat semi bold** dan ganti teks dengan "**DTS Kominfo**"
2. Letakkan `TextView` tersebut dibawah logo dengan jarak 8dp.

```xml
    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginTop="8dp"
        android:layout_marginEnd="8dp"
        android:fontFamily="@font/montserrat_semi_bold"
        android:textSize="20sp"
        android:text="@string/logo_text"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/imageView" />
```
