## RecyclerView

RecyclerView digunakan untuk menampilkan list makanan yang telah diinput. Untuk membuat RecyclerView diperlukan 3 hal yaitu:
1. Model = berguna untuk memodelkan data yang akan ditangani
2. Adapter = berguna untuk menangani data untuk ditampilkan
3. Layout Manager = berguna untuk mengatur tata letak/layout item
    - ada 3 macam layout manager:
        - LinearLayoutManager
        - GridLayoutManager
        - StaggeredGridLayoutManager


Hal ini dapat diilustrasikan pada gambar berikut:
![RecyclerView](images/RecyclerView.png)

## Praktikum
1. __Model__ : pada praktikum ini model telah dibuat sama dengan Entity yaitu LogCaloriesEntity
2. __Adapter__ : adapater juga telah disediakan dengan nama LogCaloriesAdapter, akan tetapi ada bagian yang             kurang yaitu pada method onBindViewHolder. Lengkapi code, seperti pada contoh:
    ```java
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        LogCaloriesEntity logCaloriesEntity= mLogCaloriesEntities.get(position);
        holder.tvWaktuMakan.setText(logCaloriesEntity.getWaktuMakan());
        holder.tvFoodName.setText(logCaloriesEntity.getMakanan());
        holder.tvCalory.setText(logCaloriesEntity.getKaloriMakanan());
    }
    ```
3. __Layout Manager__ : pada project ini menggunakan Linear Layout Manager
    ```java
        mRecyclerCalories.setLayoutManager(new LinearLayoutManager(getActivity()));
    ```
4. Setelah tidak ada error pada langkah selanjutnya adalah menggunakan ViewModel yang telah dibuat untuk mengeset adapter RecyclerView, seperti pada code berikut:

    ```java
    logCaloriesViewModel = ViewModelProviders.of(getActivity()).get(LogCaloriesViewModel.class);
        logCaloriesViewModel.GetListLogCalories(date).observe(getActivity(), new Observer<List<LogCaloriesEntity>>() {
            @Override
            public void onChanged(List<LogCaloriesEntity> logCaloriesEntities) {
                adapterLogCalories.SetListLogCalories(logCaloriesEntities);
            }
        });
    ```
