-- ORDER : gelen bilgi için sıralama kriteri
select * from customer;
select * from customer order by first_name; -- müşterile isme göre sırala

-- 2 nolu mğazanın müşerileri isim sıralı getir
select * from customer where store_id=2 order by first_name;  -- default olarak artan yönde
select * from customer where store_id=2 order by first_name asc; -- artan yönde sırala
select * from customer where store_id=2 order by first_name desc; -- azalan yönde sırala
-- artan 1 den 9 a veya A dan Z ye doğru demek
-- azalan 9 dan 1 e veya Z den A ya doğru demektir
 
-- Müşteri bilgileri mağaza sıralı olarak listeletiniz
select * from customer order by store_id; 

-- store_id sıralı olsun, her store_id kendi için isim sıralı olsun
select * from customer order by store_id, first_name;

-- Soru : müşteri tablosundaki id ye göre 10 ismi bulunuz.
select * from customer order by customer_id limit 10;

-- Soru : Müşteri tablosundaki 500 ile 600 customer id ler arası 
-- müşterileri mağazaya bazlı, soyisim sıralı listesini veriniz.

select * 
from customer
where customer_id between 500 and 600
order by store_id, last_name;


-- Soru : 2005-12-01 tarihten önceki ödemelerin listesini müşteri nosu  sıralı veriniz.
select * 
from payment
where payment_date < '2005-12-01'
order by customer_id; 

-- Soru : 2006 yılına ait toplam ödemeyi(amount) bulunuz
select SUM(amount) as sum
from payment 
where YEAR(payment_date) = 2006;

select sum(amount) as ToplamOdeme
from payment
where payment_date like '2006%';

select sum(amount) 
from payment 
where payment_date between '2006-01-01' and '2006-12-31 23:59:59';


-- ------------------------
select * from address; -- il ilçe semt    disrict -> ilçe-semt gibi bölge

-- distinct  : benzersiz, tekrarsız
select distinct(district) from address;  -- benim hangi bölgelerden müşterilerim var
select * from address order by district;  -- tüm kayıtlar

select distinct(store_id) from customer;  -- benzersiz magaza noları 1,2  

-- Grup BY
-- bölgeye göre müsateri sayıları listesinin, sayıya göre sıralı hali
select district, count(*) as musteriSayisi -- count(*)  : her grubun kendi miktarı
from address
group by district
order by musteriSayisi desc; 

use world;
select * from city;
-- Soru : Her ülkenin kaç şehri olduğunu bulunuz ve 
-- listeniz en fazla olan sehirden aza doğru olsun.

select CountryCode, count(*) as SehirSayisi
from city
group by CountryCode
order by SehirSayisi desc;

-- yukarıdaki sorguda şehirsayısi 100 ün üzerinde olan ülkeleri nasıl alırdık
-- HAVING -> Gruplamadam sonra kriter verme , süzme

select CountryCode, count(*) as SehirSayisi
from city
-- where  gruplamadan önceki ham bilgiyi süzer
group by CountryCode
having SehirSayisi>100 -- gruplamadan sonra süzme
order by SehirSayisi desc;

-- Soru : City tablosundan her ülkenin A ile başlayan kaç şehri 
--        olduğunu bulunuz
--     b) Şehir sayısı 10 dan büyük olanları sadece listeleyiniz

select CountryCode, count(*) as SehirSayisi
from city
Where name like 'a%'
group by CountryCode
having SehirSayisi>10
order by SehirSayisi desc;

-- String fonksiyonları ------------------------
use sakila;
select * from customer;

-- concat virgülle verilenleri birleştirir
select first_name, last_name, email from customer;
select concat(first_name,' ',last_name) as fullName, email from customer;
select concat("FullName=", first_name,' ',last_name) as fullName, email from customer;

-- length verilen stringin uzunluğunu veririr
select first_name, last_name, length(first_name) as fu, length(last_name) as lu
from customer;

-- left : soldan istenen kadar karakter alıyor , right : sağdan
select first_name, last_name, left(first_name,3) as SoldanUcKarakter, 
right(last_name, 3) as SagdanUcKarakter
from customer;  

-- soru : isimleri İ.Temur  şeklinde yazdırınız.
select first_name, last_name,
concat(left(first_name,1),'.',last_name ) as OzetIsim
from customer;

-- soru : isimleri İ.T.  şeklinde yazdırınız.
select first_name, last_name,
concat(left(first_name,1),'.',left(last_name,1),'.') as OzetIsim
from customer;

-- TODO
-- Soru : Customer tablosunda first_name in uzunluğuna göre kaçar kişi 
--        olduğunu bulunuz
--        örneğin 5 karakterli isimlerde 7 kişi var gibi...
--        4 karakterli isimden 5 tane var
--        6 karakterli isimden 7 tane var
















                                     
                                         
                                         





























