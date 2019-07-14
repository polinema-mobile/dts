## ViewModel

ViewModel berperan dalam menyediakan data ke UI dan tidak terpengaruh dengan perubahan konfigurasi. ViewModel bertindak sebagai pusat komunikasi antara Repository dengan UI. ModelView juga dapat digunakan untuk berbagi data antar fragment. 
Implementasi ViewModel


## PRAKTIKUM
1. Membuat ViewModel pada class LogCaloriesViewModel seperti pada code dibawah ini
    - View model ini menggunakan class
    ```java
    public class LogCaloriesViewModel extends AndroidViewModel {
        private CaloriesRepository mCaloriesRepository;
        private LiveData<List<LogCaloriesEntity>> listLogCalories;

        public LogCaloriesViewModel(@NonNull Application application) {
            super(application);
            mCaloriesRepository = new CaloriesRepository(application);
        }

        public LiveData<List<LogCaloriesEntity>> GetListLogCalories(String date) {
            return listLogCalories = mCaloriesRepository.GetAllCaloriesByDate(date);
        }
        public void InsertLogCalories(LogCaloriesEntity mLogCaloriesEntity) {
            mCaloriesRepository.InsertCalories(mLogCaloriesEntity);
        }
    }
    ```
2. Setelah Membuat ViewModel coba gunakan view model untuk mengisert data pada AddDataCaloryFragment
    - Instansiasi variabel logCaloriesViewModel
    ```java
    private LogCaloriesViewModel logCaloriesViewModel;
    ```
    - Inisialisasi variabel logCaloriesViewModel
    ```java
    logCaloriesViewModel = ViewModelProviders.of(getActivity()).get(LogCaloriesViewModel.class);
    ```
    - Gunakan ViewModel yang telah dibuat untuk mengisert data
    ```java
    if (Validation(makanan, kaloriMakanan)) {
        LogCaloriesEntity logCaloriesEntity = new LogCaloriesEntity(waktuMakan, makanan, kaloriMakanan, tanggal);
        //Code yang ditambahkan
        logCaloriesViewModel.InsertLogCalories(logCaloriesEntity);

        DialogSave(mView, "Tersimpan!!", "Data Berhasil Disimpan. Apakah Anda Akan Memasukkan Data Lagi?");
    }
    ```

