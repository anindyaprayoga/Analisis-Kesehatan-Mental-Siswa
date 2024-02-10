-- Menampilkan seluruh data
SELECT *
FROM StudentMentalHealthAnalysis.dbo.['Student Mental health$']

-- Menghapus kolom "Timestamp"
ALTER TABLE StudentMentalHealthAnalysis.dbo.['Student Mental health$']
DROP COLUMN Timestamp

-- Menghitung jumlah siswa berdasarkan gender atau jenis kelamin
SELECT gender, COUNT(*) AS total_students
From StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY gender

-- Menghitung jumlah siswa yang mengalami "depression", "anxiety", dan "panic_attack"
SELECT 
	SUM(CASE WHEN depression = 'Yes' THEN 1 ELSE 0 END) AS StudentWithDepression,
	SUM(CASE WHEN anxiety = 'Yes' THEN 1 ELSE 0 END) AS StudentWithDepression,
	SUM(CASE WHEN panic_attack = 'Yes' THEN 1 ELSE 0 END) AS StudentWithDepression
FROM StudentMentalHealthAnalysis..['Student Mental health$']

-- Menghitung rata-rata CGPA siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack)
SELECT 
	AVG(CASE WHEN depression = 'Yes' THEN CGPA ELSE NULL END) AS average_cgpa_depression,
	AVG(CASE WHEN anxiety = 'Yes' THEN CGPA ELSE NULL END) AS average_cgpa_anxiety,
	AVG(CASE WHEN panic_attack = 'Yes' THEN CGPA ELSE NULL END) AS average_cgpa_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']

-- Menampilkan data jumlah siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack) berdasarkan course
SELECT course,
	COUNT(*) AS total_student,
	SUM(CASE WHEN depression = 'Yes' THEN 1 ELSE 0 END) AS student_with_depression,
	SUM(CASE WHEN anxiety = 'Yes' THEN 1 ELSE 0 END) AS student_with_anxiety,
	SUM(CASE WHEN panic_attack = 'Yes' THEN 1 ELSE 0 END) AS student_with_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY course

-- Menampilkan data jumlah siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack) berdasarkan tahun studi
SELECT year_of_study,
	COUNT(*) AS total_student,
	SUM(CASE WHEN depression = 'Yes' THEN 1 ELSE 0 END) AS student_with_depression,
	SUM(CASE WHEN anxiety = 'Yes' THEN 1 ELSE 0 END) AS student_with_anxiety,
	SUM(CASE WHEN panic_attack = 'Yes' THEN 1 ELSE 0 END) AS student_with_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY year_of_study

-- Menampilkan data jumlah siswa yang mengalami depresi (depression), kecemasan (anxiety), dan serangan panik (panic_attack) berdasarkan status pernikahan
SELECT marital_status,
	COUNT(*) AS total_student,
	SUM(CASE WHEN depression = 'Yes' THEN 1 ELSE 0 END) AS student_with_depression,
	SUM(CASE WHEN anxiety = 'Yes' THEN 1 ELSE 0 END) AS student_with_anxiety,
	SUM(CASE WHEN panic_attack = 'Yes' THEN 1 ELSE 0 END) AS student_with_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY marital_status

-- Membagi siswa berdasarkan tahun dan mencari rata-rata CGPA siswa yang mengalami gangguan mental
SELECT year_of_study,
	COUNT(*) AS total_student,
	AVG(CASE WHEN depression = 'Yes' THEN CGPA ELSE NULL END) AS student_cgpa_with_depression,
	AVG(CASE WHEN anxiety = 'Yes' THEN CGPA ELSE NULL END) AS student_cgpa_with_anxiety,
	AVG(CASE WHEN panic_attack = 'Yes' THEN CGPA ELSE NULL END) AS student_cgpa_with_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY year_of_study

-- Mencari kemungkinan apakah siswa yang mengalami depresi juga mengalami kecemasan ata panic attack
SELECT 
	depression,
	AVG(CASE WHEN anxiety = 'Yes' THEN 1.0 ELSE 0 END) AS average_anxiety,
	AVG(CASE WHEN panic_attack = 'Yes' THEN 1.0 ELSE 0 END) AS average_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY depression

-- Mencari dampak siswa yang pernah mencari pengobatan terhadap CGPA siswa tersebut
SELECT 
	seek_treatment,
	AVG(CGPA) AS average_CGPA
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY seek_treatment

-- Mencari persentase gangguan mental berdasarkan course dan tahun studi
SELECT course, year_of_study,
	AVG(CASE WHEN depression = 'Yes' THEN 1.0 ELSE 0 END) AS average_depression,
	AVG(CASE WHEN anxiety = 'Yes' THEN 1.0 ELSE 0 END) AS average_anxiety,
	AVG(CASE WHEN panic_attack = 'Yes' THEN 1.0 ELSE 0 END) AS average_panic_attack
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY course, year_of_study

-- Mencari perbedaan distribusi CGPA siswa yang mengalami gangguan kesehatan mental
SELECT depression, anxiety, panic_attack,
	AVG(CGPA) AS average_CGPA,
	MIN(CGPA) AS minimum_CGPA,
	MAX(CGPA) AS maximum_CGPA
FROM StudentMentalHealthAnalysis..['Student Mental health$']
GROUP BY depression, anxiety, panic_attack