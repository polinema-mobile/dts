# Proyek

Carilah sebuah ide aplikasi Android yang akan anda kembangkan. Analisa ide
tersebut, kemudian rancanglah desain layout yang dibutuhkan. Implementasikan
hasil rancangan itu menjadi layout Android dalam format xml.

## Kriteria

Proyek yang dikerjakan, setidaknya harus memenuhi kriteria berikut.

- Mempunyai tampilan *splashscreen*.
- Terdapat interaksi antar tampilan satu ke tampilan lainnya (dapat menggunakan
 Activity atau Fragment)
- Menampilkan data yang direpresentasikan ke dalam RecyclerView.
- Terdapat validasi input.
- Minimal terdapat 4 tampilan layar.

> Konsultasikan ide anda kepada instruktur sebelum memulai mengerjakan. Anda
> dapat mendeklarasikan static variable pada class turunan `Application`, untuk
> mensimulasikan penyimpanan pada aplikasi anda. Contoh deklarasi variable,
> sebagai berikut.

```java
class MyApplication extends android.app.Application {
  public static List<Data> DATA;

  @Override
  public void onCreate() {
    super.onCreate();
    DATA = new ArrayList<>();
  }
}
```

Atur pada file `AndroidManifest.xml` pada tag `<application>` tambahkan atribut
`name` sehingga menjadi seperti berikut.

```xml
...

<application
  android:name=".MyApplication"
  ...
  >

</application>
...
```
