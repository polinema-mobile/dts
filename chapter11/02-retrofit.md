# Retrofit

Retrofit adalah library HTTP Client yang diperuntukkan untuk Android dan Java.
Retrofit mengubah HTTP API ke dalam bentuk Java interface.

```java
public interface GitHubService {
  @GET("users/{user}/repos")
  Call<List<Repo>> listRepos(@Path("user") String user);
}
```

Retrofit dapat mengubah balasan dari HTTP API dengan menggunakan Converters.
Beberapa Converters yang didukung oleh Retrofit antara lain:

- Gson: com.squareup.retrofit2:converter-gson
- Jackson: com.squareup.retrofit2:converter-jackson
- Moshi: com.squareup.retrofit2:converter-moshi
- Protobuf: com.squareup.retrofit2:converter-protobuf
- Wire: com.squareup.retrofit2:converter-wire
- Simple XML: com.squareup.retrofit2:converter-simplexml
- Scalars (primitives, boxed, and String): com.squareup.retrofit2:converter-scalars

Untuk menggunakan library ini, anda cukup menambahkan depdendency tambahan pada
file `build.gradle`. Sintaks yang dibutuhkan sebagai berikut:

```gradle
implementation 'com.squareup.retrofit2:retrofit:(insert latest version)'
```

## Praktikum

- Bukalah file `ServiceGenerator.java` yang telah disediakan pada starter project. Pahami struktur pada file tersebut.

> Catatan:
> Pada file `ServiceGenerator.java` digunakan untuk mempermudah pembuatan service
> pada Retrofit. Sebagai contoh, pada project terdapat 3 buah service, AService,
> BService, CService. Perhatikan kode berikut:

> ```java
> private AService aService;
> private BService bService;
> private CService cService;

> aService = ServiceGenerator.createService(AService.class);
> bService = ServiceGenerator.createService(BService.class);
> cService = ServiceGenerator.createService(CService.class);
> ```
