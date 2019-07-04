# Intent Splash Screen

## Edit MainActivity.java
Bukalah file `MainActivity.java`, tambahkan kode berikut pada method `onCreate`, sehingga ketika ketila membuka aplikasi kemudian tampil splash screen setelah itu akan menampilkan welcome activity 
```java
new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                Intent i = new Intent(MainActivity.this, WelcomeSlideCalendar.class);
                startActivity(i);
                finish();
            }
        }, 1000);
```

