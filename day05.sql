CREATE TABLE personel
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select*from personel;

delete from personel;

-- Isme gore toplam maasları bulun

SELECT isim, sum (maas) from personel
group by isim;


select isim from personel group by isim ;

select* from personel
-- HAVING KULLANIMI
/*
Having komutu yalnızca group by komutu ile kullanılır,
Eger gruplamadan sonra bir sart var ise havıng komutu kullanılır
*/
select sirket,
min (maas) as en_dusuk_maas from personel 
group by sirket having min(maas)>4000; 

-- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorguyaziniz

select isim, sum(maas) from personel 
group by isim HAVING sum(maas)>10000;


SELECT isim, SUM(MAAS) FROM PERSONEL
GROUP BY isim HAVING SUM(MAAS)<10000;

-- eEger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir, count(isim) from personel 
group by sehir having count(isim )>1

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz

select sehir, max(maas) from personel 
group by sehir having max(maas)<5000;



--						UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i
-- ayni olmalidir


-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz

select sehir, maas from personel
where maas>5000 
UNION
select isim, maas from personel
where maas>4000;

-- BU SORGULARI BIRLESTIRIYOR, TABLOLARI BIRLESTIRMIYOR TABLOLARI join ıle bırlestırecegısnz


--


select isim, maas from personel where isim='Mehmet Ozturk'
union
select sehir, maas from personel where sehir='Istanbul';

drop table personel 

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


CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel
select* from personel_bilgi


-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin

SELECT sehir, maas from personel where id=123456789
union
select tel, cocuk_sayisi from personel_bilgi where id=123456789

/*
UNION islemi 2 veya daha cok SELECT isleminin sonuc KUMELERINI birlestirmek icin kullanilir,
Ayni kayit birden fazla olursa, sadece bir tanesini alir. UNION ALL ise tekrarli elemanlari, tekrar sayisinca yazar.*/

Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz

select isim, maas from personel where maas<5000
union all
select isim, maas from personel where maas>4000

Union tekrarli verileri teke dusurur ve bize o sekilde sonuc verir
Union All ise tekrarli verilerle birlikte tum sorgulari getirir.

/*

SQL INTERSECT operatörü, 2 veya daha fazla SELECT ifadesinin sonuçlarını döndürmek için kullanılır.
Ancak, yalnızca tüm sorgular veya veri kümeleri tarafından seçilen satırları döndürür.
Bir sorguda bir kayıt varsa ve diğerinde yoksa, 
INTERSECT sonuçlarından çıkarılacaktır*/


--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

SELECT id FROM personel WHERE sehir IN ('Istanbul', 'Ankara')
Intersect
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3)


--Maasi 4800’den az olanlar veya 5000’den cok olanlarinid’lerini listeleyin
SELECT id
FROM personel
WHERE maas NOT BETWEEN 4800 AND 5500 intersect
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id
FROM personel_bilgi
WHERE cocuk_sayisi IN(2,3);






