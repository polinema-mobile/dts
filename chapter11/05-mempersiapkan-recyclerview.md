# RecyclerView

- Pada Praktikum ini dibutuhkan `RecyclerView` untuk menampilkan list data
 `Calory` yand diperoleh.

- Pada starter project sudah disiapkan, tinggal diperlukan langkah untuk
 menyambungkan data dengan `ViewHolder`

- Tambahkan kode berikut pada file `CaloriesAdapter`

  ```java
  holder.foodText.setText(calory.getFood());
  holder.caloryText.setText(String.valueOf(calory.getCalory()));
  ```
