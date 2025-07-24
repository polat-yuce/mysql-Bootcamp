-- Ulkeler tablosundaki bütün bilgileri getir,sec
use world;  -- Bu DB yi seç
select * from country; -- Ülkeler tablosundaki bütün(*) bilgileri getir
select * from city; -- city tablosundaki bütün kayıtları getir
select code, name from country;
select id, name, countryCode from city; -- SQL db nin dili
select id as Nosu, name as Ad , countryCode as UlkeKodu from city;

use sakila;  -- film kiralama şirketi
select * from customer;
select * from address;
