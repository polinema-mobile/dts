# Welcome Activity
Welcome activity adalah activity yang di jalankan setelah splash screen, di activity welcome ini ditampilkan secara singkat fitur fitur aplikasi. Berikut ini screen shot tampilan aplikasi yang diharapkan.


## Buat Activity Baru WelcomeSlideCalendar
Buatalah activity baru dengan nama WelcomeSlideCalendar. Untuk membuatnya perhatikan gambar dibawah ini. Klik Kanan di package `dtschapter03_starter->new->activity->empty activity`.
![empty activity](images/0305emptyactivity.png)

Beri nama activity yang baru WelcomeSlideCalendar seperti pada gambar dibawah ini.
![nama activity](images/0305namaactivity.png)

Setelah itu tekan tombol ok dan android studio akan melakukan proses pembuatan activity, perhatikan di folder android manifest sudah ditambahkan activity baru dan pada folder res->layout sudah terdapat file layout baru.
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="polinema.ac.id.dtschapter03_starter">

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <!--Activity baru ditmbahkan-->
        <activity android:name=".WelcomeSlideCalendar"></activity>
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```
Jika berhasil struktur file projectnya akan seperti pada gambar dibawah ini.
![result](images/0305resultbuatactivity.png)

## Edit File activity_welcome_slide_calendar.xml
Langkah selanjutnya adalah mengubah isi file dari `activity_welcome_slide_calendar.xml`, pada layout ini akan digunakan constraint layout pastikan layout xml dimulai dengan tag berikut ini. Tambahkan background warna putih.
```xml
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#FFFFFF"
    tools:context=".WelcomeSlideCalendar">

</android.support.constraint.ConstraintLayout>
```
Pada desain layout terdapat beberapa komponen yaitu:
1. Gambar Character dengan Calender
2. Text Welcome
3. Sub Text Welcome
4. Button Get Started
5. Text Login
6. Background Footer Merah

### Tambahkan Gambar
Tambahkan gambar dengan nama `ic_eventlist` dari folder drawable ke layout
```xml
    <ImageView
        android:id="@+id/calendar"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:src="@drawable/ic_eventlist"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        android:layout_marginTop="30dp"
        />
```


perhatikan penamaan id dan constraint dari image
![image](images/0305layout2.png)
### Tambahkan Text
Tambahkan sebuah Text View untuk menulis welcome text
```xml
    <TextView
        android:id="@+id/welcome_text"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:textSize="24sp"
        android:textColor="#313131"
        android:text="Welcome To DTS VSGA"
        app:layout_constraintTop_toBottomOf="@id/calendar"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        android:fontFamily="@font/montserrat_semi_bold"
        />
```

Perhatikan bagaimana TextView disusun dan bagaimana cara mengganti font serta warna dari text view.

![welcometext](images/0305welcometext.png)

### Tambahkan Sub Text
Tambahkan sebuah sub text baru di bawah welcome text berilah id `sub_welcome`
```xml
    <TextView
        android:id="@+id/sub_welcome"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:textColor="#313131"
        android:text="What is going to happen tomorrow ?"
        app:layout_constraintTop_toBottomOf="@+id/welcome_text"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        android:fontFamily="@font/montserrat_light"
        />
```
![subtext](images/0305subtext.png)

### Tambahkan Gambar Footer
Tambahkan gambar footer dengan membuat sebuah image view dengan id `background_satu` perhatikan bahwa footer di constraint ke parent bottom dan menggunakan scaletype `fitXY`.
```xml
    <ImageView
        android:id="@+id/background_satu"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:scaleType="fitXY"
        android:src="@drawable/bg_red"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent" />
```
![footer](images/0305footer.png)
### Tambahkan Text Login
Buatlah sebuah text view berilah id `login_text` font `montserrat_light` textSize 18sp dan textColor `#FFFFFF`
```xml
    <TextView
        android:id="@+id/login_text"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        android:layout_marginBottom="72dp"
        android:textColor="#FFFFFF"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Login"
        android:textSize="18sp"
        android:fontFamily="@font/montserrat_light"
        />
```
![login](images/0305login.png)

### Tambahkan Button Get Started
Buat button dengan id `btn_get_started`, beri text `GET STARTED` fontFamily `montserrat_light` textSize `18sp` dan atur constraint agar posisi button menyerupai posisi pada desain layout.
```xml
    <Button
        android:id="@+id/btn_get_started"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="GET STARTED"
        android:layout_marginLeft="48dp"
        android:layout_marginRight="48dp"
        app:layout_constraintBottom_toTopOf="@id/login_text"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        android:layout_marginBottom="32dp"
        android:textSize="18sp"
        android:fontFamily="@font/montserrat_light"
        />
```

### Tambahkan Drawable button_white.xml
Setelah membuat button tambahkan sebuah file res drawable dengan nama `button_white.xml`, klik kanan pada folder `drawable` kemudian pilih `new drawable resource`
![drawable](images/0305drawable.png)

isi pilihan form dengan konfigurasi berikut ini
![drawablexml](images/0305omm.png)

Hasil file `button_white.xml`
![drawable](images/0305drawable2.png)

Ganti isi file `button_white.xml`
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <solid android:color="#F96060" />
    <corners android:radius="5dp" />
</shape>
```
![drwad](images/0305buttonwhitexml.png)

