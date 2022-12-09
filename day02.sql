CREATE TABLE ogrenciler5
(
ogrenci_no char(7),-- Uzunluğunu bildiğimiz stringler için CHAR kullanılır
isim varchar(20), -- Uzunluğunu bilmediğimiz stringler için VARCHAR kullanırız
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date);
-- VAROLAN BİR TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;
select * from notlar;
--INSERT- TABLO İÇİNE VERİ EKLEME
INSERT INTO notlar VALUES ('Osman',95.5);
INSERT INTO notlar VALUES ('Sumeyye',95.5);
INSERT INTO notlar VALUES ('Salih',95.5);
INSERT INTO notlar VALUES ('Hakan',95.5);
INSERT INTO notlar VALUES ('Adem',95.5);
select * from notlar;
select isim from notlar;
-- CONSTRAINT
--UNIQEU
--NOT NULL
CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null,
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler7;

INSERT INTO ogrenciler7 VALUES ('1234567','Baran','Doganbas',75.5,now())
INSERT INTO ogrenciler7 VALUES ('1234568','Ali','Veli',75.5,now())
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES ('1234569','Evren',85.5);-- NOT NULL kisitlamasi oldugu icin bu veri eklenemez

-- PRIMARY KEY

CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

-- PRIMARY KEY atamasi 2.Yol

CREATE TABLE ogrenciler9
(
ogrenci_no char(7), 
isim varchar(20), 
soyisim varchar(25), 
not_ort real,
kayit_tarih date,
CONSTRAINT ogr primary key(ogrenci_no)
);

CREATE TABLE ogrenciler10
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no)
);


CREATE TABLE tedarikciler3
(
	tedarikci_id char(5) PRIMARY KEY,
	tedarikci_ismi varchar(20),
	iletisim_isim varchar(20)
);

CREATE TABLE urunler(
tedarikci_id char(5),
	urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3 (tedarikci_id)
	);
	
	select * from tedarikciler3;
	select* from urunler;
	
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- unıq constraınts oldugundan kabul etmedı
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- not null constraınt oldugu ıcın kabul etmedı
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');-- not null constraınt oldugu ıcın kabul etmedı
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- primary keyler unıque olmak zorunda o yuzden kabul etmıyor
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); --  prımary key ...

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep'); --parent de boyle bır ıd yok
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from adresler;
select * from calisanlar;

CREATE TABLE calisanlar2
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000) NOT NULL,
ise_baslama date
);
INSERT INTO calisanlar2 VALUES('10002', 'Mehmet Yılmaz',19000, '2018-04-14');

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;
--- calısanlar tablosaundan maası 5 bınden buyuk olan ısımleri lıstele

SELECT isim FROM calisanlar WHERE maas>5000;

-- calısanlar tablosundan ısmı Veli Han olan verıyı  getır

Select * from calisanlar where isim='Veli Han'

-- calısanalardan maasım 5 bın olan tum verılerı
Select * from calisanlar where maas=5000

sEleCT *FroM calisanLAR WherE maaS= 2000


-- DML DATA MANIPULATION LANGUAGE (TABLONUN ICI OLDUGU ICIN MANUP)

DELETE FROM calisanlar; -- eger parent table baska bır chıld tablo ile baglantılı ıse once chıld table sılınır

delete from adresler;

select * from adresler;
 -- ADRESLER TABLOSUNDA SEHRI ANTEP OLAN SEHIRLERI SILELIM

 DELETE FROM adresler where sehir = 'antep';
 
CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.

DELETE FROM ogrenciler6 where isim = 'Nesibe Yilmaz' or  isim = 'Mustafa Bak';

 

