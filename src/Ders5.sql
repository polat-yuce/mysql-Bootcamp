-- Soru : Her adres bilgisinin yanına City adını ekleyiniz.
select * from address;  -- city_id
select * from city;  -- city_id

select address.* , city.city  -- address.* : adres tablosundaki kolonlar
from address
LEFT join city ON address.city_id = city.city_id; 
-- LEFT : soldaki tablo (address) ana tablo duracak, 
-- verilen eşleştirme kriterine göre sağdan değerleri bul yanı yaz

select address, address2, district , city, postal_code,phone  
from address
LEFT join city ON address.city_id = city.city_id; 

-- Soru : Her şehrin yanına ülkesinin adını yazdırınız 
select * from city;
select * from country;

select city, country
from city
LEFT join country ON city.country_id = country.country_id;

-- birden fazla join   
select address, district , city, country
from address
left join city ON address.city_id = city.city_id
left join country ON city.country_id = country.country_id;

-- Soru : Her müşterinin adının soyadnın yanına adresini ve 
--        şehir adını yazdırınız.   

select first_name, last_name, address, city
from customer
left join address ON address.address_id = customer.address_id
left join city ON address.city_id = city.city_id;
       
-- Yukarıdaki sorguya Ülke bilgisini de ekleyiniz.
select first_name, last_name, address, city, country
from customer
left join address ON address.address_id = customer.address_id
left join city ON address.city_id = city.city_id
left join country ON country.country_id = city.country_id;

-- left  joinde:  ana tablom soldaki tablo olur ve sağdaki tablodan eşleşmeler getirilir
-- right joinde:  ana tablom sağdakı tablo olur ve soldakı tablodan eşleşmeler getirilir

-- Soru : Her filmin title nın yanına aktorünün adını ve soyadını yazdırınız. 
select * from film;
select * from film_actor;
select * from actor;

select title, film_actor.actor_id, first_name, last_name
from film
left join film_actor ON film.film_id = film_actor.film_id
left join actor ON film_actor.actor_id = actor.actor_id;

-- Soru : Bütün filimlerin title ını, hangi kategoride olduğunu ve dilini
--        yazdırınız.  1.tablo film 2.tablo film_category 3.tablo category
--        4.tablo language

select title, category.category_id, category.name as kategori, language.name as dil
from film
left join film_category ON film.film_id = film_category.film_id
left join category ON category.category_id = film_category.category_id
left join language ON language.language_id = film.language_id;

-- Soru : Bütün filimlerin title ını, hangi kategoride olduğunu yazdırınız

select title, category.category_id, category.name as kategori
from film
left join film_category ON film.film_id = film_category.film_id
left join category ON category.category_id = film_category.category_id;

-- TODO  : Hangi kategoriden kaç film olduğunu bulunuz ve
--        ve en son satıra toplam film sayısını ekleyiniz.

-- TODO :  Hangi aktörün(adı ve soyadı) kaç filmi olduğunu bulunuz. 

-- Şimdiye kadar TEST ing için yeterli olan ve gerekli olan SQL komutlarını bitirdik.
-- Fakat DB ortamını daha iyi anlamak için bilgi seçmenin (select) haricinde
-- normalde kullanmanıza gerek olmayan INSERT, UPDATE, DELETE komutlarını görelim.

-- Create , drop, alter diye komutlar bunlarda DB tasarım komutlar

-- DB Tasarım Komutlarına DDL (Data Defination Language)  komutları denir
-- create : oluşturma
-- drop : yok etme
-- alter : değişiklik yapma

-- DB deki Dataları değiştiren komutlara DML (Data Manipulation Language)
-- select : bilgi secme, getirme
-- insert : bilgi ekleme
-- update : bilgi değiştirme
-- delete : bilgi silme

-- Kendi DB mi oluşturmadan önce var olanları inceleyelim nasıl tasarlanmış

select * from city;




























