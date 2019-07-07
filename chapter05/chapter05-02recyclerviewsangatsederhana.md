# RecyclerView Sangat Sederhana

Pada Praktikum kali ini kita akan membuat sebuah recyclerview yang sangat sederhana dimana pada recyclerview ini hanya terdapat sebuah item text view.

## Hasil Yang Diharapkan

![hasil](images/0532hasil.jpeg)

## New Project

Buatlah sebuah project baru sesuaikan konfigurasi project ini dengan environtment SDK pada Android Studio anda, contoh konfigurasinya :

![newproject](images/0505rssnewproject.png)

## Dependency

Dependency yang digunakan pada project ini adalah dependency untuk recyclerview, namun karena ada perbedaan pada versi android sdk yang digunakan berikut ini disediakan beberapa konfigurasi `build.gradle` pada module `app` yang digunakan.

Untuk sdk 29 sudah menggunakan `androidx`

```gradle
implementation 'androidx.recyclerview:recyclerview:1.1.0'
```

Untuk sdk dibawah 29 menggunakan support library. Contoh untuk sdk 28 menggunakan versi recyclerview dibawah ini

```gradle
implementation 'com.android.support:recyclerview-v7:28.0.0'
```

Perhatikan target sdk version yang anda gunakan pada file `build.gradle` untuk module `app` dan isikan recyclerview yang sesuai dengan kebutuhan anda.

Contoh dependency :

```gradle

dependencies {
    implementation fileTree(dir: 'libs', include: ['*.jar'])
    implementation 'androidx.appcompat:appcompat:1.0.2'
    implementation 'androidx.constraintlayout:constraintlayout:1.1.3'
    implementation 'androidx.recyclerview:recyclerview:1.0.0'
    testImplementation 'junit:junit:4.12'
    androidTestImplementation 'androidx.test:runner:1.2.0'
    androidTestImplementation 'androidx.test.espresso:espresso-core:3.2.0'
}
```

## Model

Berdasarkan hasil yang diharapkan dapat dilihat bahwa pada recyclerview yang dihasilkan hanya memiliki satu data yaitu sebuah text oleh karena itu model di desain sesuai dengan kebutuhan pada hasil akhir. Lakukanlah langkah langkah berikut ini untuk membuat file model pada project ini.

### Buat Package Models

Agar file file yang ada pada project tersusun rapi buatlah sebuah package dengan nama `models` sebagai tempat untuk menyimpan file models.

![package](images/0506package.png)

Beri nama package `models`

![models](images/0507models.png)

### Buat Class Models

Buatlah sebuah file baru pada package models beri nama file tersebut `SuperHero` dan beri tipe `class`

![java](images/0508java.png)

![class](images/0509createclass.png)

### Isi Class Models

Isilah class SuperHero dengan sebuah attribut public bernama `heroName` dan lengkapi dengan construktor serta `setter dan getter`

```java
package polinema.ac.id.recyclerviewsangatsederhana.models;

public class SuperHero {
    public String heroName;

    public SuperHero(String heroName) {
        this.heroName = heroName;
    }

    public String getHeroName() {
        return heroName;
    }

    public void setHeroName(String heroName) {
        this.heroName = heroName;
    }
}
```

## Item Layout

Layout pada recyclerview ini berupa sebuah layout xml sederhana silahkan anda memilih layout mana saja asalkan dapat menampilkan sebuah textview. Berikut ini contoh langkah langkah untuk membuat item layout.

![laoyot](images/0510itemlayout.png)

![layout](images/0511itemxml.png)

Contoh kode program `item_super_hero.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="vertical" android:layout_width="match_parent"
    android:layout_height="50dp">
    <TextView
        android:gravity="center"
        android:id="@+id/heroName"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Hero Name"
        android:textSize="20sp"
        />
</LinearLayout>
```

## Recycler Layout

Bukalah file `activity_main.xml` kemudian hapus `textview` `hello world` nya

![0512actymain](images/0512actymain.png)

Kemudian isikan sebuah recyclerview dan setting constraint nya untuk memenuhi seluruh layar

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">


    <androidx.recyclerview.widget.RecyclerView
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintBottom_toBottomOf="parent"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        tools:layout_editor_absoluteX="8dp"
        tools:layout_editor_absoluteY="8dp" />

</androidx.constraintlayout.widget.ConstraintLayout>
```

![rvmain](images/0513rvmain.png)

## Adapter

Adapter adalah bagian terpenting dari sebuah `recyclerview` oleh karena itu perhatikanlah langkah langkah pembuatan `Adapter` berikut ini dengan seksama.

### Buat Package Adapter

Buatlah package `adapters` pada project dengan langkah berikut ini :
![0514](images/0514package.png)
![0515](images/0515adapters.png)
![0516package](images/0516package.png)

### Buat Class Adapter

Buatlah sebuah class pada package `adapters` berilah nama SuperHeroAdapter
![0517superheroadapter](images/0517superheroadapter.png)

Kode program hasil pembuatan class `SuperHeroAdapter`

```java
package polinema.ac.id.recyclerviewsangatsederhana.adapters;

public class SuperHeroAdapter {
}

```

### Extends

Sebuah adapter harus melakukan extend ke class RecyclerView.Adapter<VH>, perhatikan gambar dibawah ini untuk melihat langkah pembuatan extend nya.
![0518](images/0518extend.png)
![0519](images/0519extend.png)
![0520](images/0520extend.png)

Pada langkah ini akan terjadi error yang akan kita perbaiki pada tahap selanjutnya

### Implement Methods

Pindahkan cursor pada awal class `RecyclerView` kemudian pilih `alt+insert` untuk windows atau `alt + enter` untuk mac os kemudian pilih `Implements Methods`.

![0521](images/0521implementmethods.png)
![0522](images/0522pilihimplements.png)

Pilih semua method dan hasilnya ada seperti berikut ini :

```java
package polinema.ac.id.recyclerviewsangatsederhana.adapters;


import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {
    @NonNull
    @Override
    public SuperHeroAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return null;
    }

    @Override
    public void onBindViewHolder(@NonNull SuperHeroAdapter.MyViewHolder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return 0;
    }
}

```

### Inner Class

Sampai pada saat ini class yang anda buat masih error, lanjutkan dengan memindahkan cursor ke `MyViewHolder` kemudian tekan kembali `alt+insert` atau `alt+enter` kemudian pilih `create class`

![0523](images/0523inner.png)

Hasil dari perintah diatas seperti gambar dibawah ini

![0524](images/0524intter.png)

Class nya masih error arahkan cursor ke `SuperHeroAdapter.MyViewHolder` kemudian pilih opsi `Make MyViewHolder extends ...`

![0525](images/0525make.png)

Berikut ini hasilnya, namun masih ada error untuk memperbaiki error lanjutkan ke langkah selanjutnya
![0526](images/0526haha.png)

Pindahkan kursor ke kode program yang masih merah kemudian tekan kembali `alt+enter` atau `alt+insert` kemudian pilih opsi `create constructor matching super`

![0527](images/0527alsjd.png)

### Variabel Data

Berikan variabel untuk menampung data dari activity, karena adapter membutuhkan data data ini diambil dari activity oleh karena itu buatlah sebuah variabel berupa list of `SuperHero` dengan nama `heroList`

![superhero](images/0528superhero.png)

Setelah itu buatkan constructor untuk class ini dengan menekan shortcut `alt + insert` pada windows atau `cmd+n` pada mac.

![superhero](images/0529construktor.png)

Pilih variabel `heroList`
![superhero](images/0530pilih.png)

Berikut ini hasil dari proses pembuatan Adapter (masih separoh jalan :) )

```java
package polinema.ac.id.recyclerviewsangatsederhana.adapters;


import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

import polinema.ac.id.recyclerviewsangatsederhana.models.SuperHero;

public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {
    List<SuperHero> heroList;

    public SuperHeroAdapter(List<SuperHero> heroList) {
        this.heroList = heroList;
    }

    @NonNull
    @Override
    public SuperHeroAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return null;
    }

    @Override
    public void onBindViewHolder(@NonNull SuperHeroAdapter.MyViewHolder holder, int position) {

    }

    @Override
    public int getItemCount() {
        return 0;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
        }
    }
}

```

Langkah selanjutnya adalah mengisi dan memahami fungsi dari masing masing function dan inner class yang ada pada adapter

### Urutan Mengisi Function Pada Adapter

#### Inner Class ViewHolder

Inner Class ini berfungsi sebagai pembuat view pada class ini dibuat variabel yang menghubungkan id pada layout item_super_hero dengan variabel yang dapat digunakan pada saat mengisi nilai dari dataset.

```java

public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {

    ...
    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView heroName;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            //variabel disesuaikan dengan layout, karena pada layout item_super_hero terdapat satu
            //TextView maka pada kode program ini dibuat satu TextView yang melakukan findViewById ke id layout yang bersesuaian
            heroName = itemView.findViewById(R.id.heroName);
        }
    }
}

```

#### Get Item Count

Function yang paling mudah untuk di isi pada adapter ini adalah function `getItemCount()` function ini berfungsi mengembalikan jumlah data yang ingin ditampilkan pada `RecyclerView`, Tambahkan `heroList.size()` pada function `getItemCount()`

```java
public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {
...
    @Override
    public int getItemCount()    {
        return heroList.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            //variabel disesuaikan dengan layout, karena pada layout item_super_hero terdapat satu
            //TextView maka pada kode program ini dibuat satu TextView yang melakukan findViewById ke id layout yang bersesuaian
            TextView heroName = itemView.findViewById(R.id.heroName);
        }
    }
}

```

#### OnCreateViewHolder

Function ini berfungsi seperti `onCreate` pada activity dimana pada function ini juga dilakukan pendefenisian layout mana yang digunakan pada saat recyclerview dibuat. Jadi item layout yang dibuat sebelumnya di koneksikan di fungsi ini.

```java
public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {
    List<SuperHero> heroList;

    public SuperHeroAdapter(List<SuperHero> heroList) {
        this.heroList = heroList;
    }

    @NonNull
    @Override
    public SuperHeroAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //object context diambil dari parent
        Context context = parent.getContext();
        //object context digunakan untuk membuat object layoutInflater
        LayoutInflater layoutInflater = LayoutInflater.from(context);
        //object layoutInflater digunakan untuk membuat object view yang merupakan hasil inflate  layout ( mengubungkan adapter degnan layout)
        View superHeroView = layoutInflater.inflate(R.layout.item_super_hero,parent,false);
        //object superHeroView digunakan untuk membuat object viewHolder
        MyViewHolder viewHolder = new MyViewHolder(superHeroView);
        return viewHolder;
    }
    ...
    ...

    @Override
    public int getItemCount()    {
        return heroList.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            TextView heroName = itemView.findViewById(R.id.heroName);
        }
    }
}

```

#### OnBindViewHolder

Pada fungsi ini kita menghubungkan data pada salah satu item di `listSuperHero` dengan item pada pada layout item_super_hero,kode program pada item_super_hero terdapat sebuah textView dengan id `heroName` pada fungsi inilah kita menghubungkan data dari item super hero ke layout.

```java
package polinema.ac.id.recyclerviewsangatsederhana.adapters;


import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import org.w3c.dom.Text;

import java.util.List;

import polinema.ac.id.recyclerviewsangatsederhana.R;
import polinema.ac.id.recyclerviewsangatsederhana.models.SuperHero;

public class SuperHeroAdapter extends RecyclerView.Adapter<SuperHeroAdapter.MyViewHolder> {
    List<SuperHero> heroList;

    public SuperHeroAdapter(List<SuperHero> heroList) {
        this.heroList = heroList;
    }

    @NonNull
    @Override
    public SuperHeroAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        Context context = parent.getContext();
        LayoutInflater layoutInflater = LayoutInflater.from(context);
        View superHeroView = layoutInflater.inflate(R.layout.item_super_hero,parent,false);
        MyViewHolder viewHolder = new MyViewHolder(superHeroView);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull SuperHeroAdapter.MyViewHolder holder, int position) {
        //ambil satu item hero
        SuperHero hero = heroList.get(position);
        //set text heroName berdasarkan data dari model hero
        holder.heroName.setText(hero.getHeroName());
    }

    @Override
    public int getItemCount()    {
        return heroList.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        public TextView heroName;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            heroName = itemView.findViewById(R.id.heroName);
        }
    }
}

```

## Instansiasi RecyclerView

Instansiasi RecyclerView dilakukan di MainActivity untuk melakukannya buatlah sebuah field pada Class MainActivity dengan tipe data RecyclerView berilah anama rvSuperHero.

```java

public class MainActivity extends AppCompatActivity {
    //instansiasi Recyclerview
    RecyclerView rvSuperHero;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}

```

Selanjutnya setelah `setContentView` panggil lakukan `findViewById` untuk menyambungkan `rvSuperHero` ke RecyclerView yang ada di layout.

```java

public class MainActivity extends AppCompatActivity {
    //instansiasi Recyclerview
    RecyclerView rvSuperHero;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //menyambungkan rvSuperHero ke layout
        rvSuperHero = findViewById(R.id.rvSuperHero);
    }
}

```

## Instansiasi Model

Langkah selanjutnya adalah membuat dataset, dataset dapat dibuat dengan membuat sebuah daftar super hero dengan membuat List of object `SuperHero` pada `MainActivity`

```java

public class MainActivity extends AppCompatActivity {
    //instansiasi Recyclerview
    RecyclerView rvSuperHero;
    //instansiasi list superhero
    List<SuperHero> listSuperHero = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //menyambungkan rvSuperHero ke layout
        rvSuperHero = findViewById(R.id.rvSuperHero);

    }
}

```

Setelah itu buatlah beberapa object `SuperHero` dan ditambahkan kedalam `List<SuperHero>`

```java

public class MainActivity extends AppCompatActivity {
    //instansiasi Recyclerview
    RecyclerView rvSuperHero;
    //instansiasi list superhero
    List<SuperHero> listSuperHero = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //menyambungkan rvSuperHero ke layout
        rvSuperHero = findViewById(R.id.rvSuperHero);
        //Membuat object hero
        SuperHero hero = new SuperHero("Petruk");
        //menambahkan hero ke listSuperHero
        listSuperHero.add(hero);
        //membuat object hero baru
        hero = new SuperHero("Gareng");
        //menambahkan hero baru ke listSuperhero
        listSuperHero.add(hero);
    }
}

```

## Instansiasi Adapter

Pada langkah ini semua data yang dibutuhkan untuk menginstansiasi adapter sudah dimiliki oleh karena itu adapter dapat di buat objeknya.

```java
public class MainActivity extends AppCompatActivity {
    //instansiasi Recyclerview
    RecyclerView rvSuperHero;
    //instansiasi list superhero
    List<SuperHero> listSuperHero = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //menyambungkan rvSuperHero ke layout
        rvSuperHero = findViewById(R.id.rvSuperHero);
        //Membuat object hero
        SuperHero hero = new SuperHero("Petruk");
        //menambahkan hero ke listSuperHero
        listSuperHero.add(hero);
        //membuat object hero baru
        hero = new SuperHero("Gareng");
        //menambahkan hero baru ke listSuperhero
        listSuperHero.add(hero);
        //Instansiasi Adapter
        SuperHeroAdapter superHeroAdapter = new SuperHeroAdapter(listSuperHero);
    }
}
```

## Set Adapter dan Layout Manager

Langkah terakhir dalam membuat recyclerview adalah dengan melakukan set adapter dan set layout manager pada object recyclerview

```java
public class MainActivity extends AppCompatActivity {
    //instansiasi Recyclerview
    RecyclerView rvSuperHero;
    //instansiasi list superhero
    List<SuperHero> listSuperHero = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //menyambungkan rvSuperHero ke layout
        rvSuperHero = findViewById(R.id.rvSuperHero);
        //Membuat object hero
        SuperHero hero = new SuperHero("Petruk");
        //menambahkan hero ke listSuperHero
        listSuperHero.add(hero);
        //membuat object hero baru
        hero = new SuperHero("Gareng");
        //menambahkan hero baru ke listSuperhero
        listSuperHero.add(hero);
        //Instansiasi Adapter
        SuperHeroAdapter superHeroAdapter = new SuperHeroAdapter(listSuperHero);
        //set adapter dan layoutmanager
        rvSuperHero.setAdapter(superHeroAdapter);
        rvSuperHero.setLayoutManager(new LinearLayoutManager(this));
    }
}
```
