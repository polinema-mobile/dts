#Intent Splash Screen

##Edit MainActivity.java
Bukalah file `MainActivity.java`, tambahkan..... pada method `onCreate`
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

##Test Aplikasi
![intent splashscreen](images/screencapture.gif)