# Membuat Model

## Praktikum
- Untuk membuat model yang diinginkan, silahkan buka url REST API anda (dalam
 langkah ini digunakan url [REST Calories](http://my-json-server.typicode.com/polinema-mobile/dts-fit/calories)). Maka akan didapatkan balasan sebagai berikut:

  ```json
  [
    {
      "id": 1,
      "food": "Rawon",
      "calory": 100
    },
    {
      "id": 2,
      "food": "Gado-gado",
      "calory": 100
    },
    {
      "id": 3,
      "food": "Indomie",
      "calory": 100
    }
  ]
  ```

- Dari balasan yang didapatkan anda dapat membuat model yang dibutuhkan retrofit
    dengan menggunakan bantuan dari [jsonschema2pojo](http://www.jsonschema2pojo.org/)

- Sesuaikan input data yang dibutuhkan, package `id.ac.polinema.dtsfit.models`
    dan dengan nama class `Calory`. Sehingga didapatkan hasil sebagai berikut.

```java
public class Calory {

    @SerializedName("id")
    @Expose
    private Integer id;
    @SerializedName("food")
    @Expose
    private String food;
    @SerializedName("calory")
    @Expose
    private Integer calory;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public Integer getCalory() {
        return calory;
    }

    public void setCalory(Integer calory) {
        this.calory = calory;
    }
}
```

- Implementasikan interface `Parcelable` sehingga definisi class menjadi seperti
    berikut:

    ```java
    public class Calory implements Parcelable {
    }
    ```
- Dengan menggunakan bantuan dari Android Studio, generate implementasi dari
    `Parcelable`.

    > **Catatan**: Model Retrofit tidak wajib mengimplementasikan `Parcelable`.
    > Tetapi dikarenakan dibutuhkan passing data antar Fragment, sehingga pada
    > praktikum ini ditambahkan langkah tersebut.
