# Location Based Service

*Location Based Service* (LBS) atau layanan berbasis lokasi merupakan layanan informasi yang dapat diakses oleh perangkat bergerak dan dapat menampilkan posisi geografis keberadaan perangkat bergerak tersebut. LBS dapat berfungsi sebagai layanan untuk mengidentifikasi lokasi dari seseorang atau suatu objek, misal sekolah atau tempat perbelanjaan. Layanan ini menggunakan teknologi global positioning service (GPS) dan cell-based location dari Google.

## Google Maps API

Google Maps adalah salah satu produk berbasis geospatial yang dikembangkan Google. Sedangkan Google Maps API merupakan sekumpulan komponen untuk melakukan berbagai fungsi  terkait aplikasi pemetaan.

### Jenis Maps

| Tipe Map | Kode                                     | Keterangan                                                    |
|----------|------------------------------------------|---------------------------------------------------------------|
| Normal   | setMapType(GoogleMap.MAP_TYPE_NORMAL)    | Menampilkan jalan beserta label namanya.                      |
| None     | setMapType(GoogleMap.MAP_TYPE_NONE)      | Peta tidak terlihat                                           |
| Hybrid   | setMapType(GoogleMap.MAP_TYPE_HYBRID)    | Tipe satelit yang ditambahkan tampilan label jalan            |
| Terrain  | setMapType(GoogleMap.MAP_TYPE_TERRAIN)   | Menampilkan data topografi daerah                             |
| Satelit  | setMapType(GoogleMap.MAP_TYPE_SATELLITE) | Menampilkan gambar satelit saja tanpa label jalan dan lainnya |
