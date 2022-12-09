CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);


INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');


DROP TABLE IF exists musteriler

select * from musteriler;
--musteriler tablosundan urun ismi orange apple ve apricot olan dataları listeleyiniz
--Musteriler tablosundan urun ismi orange, apple veya apricot olan tum verileri listeleyiniz..
select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';
select * from musteriler where urun_isim='Orange' and urun_id=10
--IN CONDITION
select * from musteriler where urun_isim in ('Orange','Apple','Apricot');
--NOT IN--> YAZDIGIMIZ VERILERIN DISINDAKILERI GETIRIR
select * from musteriler where urun_isim NOT in ('Orange','Apple','Apricot');
--BETWEEN CONDITION -- IKI MANTIKSAL IFADE ILE TANIUMLAYABILECEGIMIZ DURUMLARI TEK KOMUTLA
--YAZABILME IMKANI VERIR YAZDIGIMIZ IKI SINIR DA ARALIGA DAHILDIR

-- musteriler tablosundan id si 20 ile 40 arasında olan verileri listeleyiniz

select * from musteriler where urun_id>=20 and urun_id<=40;

select * from musteriler where urun_id between 20 and 40;


CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

select * from calisanlar2;

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

select * from markalar;

SELECT isim, maas, isyeri FROM 	calisanlar2 
WHERE isyeri In (SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz


SELECT isim, maas, sehir FROM 	calisanlar2 
WHERE isyeri In (SELECT marka_isim FROM markalar WHERE marka_id>101);


---ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.


-- -- AGGREGATE METHOD
--Calisanlar tablosunda maksimum maası listeleyiniz
SELECT max(maas) AS maksimum_maas FROM calisanlar2;
/*
	Eğer bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek
istediğimiz ismi yazarız
*/
--Calisanlar tablosunda minimum maası listeleyiniz
SELECT min(maas) AS minimum_maas FROM calisanlar2;
--Calisanlar tablosundaki maasların toplamını listeleyiniz
SELECT sum(maas) AS maas_toplamı FROM calisanlar2;
--Calisanlar tablosundaki maasların ortalamasını listeleyiniz
SELECT avg(maas) AS maas_ortalaması FROM calisanlar2;
SELECT round(avg(maas),2) AS maas_ortalaması FROM calisanlar2;
--Calisanlar tablosundaki maasların sayısı
SELECT count(maas) AS maas_sayısı FROM calisanlar2;
SELECT count(*) AS maas_sayısı FROM calisanlar2;
/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

SELECT marka_id,marka_isim,
(SELECT count(sehir) as sehir_sayisi FROM calisanlar2 WHERE marka_isim=isyeri)
FROM markalar;


SELECT marka_isim,calisan_sayisi,
(SELECT sum(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as toplam_maas
FROM markalar;


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.


select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim),
(select min(maas) from calisanlar2 where isyeri=marka_isim)
from markalaR

--vıew kullanımı

CREATE 	VIEW maxminmaas 
as 
select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim),
(select min(maas) from calisanlar2 where isyeri=marka_isim)
from markalaR

select * from maxminmaas


--VIEW KULLANIMI
/*
Yaptigimiz sorgulari hafizaya alir ve tekrar bizden istenen sorgulama yerine
view'e atadigimiz ismi SELECT komutuyla cagiririz
*/

--EXISTS CONDITION--
--EXISTS CONDITION SUBQUERY'LER ILE KULLANILIR.
/*
 IN ifadesinin kullanımına benzer
olarak, EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde
bir değerin olması veya olmaması durumunda işlem yapılmasını sağlar*/
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');
CREATE TABLE nisan
(
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
SELECT * FROM mart
SELECT * FROM nisan
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
-- URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
-- MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
select urun_id,musteri_isim from mart
where exists(select urun_id from nisan where mart.urun_id=nisan.urun_id)
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve
--bu ürünleri NİSAN ayında s

--Satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists(select urun_isim from mart where nisan.urun_isim=mart.urun_isim


CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');


CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz')



select * from tedarikciler
select * from urunler
						   
UPDATE tedarikciler
set firma_ismi='Vestel' where vergi_no =102;
			 
UPDATE urunler
			 set urun_isim = 'Telefone' where urun_isim = 'Phone'
			 


-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urunler
SET urun_id = urun_id+1 WHERE urun_id>1004;

UPDATE urunler
SET  urun_id = urun_id + ted_vergino;




