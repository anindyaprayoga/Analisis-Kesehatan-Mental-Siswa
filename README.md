# Analisis Kesehatan Mental Mahasiswa

## Deskripsi Proyek
Proyek ini bertujuan untuk menganalisis data kesehatan mental mahasiswa menggunakan SQL Server. Data yang digunakan dalam proyek ini mencakup informasi demografis mahasiswa, CGPA, dan kondisi kesehatan mental mereka.

## Dataset
Dataset didapatkan dari kaggle pada link berikut : https://www.kaggle.com/datasets/shariful07/student-mental-health
Setelah mendapatkan dataset kemudian dilakukan cleaning data pada excel sehingga didapat dataset yang mencakup kolom berikut:

- gender
- age
- course
- year_of_study
- CGPA
- marital_status
- depression
- anxiety
- panic_attack
- seek_treatment

## Metodologi
Proyek ini menggunakan SQL Server untuk melakukan analisis data. Beberapa analisis yang dilakukan termasuk:

- Menghitung jumlah siswa berdasarkan gender
- Menghitung jumlah siswa yang mengalami depresi, kecemasan, dan serangan panik
- Menghitung rata-rata CGPA siswa yang mengalami depresi, kecemasan, dan serangan panik
- Menampilkan data jumlah siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack) berdasarkan course
- Menampilkan data jumlah siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack) berdasarkan tahun studi
- Menampilkan data jumlah siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack) berdasarkan status pernikahan
- Membagi siswa berdasarkan tahun dan mencari rata-rata CGPA siswa yang mengalami gangguan mental
- Mencari kemungkinan apakah siswa yang mengalami depresi juga mengalami kecemasan ata panic attack
- Mencari dampak siswa yang pernah mencari pengobatan terhadap CGPA siswa tersebut
- Mencari persentase gangguan mental berdasarkan course dan tahun studi
- Mencari perbedaan distribusi CGPA siswa yang mengalami gangguan kesehatan mental
