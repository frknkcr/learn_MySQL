/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/

-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.

USE sys;

create table fen_lisesi(
okul_no int unique,
isim varchar(25) not null,
derece double,
adres varchar(50),
son_degisiklik_tarihi date
);

select * from fen_lisesi;

insert into fen_lisesi values (101,'Mehmet Dag',4.5,'Ankara','2023-01-20');
INSERT INTO fen_lisesi VALUES (102, 'Berrin Hanim', 4.6, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (103, 'Mehmet Erden', 3.9, 'Izmir','2023-01-19');
INSERT INTO fen_lisesi VALUES (104, 'Sinan Bey', 4.7, 'Istanbul','2023-01-20');
INSERT INTO fen_lisesi VALUES (105, 'Esra Turker', 4.9, 'Ankara','2023-01-18');
INSERT INTO fen_lisesi VALUES (106, 'Gulhayat Guder', 4.3, 'Izmir','2023-01-18');
INSERT INTO fen_lisesi VALUES (107, 'Berivan Gencdal', 4.3, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (108, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi (isim,adres) VALUES ('Abdullah Ak', 'Istanbul');
INSERT INTO fen_lisesi (okul_no,isim,adres) VALUES ('109', 'Yucel Bey','Istanbul');
INSERT INTO fen_lisesi (isim,adres,okul_no) VALUES ('Yucel Bey','Istanbul','110');

-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.

/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */

CREATE TABLE anadolu_lisesi(
okul_no VARCHAR(4) UNIQUE,
isim VARCHAR(25) NOT NULL,
adres VARCHAR(10),
derece DOUBLE
);

SELECT * FROM anadolu_lisesi;
DROP TABLE anadolu_lisesi;

INSERT INTO anadolu_lisesi VALUES ('1001','Ayse Nuriye','Istanbul',4.7);
INSERT INTO anadolu_lisesi VALUES ('1002','Zafer Bey','Ankara',4.6);
INSERT INTO anadolu_lisesi VALUES ('1003','Furkan Veli Inal','Istanbul',3.9);
INSERT INTO anadolu_lisesi VALUES ('1004','Humeyra Uysal','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('1005','Mehmet Harun','Istanbul',3.8);
INSERT INTO anadolu_lisesi VALUES ('','Berivan Gencdal','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('','Ilyas Bey','Istanbul',3.8);
INSERT INTO anadolu_lisesi VALUES ('1006','Neo Bey','Istanbul',3.8);
INSERT INTO anadolu_lisesi (isim, adres) VALUES ('Berrin Hanim','Ankara'); 
INSERT INTO anadolu_lisesi (okul_no, isim, derece) VALUES ('1007','Ersin Bey',4.9); 
