# Praktikum-5

## Menjalankan Operasi DELETE
	
1.	Ada kalanya ketika user mendaftar pada suatu aplikasi, ia ingin menghapus akunnya. Untuk kasus semacam ini, kita harus menggunakan operasi DELETE yang berguna untuk menghapus data dari database.

	Berikutnya kita akan mengimplementasikan fitur ‘Delete Account’ dengan memanfaatkan operasi DELETE ini. Untuk melakukannya lebih mudah lagi dari langkah sebelumnya, modifikasilah action onTxvDeleteAccount_Click() sehingga isinya menjadi seperti berikut:
	```java
	public void onTxvDeleteAccount_Click(View view)
	{
	    // Memperbarui data di propertu currentUser
	    this.syncData();

	    // Mendapatkan class DAO dari DTSAppDatabase
	    UserDao daoUser = AppDbProvider.getInstance(this).userDao();

	    // Menggunakan DAO untuk menghapus data di database yang sama dengan data yang ada di property currentUser
	    daoUser.delete(this.currentUser);

	    Toast.makeText(this, "Your data has been deleted..", Toast.LENGTH_SHORT).show();

	    // Kembali ke halaman login
	    Intent intent = new Intent(getApplicationContext(), WelcomeBackActivity.class);
	    intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP); // Lompati halaman sebelumnya
	    startActivity(intent);
	}
	```

2.	Jalankan kembali aplikasi dan klik-lah teks ‘Delete Account’ dihalaman Profile, maka data akan terhapus dan halaman langsung dikembalikan ke tampilan login.

3.	__LATIHAN__: Sampai disini ketika Anda login di aplikasi, Anda masih menggunakan kredensial yang diset statik pada konstanta DUMMY_USERNAME & DUMMY_PASSWORD. Nah, sekarang buatlah agar sedemikian sehingga pengguna dapat masuk ke aplikasi dengan username dan password yang mereka isikan pada saat registrasi!

	__PETUNJUK__: Modifikasilah method validateCredential() yang ada pada file WelcomeBackActivity.java. Gunakan method __Yang tepat__ yang sudah disiapkan pada file UserDao.java.
	```java
	// QUIZ!!
	private boolean validateCredential()
	{
	    String currentUsername = this.edtUsername.getText().toString();
	    String currentPassword = this.edtPassword.getText().toString();

	    /*
	    return (Objects.equals(currentUsername, DUMMY_USERNAME)
	            && Objects.equals(currentPassword, DUMMY_PASSWORD));
	    */
    
	    // Teruskan sendiri....

	    return ???
	}
	```

