# Tujuan
Pada praktikum kali ini kita akan belajar mengenai perpindahan dari activity satu ke activity yang lain dengan ataupun tanpa data, data tersebut berupa single value.

## Intent Explicit
Sesuai yang dijelaskan sebelumnya explicit berarti tujuan dari pembuatan adalah sesuai dengan kebutuhan developer, seorang developer harus mendefinisikan kebutuhan tersebut dan direalisasikan dalam sebuah kode program. 

<p align="center"><img src="images/chapter04-02intent-explicit.gif" alt="Intent Explicit"/></p>

Jika dilihat dari video di atas halaman pertama adalah sebuah gambar
splash screen, kemudian menuju halaman link login sebelum halaman login,
dan yang terakhir adalah halaman login berhasil. Perpindahan antara
halaman splash screen ke halaman link login menggunakan intent. Hal
tersebut dapat dilakukan menggunakan kode program di bawah ini

```java
Intent i = new Intent(MainActivity.this, WelcomeSlideCalendar.class);
startActivity(i);
```

`MainActivity.this` merupakan class sumbernya atau activity
pemanggilnya, sedangkan `WelcomeSlideCalendar.class` adalah activity
tujuan atau yang dipanggil.

>Silakan dilakukan pengecekan kode program untuk perpindahan halaman atau
>activity yang lain? seharusnya sintaks atau kode program yang digunakan
>sama. Yang perlu disesuaikan adalah activity pemanggil dan activity yang
>dipanggil.
