-- Memisahkan 4 angka pertama sebagai tahun, 2 angka di mulai dari karakter 5 sebagai bulan dan menghitung Patent_Title yang mengandung kata 'data mining' dimana tahun diantara 2012 s/d 2023
-- Count dikelompokan berdasarkan tahun dan bulan dan disortir berdasarkan tahun terbaru dan bulan paling awal

SELECT 
	year, 
	month, 
	COUNT(*) AS total_patent
FROM (
	SELECT 
		CAST(LEFT(Grant_or_Publication_Date, 4) AS INT) AS year,
		CAST(SUBSTRING(Grant_or_Publication_Date, 5, 2) AS INT) AS month
	FROM patents-public-data.uspto_oce_cancer.publications
	WHERE LOWER(Patent_Title) LIKE '%data mining%') AS patent
WHERE year BETWEEN 2012 AND 2023
GROUP BY year, month
ORDER BY year DESC, month ASC;