-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun

SELECT DISTINCT urun_isim FROM musteri_urun;

-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
--GROUP BY COZUMU
select urun_isim from musteri_urun
group by urun_isim

--DISTINCT COZUMU

select distinct(urun_isim) from musteri_urun

-- Tabloda kac farkli meyve vardir ?
select urun_isim, count(distinct urun_isim) from musteri_urun group by urun_isim

--FETCH NEXT (SAYI) ROW ONLY-OFFSET  limit

-- musteri urun tablosundan ilk uc kaydi listeleyiniz..
--limit
select * from musteri_urun order by  urun_id limit 3;

select * from musteri_urun order by  urun_id fetch next 3 row only;

--musteri urun tablosundan son uc kaydi listewleyiniz..

select * from musteri_urun order by  urun_id desc limit 3;


CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);

select * from maas order by maas desc limit 1 offset 1;
/*
satir atlamak istedigimizde OFFSET komutunu kullaniriz
*/ 
select * from maas order by  maas desc offset 1 row fetch next 1 row only;

-- Maas tablosundan en dusuk 4. maasi listeleyiniz

select * from maas order by maas offset 3 limit 1

CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1) ADD default deger ile tabloya bir field ekleme

Alter TABLE PERSONEL
ADD ulke varchar(30)

Alter TABLE PERSONEL
ADD adres varchar(50) default 'Turkiye'

ALTER TABLE personel
ADD zipcode varchar(30)
ALTER TABLE personel
ADD adres varchar(50) DEFAULT 'Turkiye' -- DEFAULT yazarsak olusturdugumuz sutuna belirttigimiz veriyi tum satirlara girer

--2) DROP tablodan sutun silme

ALTER TABLE PERSONEL
DROP COLUMN ZIPCODE 

-- 3) RENAME COLUMN sutun adi degistirme
ALTER TABLE PERSONEL RENAME COLUMN SEHIR TO IL

--4) RENAME tablonun isminidegistirme
ALTER TABLE personel RENAME TO isciler;

--5)TYPE/SET (MODIFY) sutunlarin ozelliklerini degistirme
ALTER TABLE isciler
ALTER COLUMN IL TYPE varchar(30),
ALTER COLUMN IL SET NOT NULL;

--EGER NUMERIK DATA TURUNE SAHIP BIR SUTUNUN DATA TURUNE STRING BIR DATA TURU ATAMAK ISTERSEK 
--  TYPE VARCHAR(30) USING(MAAS::VARCHAR(30))  FORMATINI KULLANIRIZZ
 
ALTER COLUMN MAAS
TYPE VARCHAR(30) USING(MAAS::VARCHAR(30))

/*
			TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT
	Transaction veritabani sistemlerinde bir islem basladiginda baslar ve bitince sona erer. Bu
	islemler veritabani olusturma, veri silme, veri guncelleme, veriyi geri getirme gibi islemler olabilir.
 */
 
 -- TRANSACTION 
 /*
	-->	TRANSACTION (BEGIN - SAVEPOINT - ROLLBACK - COMMIT)
	Transaction baslatmak icin BEGIN komutu kullanmamiz gerekir ve Transaction'i sonlandirmak icin
	COMMIT komutunu calistirmaliyiz.
*/
CREATE TABLE ogrenciler2
(
id serial,-- Serial data turu otomatik olarak birden baslayarak sirali olarak sayi atamasi yapar
		   -- INSERT INTO ile tabloya veri eklerken serial data turunu kullandigim veri degeri yerine DEFAULT yazariz
	
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

select * from ogrenciler2







