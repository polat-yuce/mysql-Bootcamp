-- create database z_ismett;  -- db oluşturma
use z_ismett;  -- herkes kendi çöplüğünde mi

create table rehber(
   id int,
   isim varchar(50)
);

select * from rehber;

insert into rehber (id,isim) values (1,'İsmet Temur');
insert into rehber (id,isim) values (2,'Kaya Temur');
insert into rehber (id,isim) values (3,'Süleyman Yılmaz');
insert into rehber (id,isim) values (4,'Mehmet Temur');
insert into rehber (id,isim) values (4,'Merve Kaya');

-- ------- id lerden takrar olmamalı
create table rehber1(
   id int primary key,  -- aynı değerden bir tane daha olması
   isim varchar(50)
);

insert into rehber1 (id,isim) values (1,'İsmet Temur');
insert into rehber1 (id,isim) values (2,'Kaya Temur');
insert into rehber1 (id,isim) values (3,'Süleyman Yılmaz');
insert into rehber1 (id,isim) values (4,'Mehmet Temur');
select * from rehber1;
insert into rehber1 (id,isim) values (4,'Merve Kaya');

insert into rehber1 (id,isim) values (7,'Merve Kaya');


-- ------- id lerden takrar olmamalı ve de id leri kendisi ototmatik versin
create table rehber2(
   id int auto_increment primary key,  -- aynı değerden bir tane daha olmasın ve ototmatik artsın
   isim varchar(50)
);

insert into rehber2 (id,isim) values (1,'İsmet Temur');
insert into rehber2 (id,isim) values (20,'Kaya Temur');
insert into rehber2 (id,isim) values (30,'Süleyman Yılmaz');

insert into rehber2 (isim) values ('Ali Temur'); -- id vermezseniz en son kaldığı yerden devam eder
select * from rehber2;
insert into rehber2 (isim) values ('İsmet Temur'); -- 32 
insert into rehber2 (isim) values ('Kaya Temur');  -- 33

--  Bazı alanları zorunlu yapabilirsiniz.
create table rehber3(
   id int auto_increment primary key,  
   ad varchar(50) not null, -- mutlaka giriş ister
   soyad varchar(50) not null,
   tel varchar(10)
);

select * from rehber3;
insert into rehber3 (ad) values ('İsmet');
insert into rehber3 (ad,soyad) values ('İsmet','Temur');
insert into rehber3 (ad,soyad,tel) values ('Ali','Yılmaz','050666666');

--  Bazı alanları zorunlu yapabilirsiniz. zorunlu olmayan alanlara default value verebilirsin
create table rehber4(
   id int auto_increment primary key,  
   ad varchar(50) not null, -- mutlaka giriş ister
   soyad varchar(50) not null,
   tel varchar(10) default ''   -- veri gelmezse '' değer ototmatik atansın
);

select * from rehber4;
insert into rehber4 (ad,soyad) values ('İsmet','Temur');
insert into rehber4 (ad,soyad,tel) values ('Ali','Yılmaz','0506666');

-- İnsert in 1001 yolu
create table rehber5(
   id int auto_increment primary key,  
   ad varchar(50) not null,  -- buraya bir değer gelmeli
   soyad varchar(50) not null, -- buraya bir değer gelmeli
   tel varchar(50) default '',  -- bir değer verilmeyebilir, verilmezse default '' olacak
   email varchar(100) default '' -- bir değer verilmeyebilir, verilmezse default '' olacak
);

select * from rehber5;

insert into rehber5 (ad,soyad,tel) values ('Ali','Yılmaz','0506666');  -- 1.yöntem

-- 2.yöntem çoklu veri atma
insert into rehber5 (ad,soyad,tel,email) values
('Ali','Yılmaz','0506666',''),
('Mehmet','Demir','0506666',''),
('Ayşe','Yılmaz','0506666','ayse@gmail.com');

truncate table rehber5; -- tabloyu ilk oluşturulduğu ana döndürür, sıfırlar
select * from rehber5;

-- 3 yöntem Süper yöntem, başka örnek tablodan seç buraya otomatik insert yap: Select-Insert

insert into rehber5 (ad,soyad,email, tel)
select first_name, last_name, email,phone 
from sakila.customer
left join sakila.address ON sakila.customer.address_id = sakila.address.address_id 
limit 50;


-- DML : select, insert, delete, update

-- Veri Silme : delete
-- delete from rehber5;  -- tüm tabloyu sil: DELETE komutu WHERE olmadna kullanılmaz
select * from rehber5 where soyad='MARTIN';

delete from rehber5 where soyad='MARTIN'; -- silme işlemlerinde ID kullanılır

select * from rehber5 where id=7; -- önce id den bul emin ol
delete from rehber5 where id=7;  -- sonra id den sil

-- Veri Güncelleme : update
-- update rehber5 set ad='ismet',soyad='temur'  -- WHERE kullanmadan UPDATE yapılamaz !!!
select * from rehber5 where soyad='MARTIN'; -- id sini buldum
select * from rehber5 where id=16;
update rehber5 set ad='ismet',soyad='temur', email='ss' where id=16;  -- 16 nolu id yi isme temur yapacak

-- DML : select, insert, delete, update
-- DDL : create, drop,alter

drop table rehber;  -- rehber tablosu yok edildi
-- drop database z_ismett;  -- z_ismet DB si yok edildi

-- Alter komutu tablo yapısında değişiklik yapar
alter table rehber8 ADD yas int not null; -- yeni kolon ekler
alter table rehber8 CHANGE tel telefon varchar(50); -- var olanı değişiklik yapıyor
alter table rehber8 DROP yas; -- var olan kolonu siler

-- 1 den fazla primary key e ihtiyaç var ise aşağıdaki şekilde tanımlanır
create table aktor_film(
  aktor_id int,
  film_id int,

  primary key(aktor_id, film_id)
)







