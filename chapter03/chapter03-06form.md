#Login Form
Login Form merupakan .... Di activity ini ditampilkan form Login ...... Berikut ini screen shot tampilan aplikasi yang diharapkan.
![Sign In](images/Sign%20In.png)

##Buat activity WelcomeBack
Buatlah activity baru dengan nama WelcomeBack. Halaman ini akan digunakan sebagai halaman login. 

##Edit activity_welcome_back.xml
Langkah selanjutnya adalah mengubah isi file dari `activity_welcome_back.xml`, pada layout ini akan digunakan constraint layout pastikan layout xml dimulai dengan tag berikut ini. Tambahkan background warna putih.
```xml
<android.support.constraint.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#FFFFFF"
    tools:context=".WelcomeBack">

</android.support.constraint.ConstraintLayout>
```
Pada desain layout terdapat beberapa komponen yaitu:
1. Judul
2. Sub Judul
3. Username
4. Edit Text Username
5. Password
6. Edit Text Password
7. Text Forgot Password
8. Button Login

###Tambahkan Judul
Tambahkan sebuah TextView untuk menulis judul
```xml
<TextView
        android:id="@+id/welcome_back"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:fontFamily="@font/montserrat_semi_bold"
        android:text="Welcome Back"
        android:textColor="#313131"
        android:textSize="32sp"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        android:layout_marginTop="90dp"
        />
```

###Tambahkan Sub Judul
Tambahkan sebuah sub text baru di bawah judul, berilah id `sign_in`
```xml
<TextView
        android:id="@+id/sign_in"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:layout_marginTop="8dp"
        android:fontFamily="@font/montserrat_light"
        android:text="@string/sign_in_to_continue"
        android:textColor="#9b9b9b"
        android:textSize="16sp"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintTop_toBottomOf="@id/welcome_back" />
```

###Tambahkan Username
Tambahkan Text View untuk label Username.
```xml
<TextView
        android:id="@+id/reset_code"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginLeft="20dp"
        android:layout_marginTop="48dp"
        android:text="Username"
        android:textColor="#313131"
        android:textSize="20sp"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/sign_in" />
```

###Tambahkan Edit Text Username
Tambahkan Edit Text untuk pengisian Username
```xml
<EditText
        android:id="@+id/edt_reset_code"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:layout_marginTop="8dp"
        android:layout_marginRight="24dp"
        android:hint="Enter Your Email"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toBottomOf="@id/reset_code"
        />
```

###Tambahkan Password
Tambahkan label Password menggunakan TextView
```xml
<TextView
        android:id="@+id/new_password"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginLeft="20dp"
        android:layout_marginTop="8dp"
        android:text="Password"
        android:textColor="#313131"
        android:textSize="20sp"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/edt_reset_code" />
```

###Tambahkan Edit Text Password
Tambahkan EditText untuk pengisian password.
```xml
<EditText
        android:id="@+id/edt_new_password"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginLeft="24dp"
        android:layout_marginTop="8dp"
        android:layout_marginRight="24dp"
        android:hint="@string/enter_your_password"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/new_password" />
```

###Tambahkan Text Forgot Password
Tambahkan text Forgot Password yang dapat di-klik untuk pengguna yang lupa password.
```xml
<TextView
        android:id="@+id/forgot_password"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="8dp"
        android:layout_marginRight="24dp"
        android:text="@string/forgot_password"
        android:textColor="#313131"
        android:textSize="18sp"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toBottomOf="@id/edt_new_password"
        android:onClick="clickForgot"
        />
```
###Buat Drawable button_red.xml
Tambahkan sebuah file res drawable dengan nama `button_red.xml`. Ganti isi file `button_red.xml`
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android"
    android:shape="rectangle">
    <solid android:color="#F96060" />
    <corners android:radius="5dp" />
</shape>
```

###Tambahkan Button Login
Buat Button Log In, beri text `LOG IN` dengan warna text putih.
```xml
<Button
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginStart="24dp"
        android:layout_marginEnd="24dp"
        android:textSize="18sp"
        android:layout_marginBottom="200dp"
        android:background="@drawable/button_red"
        android:text="LOG IN"
        android:textColor="#FFFFFF"
        app:layout_constraintTop_toBottomOf="@id/forgot_password"
        android:layout_marginTop="80dp"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        android:onClick="postLogin"
        />
```

