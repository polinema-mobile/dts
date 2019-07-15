# Mendefinisikan Service

- Pada retrofit, dibutuhkan definisi service yang akan digunakan. Definisi ini
 disimpan dalam bentuk `interface`. Bukalah file `CaloryService.java`

- Pada langkah praktikum sebelumnya, diketahui bahwa untuk mengakses data calory
    melalui url
    http://my-json-server.typicode.com/polinema-mobile/dts-fit/calories sehingga
    jika diubah ke dalam interface retrofit menjadi

  ```java
  @GET("/polinema-mobile/dts-fit/calories")
  Call<List<Calory>> getCalories();
  ```

  > **Catatan**: Base url tidak perlu dituliskan dikarenakan sudah didefinisikan
  > dalam ServiceGenerator.

- Lanjutkan untuk service `addCalory()`. Pada service ini, menggunakan HTTP
    method yang berbeda, yaitu POST. Sehingga kode yang dibutuhkan:

  ```java
  @POST("/polinema-mobile/dts-fit/calories")
  Call<Calory> addCalory(@Body Calory calory);
  ```

- Sedangkan untuk `editCalory()` menggunakan HTTP PUT, sehingga kode yang
    dibutuhkan adalah:

  ```java
  @PUT("/polinema-mobile/dts-fit/calories/{id}")
  Call<Calory> editCalory(@Path("id") int id, @Body Calory calory);
  ```

  > **Catatan**: username dan nama repository silahkan disesuaikan.
