-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.

create table tedarik
(
id INT PRIMARY KEY,
isim VARCHAR(10),
irtibat VARCHAR(15)
);

-- tedarikci_id , urun_id , urun_isim , musteri_isim  fieldlari olan urun 
-- tablosu olusturun. Bu tablodaki tedarikci_id fieldini tedarik tablosunun
-- PK 'si ile Foreign Key yapin.

CREATE TABLE urun
(
tedarikci_id INT,
urun_id INT,
urun_isim VARCHAR(10),
musteri_isim VARCHAR(15),
CONSTRAINT urun_fk FOREIGN KEY (tedarikci_id)
REFERENCES tedarik (id)
);

INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can'); 
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz'); 
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can'); 
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman');
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma');
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan'); 
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');

SELECT * FROM tedarik;
SELECT * FROM urun;

use sys;

-- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can' olarak degistiriniz.

update tedarik
set irtibat = 'Veli Can'
where isim = 'LG';

-- Ali Can'in aldigi urunun ismini Apple olarak degistirin

UPDATE urun
SET urun_isim = 'apple'
WHERE musteri_isim = 'Ali Can';

-- Irtibat'i Merve Temiz olan kaydin sirket ismini getirin

select isim
from tedarik
where irtibat = 'Merve Temiz';

/*
a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */

UPDATE urun
SET urun_isim = (SELECT isim FROM tedarik WHERE irtibat = 'Merve Temiz')
WHERE musteri_isim = 'Ali Can';

/*-------------------------------------------------------------------------
b) TV satin alan musterinin ismini, 
IBM'in irtibat'i ile degistirin.
-------------------------------------------------------------------------*/

update urun
set musteri_isim = (select irtibat
					from tedarik
					where isim = 'IBM')
where urun_isim = 'TV';

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/*-------------------------------------------------------------------------
1) Cocuklar tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun. 
 Id field'i Primary Key olsun.
 --------------------------------------------------------------------------*/
 
CREATE TABLE cocuklar(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);

/*-------------------------------------------------------------------------
 2)  Kayitlari tabloya ekleyin.
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85);
 (127, 'Oguz Karaca', 'Tuncay',85);
 (128, 'Resul Can', 'Tugay',85);
 (129, 'Tugay Kala', 'Osman',45);
 --------------------------------------------------------------------------*/
 
INSERT INTO cocuklar VALUES(123, 'Ali Can', 'Hasan',75),
(124, 'Merve Gul', 'Ayse',85),
(125, 'Kemal Yasa', 'Hasan',85),
(126, 'Rumeysa Aydin', 'Zeynep',85),
(127, 'Oguz Karaca', 'Tuncay',85),
(128, 'Resul Can', 'Tugay',85),
(129, 'Tugay Kala', 'Osman',45);



/*-------------------------------------------------------------------------
3)puanlar tablosu olusturun. 
ogrenci_id, ders_adi, yazili_notu field'lari olsun, 
ogrenci_id field'i Foreign Key olsun 
--------------------------------------------------------------------------*/

create table puanlar(
ogrenci_id int,
ders_adi varchar(10),
yazili_notu double,
constraint puanlar_fk foreign key (ogrenci_id)
references cocuklar (id)
);

drop table puanlar;

/*-------------------------------------------------------------------------
4) puanlar tablosuna kayitlari ekleyin
 ('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25)
--------------------------------------------------------------------------*/

INSERT INTO puanlar VALUES
('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25);
 
 select * from puanlar;
 select * from cocuklar;

 /*-------------------------------------------------------------------------
5) Tum cocuklarin gradelerini puanlar tablosundaki yazili_notu ile update edin. 
--------------------------------------------------------------------------*/

update cocuklar
set grade = (SELECT yazili_notu 
             FROM puanlar 
             WHERE cocuklar.id = puanlar.ogrenci_id);



