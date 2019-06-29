## Activity Life Cycle
##Pengertian Activity

Activity adalah:
-	Kompenen yang menampilkan dan mengatur halaman aplikasi sebagai tempat interaksi antara pengguna dengan aplikasi Android.
-	Class MainActivity secara otomatis akan ter-generate ketika membuat suatu project, dimana Class tersebut merupakan extends dari Class Activity.
-	Terdapat dua method yang pasti dimiliki oleh satu activity, yaitu:
    1. onCreate(). Untuk menginisiasi/membuat suatu activity
    2.	onPause(). Untuk menyatakan ketika user meninggalkan suau activity.
-	Untuk menghubungkan Activity dengan tampilan yang telah dibentuk pada xml, digunakan fungsi setContentView().
-	Untuk memanggil widget pada activity digunakan fungsi findViewById().

##Activity Life Cycle (Daur Hidup Life Cycle)
-	Activity aplikasi android dikelola dengan sistem “activity stack” (antrian bertumpuk).
-	Ketika suatu activity dinyatakan “start” maka activity tersebut terletak diatas dari activity-activity yang telah berjalan pada “activity stack”. Keadaan tersebut bertahan hingga muncul suatu activity baru.
-	4 keadaan yang dimiliki activity, yaitu:
    1.	Active/running: Jika activity tersebut berada pada posisi atas “stack activity”.
    2. Pause: Jika activity tersebut tidak dipakai atau akan dibutuhkan pada suatu saat tertentu namun, activity itu masih ada atau visible. Activity yang berada pada keadaan “pause” masih tersimpan pada memory. Namun jika memori telah penuh bias saja activity tersebut terhapus. 
    3. Stopped: Jika activity sudah tidak dipakai dan digantikan oleh activity lain. Activity yang telah “stopped” tidak akan dipanggil lagi, dan memori akan menghapus segala informasi mengenai activity tersebut. 
    4. Restart: Jika activity “paused” atau “stopped”, sistem dapat menghapus activity ini dari memory, dan ketika activity ini dibutuhkan dan dipanggil kembali maka, activity akan kembali ke keadaan awal (restart).


