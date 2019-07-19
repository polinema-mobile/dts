## Best Practice 01 - Implicit Intent dengan App Chooser

Pada pertemuan ke-3 dan ke-4 kita telah belajar bagaimana cara membuat intent, baik intent implicit dan explicit. Kita sudah mengetahui bahwa intent implicit akan membawa kita kepada activity pada aplikasi lain. Menurut *best practice*, pada saat kita akan mengirim data melalui implicit intent maka kita harus melakukan pengecekan. Pengecekan yang dimaksud adalah, 
> Jika ada lebih dari satu aplikasi yang dapat digunakan untuk menerima implicit intent maka tampilkan pilihan aplikasi mana yang dapat digunakan oleh user (app chooser).

Teknik ini dapat menjadi pengalaman yang baik bagi user (*user experience*) karena user dizinkan untuk memilih aplikasi mana yang mereka percaya. Potongan kode dibawah ini merupakan contoh fungsi sederhana yang menerapkan ***app chooser***.

```java
public void sendEmail(View view){
    Intent i = new Intent(Intent.ACTION_SEND);

    // Isi intent send email
    i.setType("text/plain");
    i.putExtra(Intent.EXTRA_EMAIL, new String[]{"dts@polinema.ac.id"});
    i.putExtra(Intent.EXTRA_SUBJECT, "Test Email");
    i.putExtra(Intent.EXTRA_TEXT, "Welcome to dts 2019");

    // Buat daftar client email yang ada di hardware android
    List<ResolveInfo> possibleApps = getPackageManager()
            .queryIntentActivities(i, PackageManager.MATCH_ALL);

    if(possibleApps.size() > 1){
        // Jika client email lebih dari satu, tampilkan app chooser
        String title = "Pilih Client Email";
        Intent chooser = Intent.createChooser(i, title);
        startActivity(chooser);
    } else if(i.resolveActivity(getPackageManager()) != null) {
        startActivity(i);
    }
}
```

## Best Practice 02 - Gunakan Credential Pada Informasi Sensitif

### Basic Credential

Melindungi data yang penting adalah wajib bagi pengembanga aplikasi. Data sensitif dari user harus kita jaga sehingga hanya yang berhak yang dapat mengakses informasi dari data sensitif tersebut. Untuk itu, sebelum user akan mengakses data sensitif, kita dapat memastikan user tersebut adalah berhak dengan menanyakan ***credential*** yang dia miliki. Terdapat beberapa macam *credential* pada Android saat ini, diantaranya dalah password, PIN, dan pola (*pattern*). Pada hardware Android terbaru, terdapat *credential* yang memanfaatkan fungsi biometrik seperti sidik jari (*fingerprint*) dan wajah (*face recognition*).

Selanjutnya, kita akan mencoba membuat *credential* pada aplikasi Android

1. Buatlah proyek Android baru dengan nama *Basic Credential* dengan target minimal SDK adalah Lollipop (SDK 21)
2. Pada `activity_main.xml` buatlah sebuah  `TextView` dan `Button` seperti pada kode dibawah ini,

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/tv_label"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginEnd="8dp"
        android:layout_marginBottom="32dp"
        android:text="App is Unlocked"
        android:textSize="24sp"
        app:layout_constraintBottom_toTopOf="@+id/btn_reauthenticate"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent" />

    <Button
        android:id="@+id/btn_reauthenticate"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginTop="8dp"
        android:layout_marginEnd="8dp"
        android:layout_marginBottom="8dp"
        android:onClick="reauntheticate"
        android:text="Reauthenticate"
        android:textSize="24sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

3. Pada values `strings.xml` tambahkan value berikut ini,

```xml
 <string name="unlock">Unlock</string>
<string name="confirm_pattern">Confirm your screen lock PIN,Pattern or Password</string>
<string name="setting_label"><![CDATA[Please set the screen lock Manually by navigating to : Settings>Security.]]></string>
<string name="unlock_failed">Failed to Unlock the app.</string>
<string name="device_is_secure">Device is now secure.</string>
<string name="security_device_cancelled">Device is not secure or user cancel the request.</string>
```

4. Pada `MainActivity.java` buatlah variabel static seperti dibawah ini,

```java
public static final int LOCK_REQUEST_CODE = 221;
public static final int SECURITY_SETTING_REQUEST_CODE = 223;
    
TextView textView;
```

5. Selanjutnya kita akan membuat fungsi atau method dengan nama `authenticateApp()`. Isi dari method tersebut adalah sebagai berikut,

```java
// Method untuk autentikasi
private void authenticateApp() {
    // Isiasi obyek KeyguardManager
    // KeyguardManager digunakan untuk mengontrol buka (unlock) dan tutup (lock)
    KeyguardManager keyguardManager = (KeyguardManager) getSystemService(KEYGUARD_SERVICE);

    //Cek apakah device Android lebih atau sama dengan versi Lollipop
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        
        //Membuat intent untuk membuka tampilan autentikasi
        Intent i = keyguardManager.createConfirmDeviceCredentialIntent(getResources().getString(R.string.unlock), getResources().getString(R.string.confirm_pattern));
        try {
            //Jalankan intent jika autentikasi telah dilakukan, kirim request code
            startActivityForResult(i, LOCK_REQUEST_CODE);
        } catch (Exception e) {

            //Exception dijalankan jika device Android belum mengimplementasikan PIN/password/pattern
            //User dipaksa untuk membuat pengaturan security untuk membuatan PIN/password/pattern
            Intent intent = new Intent(Settings.ACTION_SECURITY_SETTINGS);
            try {
                //Jalankan intent ke setting
                startActivityForResult(intent, SECURITY_SETTING_REQUEST_CODE);
            } catch (Exception ex) {
                //Jika setting tidak ditemukan, infokan ke user jika user harus membuat PIN/passowrd/pattern
                // secara manual
                textView.setText(getResources().getString(R.string.setting_label));
            }
        }
    }
}
```

6. Lakukan override untuk fungsi `onActivityResult()` sebagai respon dari fungsi `authenticateApp()`. Kode dari method `onActivityResult()` adalah sebagai berikut,

```java
@Override
protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    switch (requestCode) {
        case LOCK_REQUEST_CODE:
            if (resultCode != RESULT_OK) {
                // Jika autentikasi tidak sukses, update TextView pada main_activity.xml
                textView.setText(getResources().getString(R.string.unlock_failed));
            }
            break;
        case SECURITY_SETTING_REQUEST_CODE:
            // Cek apakah user sudah menyalakan pengaturan security baik PIN/password/pattern
            if (isDeviceSecure()) {
                // Jika ditemukan pengaturan security
                Toast.makeText(this, getResources().getString(R.string.device_is_secure), Toast.LENGTH_SHORT).show();
                // Lakukan autentikasi ulang
                authenticateApp();
            } else {
                // Jika tidak ditemukan pengaturan security, update TextView di main_activity.xml
                textView.setText(getResources().getString(R.string.security_device_cancelled));
            }
            break;
    }
}
```

7. Selanjutnya, karena kita belum membuat method `isDeviceSecure()` yang sudah digunakan pada method `onActivityResult()` maka kita harus membuat method tersebut. Kodenya adalah sebagai berikut,

```java
private boolean isDeviceSecure(){
    KeyguardManager keyguardManager = (KeyguardManager) getSystemService(KEYGUARD_SERVICE);

    //Cek pengaturan security pada SDK versi 16 (Jelly Beans) ke atas
    return Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN && keyguardManager.isKeyguardSecure();

    // Kita dapat menggunakan keyguardManager.isDeviceSecure();
    // akan tetapi minimal SDK yang harus digunakan adalah versi 23 atau Marsmellow
    // Contoh :
    // return Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && keyguardManager.isDeviceSecure();
}
```

8. Buat method `reauthenticate()` sebagai handler button yang telah dibuat sebelumnya. Isi kode hanya memanggil method `authenticateApp`. Fungsi ini digunakan untuk mengautentikasi ulang.

```java
public void reauthenticate(View view){
    authenticateApp();
}
```

9. Update kode pada method `onCreate()` menjadi seperti berikut,

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    textView = findViewById(R.id.tv_label);
    authenticateApp();
}
```

Build aplikasi. Kita akan melihat, bahwa kita dapat masuk kedalam aplikasi, kita diminta untuk memasukkan *credential* sesuai dengan pengaturan security yang sudah kita gunakan dalam device Android.

### Biometric Credential (>=API 28)

Mulai Android 9 (SDK 28), Android telah mengembangkan library untuk kebutuhan autentikasi dengan menggunakan metode *biometric* dengan nama **BiometricPrompt API**. Penggunaan library tersebut mencakup metode biometric sidik jari dan metode yang lain (kedepannya). Kedepannya, library **FingerprintManager** untuk sidik jari, tidak dapat digunakan untuk versi Android mulai 9 (SDK 28) ke atas dan harus menggunakan **BiometricPrompt API**. 

Berikut merupakan contoh implementasi library **BiometricPrompt API**

1. Buat project baru dengan nama **Biometric Credential**. Pastikan minimal SDK adalah 28 atau Android P
2. Implementasi library biometric pada gradle

```gradle
implementation 'androidx.biometric:biometric:1.0.0-alpha04'
implementation 'androidx.annotation:annotation:1.1.0'
```

3. Buatlah sebuah `Button` pada layout `main_activity.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <!-- method loginAction akan dibuat pada MainActivity.java -->
    <Button
        android:id="@+id/btn_login"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="8dp"
        android:layout_marginTop="8dp"
        android:layout_marginEnd="8dp"
        android:layout_marginBottom="8dp"
        android:onClick="loginAction"
        android:text="Log In"
        android:textSize="30sp"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

4. Pada `MainActivity.java` deklarasikan variabel berikut ini,

```java
private Handler handler = new Handler();

private Executor executor = new Executor() {
    @Override
    public void execute(Runnable command) {
        handler.post(command);
    }
};

Button btnLogin;
```

5. Buatlah method dengan nama `showBiometricPrompt()` dan isikan kode dibawah ini,

```java
private void showBiometricPrompt() {
    // Membuat tampilan autentikasi biometrik
    BiometricPrompt.PromptInfo promptInfo =
            new BiometricPrompt.PromptInfo.Builder()
            .setTitle("Biometric login for my app")
            .setSubtitle("Log in using your biometric credential")
            .setNegativeButtonText("Cancel")
            .build();

    // Inisasi proses autentiksi biometrik
    BiometricPrompt biometricPrompt = new BiometricPrompt(MainActivity.this,
            executor, new BiometricPrompt.AuthenticationCallback() {
        
        // Callback jika autentikasi error
        @Override
        public void onAuthenticationError(int errorCode,
                @NonNull CharSequence errString) {
            super.onAuthenticationError(errorCode, errString);
            Toast.makeText(getApplicationContext(),
                "Authentication error: " + errString, Toast.LENGTH_SHORT)
                .show();
        }

        // Callback jika autentikasi berhasil
        @Override
        public void onAuthenticationSucceeded(
                @NonNull BiometricPrompt.AuthenticationResult result) {
            super.onAuthenticationSucceeded(result);
            
            Toast.makeText(getApplicationContext(),
                "Authentication Success!", Toast.LENGTH_LONG)
                .show();


        }

        // Callback jika autentikasi gagal
        @Override
        public void onAuthenticationFailed() {
            super.onAuthenticationFailed();
            Toast.makeText(getApplicationContext(), "Authentication failed",
                Toast.LENGTH_SHORT)
                .show();
        }
    });

    // Tampilkan prompt biometrik
    biometricPrompt.authenticate(promptInfo);
}
```

6. Langkah terakhir buatlah method untuk handler onClick dari button login dengan nama `loginAction()`

```java
public void loginAction(View view){
    showBiometricPrompt();
}
```

Build dan jalankan aplikasi. Autentikasi biometrik akan diminta ketika kita menekan tombol **Log In**
