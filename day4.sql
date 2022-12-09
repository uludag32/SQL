--ODEV
----Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
							   
SELECT marka_id,calisan_sayisi FROM markalar
WHERE marka_isim in (SELECT isyeri from calisanlar2 where sehir='Ankara');

select * from markalar
select * from calisanlar2

--ALIASES--

--alies kodu ile tablo yazdirirken , field isimleri  sadece o cikti icin degistirilebilir 
CREATE TABLE calisanlar 
(calisan_id char(9),
 calisan_isim varchar(50),
 calisan_dogdugu_sehir varchar(50) );

select * from calisanlar
INSERT INTO calisanlar VALUES(123456789,'Ali Can', 'Istanbul');
INSERT INTO calisanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT calisan_id AS id, calisan_isim AS isim, calisan_dogdugu_sehir AS dogum_yeri FROM calisanlar;

SELECT calisan_id AS id, calisan_isim || calisan_dogdugu_sehir AS isim_ve_dogum_yeri
FROM calisanlar;
--2.yol
SELECT calisan_id AS id, concat(calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar;

-- eger iki sutunun verileri birlestirmek istersek concat sembolu olan || kullaniriz
--IS NULL CONDITION---
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
	adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
 INSERT INTO insanlar (ssn, adres) VALUES(567890123,'Denizli');
select isim from insanlar where isim is null
select isim from insanlar where isim is not null --insanlar tablosundaki null olmayan degereleri verir

-- insanlar tablosunda null deger almis verileri no name olarak degistiriniz

update insanlar 
set isim='No Name'
where isim is null

select * from insanlar
-- 								ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir
*/
drop table if exists insanlar


CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
	adres varchar(50)
);

INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar

order by adres;      --ascending  ascend  X descend  de yazabiliriz
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

SELECT * FROM insanlar WHERE isim='Mine' ORDER BY ssn

--ORDER BY komutu sadece SELECT komutu Ile kullanilir
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (asc)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/
--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar where soyisim='Bulut' order by 4


 
---Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

SELECT * FROM insanlar ORDER BY ssn DESC


--Insanlar tablosundaki datalari adres’e gore siralayin 

SELECT*FROM insanlar
ORDER BY adres;

 -- Insanlar tablosundakı tum kayıtları ısımler Natural sıralı, soy ısmler ters sıralı olarak lısteleyın
 
 
 SELECT * FROM insanlar  ORDER BY isim ASC, soyisim DESC;
 
	----Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olaraksiralayin
SELECT*
FROM insanlar
ORDER BY ssn DESC;


SELECT isim, soyisim
FROM insanlar
ORDER BY LENGTH(soyisim)
 
	 -- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
		/*
		Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
		Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
		*/
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH (soyisim) DESC;

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim|| ' '|| soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim||soyisim)
SELECT isim|| ' '|| soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim||soyisim) desc

SELECT CONCAT (isim, ' ', soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim||soyisim)

select isim || ' ' || soyisim as isim_soyisim from insanlar order by length (concat(isim, soyisim));

---- GROUP BY CLAUSE

CREATE TABLE manav
(
isim varchar(50),
Urun_adi varchar(50),
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

SELECT* FROM MANAV

--- Isme gore alinan toplam urunleri bulun
SELECT SUM(urun_miktar) FROM manav
---->
SELECT isim, 
SUM(urun_miktar) AS Alinan_Toplam_Meyve FROM manav
GROUP BY isim;


--- Isme gore alinan toplam urunleri bulun ve bu urunlerı buyukten kucuge sıralayın

select isim, sum (urun_miktar) as aldigi_toplam_urun from manav 
group by isim
order by aldigi_toplam_urun desc

--Urun ismine gore urunu alan toplam kisisayisi

select urun_adi, count (isim)  
from manav
group by urun_adi









