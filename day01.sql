-- DATABASE 
Create dataBase evren;

create database erol;

--DDL  -DATA DEFINITION LANG.
-- CREATE -- TABLO OLUSTURMA
CREATE TABLE ogrenciler
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,  -- Ondalık sayılar ıcın kullanılır(double gıbı)
kayit_tarih date
);
-- VAROLAN TABLODAN YENI TABLO OLUSTURMAK
create table ogrenci_notlari
as -- Benzer tablodaki baslıklarla ve data tipleriyle yerni bir tablo olusutrmak ıcın normal tablo olustururken
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
select isim, soyisim,
not_ort from ogrenciler;

--DML -- DATA MANIPULATION LANGUAGE
-- INSERT 

INSERT INTO ogrenciler VALUES ('1234567', 'said', 'ILHAN',85.5, now() );

INSERT INTO ogrenciler VALUES ('1234567', 'said', 'ILHAN',85.5, '2022-12-01');

-- BIR TABLOYA PARCALI VERI EKLEME

INSERT INTO ogrenciler (isim, soyisim) values ('erol','evren');

--DQL DATA QUERY LANG
--SELECT

select * from ogrenciler; -- Buradaki * sembolu herseyi anlamındadır






