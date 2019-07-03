#  Intent Antar Aplikasi
Intent adalah sebuah class dalam programming Android yang berfungsi untuk perpindahan halaman. Pada praktikum ini akan dibuat intent dari form yang telah dibuat di praktikum 6 sebelumnya.

## Edit File activity_welcome_slide_calendar.xml

### Menambahkan event onclick
Tambahkan fungsi onClick `android:onClick="clickGetStarted"` pada Button Get Started untuk menuju ke halaman berikutnya dan fungsi onClick `android:onClick="clickLogin"` pada TextView Login
```xml
<Button
    android:id="@+id/btn_get_started"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:text="@string/get_started"
    android:layout_marginLeft="48dp"
    android:layout_marginRight="48dp"
    app:layout_constraintBottom_toTopOf="@id/login_text"
    app:layout_constraintLeft_toLeftOf="parent"
    app:layout_constraintRight_toRightOf="parent"
    android:background="@drawable/button_white"
    android:layout_marginBottom="32dp"
    android:textSize="18sp"
    android:fontFamily="@font/montserrat_light"
    android:onClick="clickGetStarted"
    />

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
    android:onClick="clickLogin"
    />  
```

### Buat fungsi handler onclick 
Buka file `WelcomeSlideCalendar.java`, tambahkan fungsi handler di bawah ini
```java
public void clickGetStarted(View view) {
}

public void clickLogin(View view) {
}
```

### Isi fungsi handler onclick
Isi fungsi handler OnClick dengan kode berikut
```java
public void clickGetStarted(View view) {
    Intent i = new Intent(WelcomeSlideCalendar.this, WelcomeSlideSuperhero.class);
    startActivity(i);
}

public void clickLogin(View view) {
    Intent i = new Intent(WelcomeSlideCalendar.this, WelcomeBack.class);
    startActivity(i);
}
```

## Edit File activity_welcome_back.xml

### Menambahkan event onclick
Tambahkan fungsi onClick `android:onClick="clickForgot"` pada Text View Forgot Password untuk menuju ke halaman Forgot Password dan fungsi `android:onClick="postLogin"` pada Button Login untuk melanjutkan Login.
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

<Button
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_marginStart="24dp"
    android:layout_marginEnd="24dp"
    android:textSize="18sp"
    android:layout_marginBottom="200dp"
    android:background="@drawable/button_red"
    android:text="@string/log_in"
    android:textColor="#FFFFFF"
    app:layout_constraintTop_toBottomOf="@id/forgot_password"
    android:layout_marginTop="80dp"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    android:onClick="postLogin"
    />  
```

### Buat fungsi handler onclick 
Buka file `WelcomeBack.java`, tambahkan fungsi handler di bawah ini
```java
public void clickForgot(View view) {
}

public void postLogin(View view) {
}
```

###Isi fungsi handler onclick
Isi fungsi handler OnClick dengan kode berikut
```java
public void clickForgot(View view) {
    Intent i = new Intent(WelcomeBack.this, ForgotPassword.class);
    startActivity(i);
}

public void postLogin(View view) {
    Intent i = new Intent(WelcomeBack.this, SuccessActivity.class);
    startActivity(i);
}
```

##Edit File activity_welcome_slide_superhero.xml

###tambahkan event onclick
Tambahkan fungsi onClick `android:onClick="clickGetStarted"` pada Button Get Started untuk menuju ke halaman berikutnya dan fungsi onClick `android:onClick="clickLogin"` pada TextView Login
```xml
<Button
    android:id="@+id/btn_get_started"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    app:layout_constraintBottom_toTopOf="@id/login_text"
    app:layout_constraintLeft_toLeftOf="parent"
    app:layout_constraintRight_toRightOf="parent"
    android:layout_marginLeft="42dp"
    android:layout_marginRight="42dp"
    android:textSize="18sp"
    android:text="@string/get_started"
    android:fontFamily="@font/montserrat_light"
    android:background="@drawable/button_white"
    android:layout_marginBottom="42dp"
    android:onClick="clickGetStarted"

/>
<TextView
    android:id="@+id/login_text"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintLeft_toLeftOf="parent"
    app:layout_constraintRight_toRightOf="parent"
    android:text="@string/log_in"
    android:fontFamily="@font/montserrat_light"
    android:textSize="18sp"
    android:textColor="#FFFFFF"
    android:layout_marginBottom="72dp"
    android:onClick="clickLogin"
/>
```

### Buat fungsi handler onclick 
Buka file `WelcomeSlideSuperhero.java`, tambahkan fungsi handler di bawah ini
```java
public void clickGetStarted(View view) {
}

public void clickLogin(View view) {
}
```

### Isi fungsi handler onclick
Isi fungsi handler OnClick dengan kode berikut
```java
public void clickGetStarted(View view) {
    Intent i = new Intent(WelcomeSlideSuperhero.this, WelcomeSlideAssign.class);
    startActivity(i);
}

public void clickLogin(View view) {
    Intent i = new Intent(WelcomeSlideSuperhero.this, WelcomeBack.class);
    startActivity(i);
}
```

## Edit File activity_welcome_slide_assign.xml

### Menambahkan event onclick
Tambahkan fungsi onClick `android:onClick="clickGetStarted"` pada Button Get Started untuk menuju ke halaman berikutnya dan fungsi onClick `android:onClick="clickLogin"` pada TextView Login
```xml
<Button
    android:id="@+id/btn_get_started"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    app:layout_constraintBottom_toTopOf="@+id/login_text"
    app:layout_constraintLeft_toLeftOf="parent"
    app:layout_constraintRight_toRightOf="parent"
    android:layout_marginLeft="42dp"
    android:layout_marginRight="42dp"
    android:text="Get Started"
    android:background="@drawable/button_white"
    android:layout_marginBottom="32dp"
    android:textSize="18sp"
    android:onClick="clickGetStarted"
    android:fontFamily="@font/montserrat_light"
    />

<TextView
    android:id="@+id/login_text"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:text="Log In"
    android:textColor="#FFFFFF"
    app:layout_constraintBottom_toBottomOf="parent"
    app:layout_constraintLeft_toLeftOf="parent"
    app:layout_constraintRight_toRightOf="parent"
    android:textSize="18sp"
    android:fontFamily="@font/montserrat_light"
    android:layout_marginBottom="72dp"
    android:onClick="clickLogin"
    />
```

### Buat fungsi handler onclick 
Buka file `WelcomeSlideAssign.java`, tambahkan fungsi handler di bawah ini
```java
public void clickGetStarted(View view) {

}

public void clickLogin(View view) {

}
```

### Isi fungsi handler onclick
Isi fungsi handler OnClick dengan kode berikut
```java
public void clickGetStarted(View view) {
    Intent i = new Intent(WelcomeSlideAssign.this, WelcomeBack.class);
    startActivity(i);
}

public void clickLogin(View view) {
    Intent i = new Intent(WelcomeSlideAssign.this, WelcomeBack.class);
    startActivity(i);
}
```

## Edit File activity_forgot_password.xml

### Menambahkan event onclick
Tambahkan fungsi onClick `android:onClick="postSendRequest"` pada Button Send Request untuk mengirim alamat email user
```xml
<Button
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_marginStart="24dp"
    android:layout_marginEnd="24dp"
    android:textSize="18sp"
    android:background="@drawable/button_red"
    android:text="@string/send_request"
    android:textColor="#FFFFFF"
    app:layout_constraintTop_toBottomOf="@id/edt_reset_code"
    android:layout_marginTop="32dp"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    android:onClick="postSendRequest"
    />
```

### Buat fungsi handler onclick 
Buka file `ForgotPassword.java`, tambahkan fungsi handler di bawah ini
```java
public void postSendRequest(View view) {
}
```

### Isi fungsi handler onclick
Isi fungsi handler OnClick dengan kode berikut
```java
public void postSendRequest(View view) {
    Intent i = new Intent(ForgotPassword.this, ResetPassword.class);
    startActivity(i);
}
```

## Edit File activity_reset_password.xml

### Menambahkan event onclick
Tambahkan fungsi onClick `android:onClick="postChangePassword"` pada Button Change Password untuk merubah password
```xml
<Button
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:layout_marginStart="24dp"
    android:layout_marginEnd="24dp"
    android:textSize="18sp"
    android:layout_marginTop="64dp"
    android:background="@drawable/button_red"
    android:text="@string/change_password"
    android:textColor="#FFFFFF"
    app:layout_constraintEnd_toEndOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintTop_toBottomOf="@id/edt_confirm_password"
    android:onClick="postChangePassword"
    />
```

### Buat fungsi handler onclick 
Buka file `ResetPassword.java`, tambahkan fungsi handler di bawah ini
```java
public void postChangePassword(View view) {
}
```

### Isi fungsi handler onclick
Isi fungsi handler OnClick dengan kode berikut
```java
public void postChangePassword(View view) {
    Intent i = new Intent(ResetPassword.this, SuccessActivity.class);
    startActivity(i);
}
```

## Test Aplikasi
Berikut ini hasil dari...
![intent activity](images/screencapture.gif)
