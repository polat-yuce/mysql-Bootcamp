-- TODO
-- Soru : Customer tablosunda first_name in uzunluğuna göre kaçar kişi 
--        olduğunu bulunuz
--        örneğin 5 karakterli isimlerde 7 kişi var gibi...
--        4 karakterli isimden 5 tane var
--        6 karakterli isimden 7 tane var

select length(first_name) as harfSayisi, 
concat(' karakterli isimden ', count(*),' tane var') as rapor
from customer
group by length(first_name)
order by count(*)  desc;

-- Stringle ilgili fonksiyonlar devam ---------------------
select first_name
, substr(first_name,3)   -- sira 1 den başlar 3 dahil sonrasını alır
, substr(first_name,3,2) -- 3.karakter dahil 2 tane karakter alıro
, replace(first_name,'A','*') -- A ların hepsini * ile değiştir(Büyük/küçük harf duyarlı)
, replace(first_name,'FE','******')   -- FE leri bul ****** ile değiştir
, locate('a', first_name) -- verilen sutundaki değerlerde aranılan harf/lerin başlama sırasını verir
, lower(first_name) -- hepsini küçült
, upper(first_name) -- hepsini büyüt 
, repeat('*',5) -- verilen karakter/leri verdiğiniz miktar kadar tekrar eder
from customer;


-- Soru : 5 karakterden büyük isimlerin ilk 3 harfini alıp, gerisine * ekleyiniz
--        soyisimlerin ise, ilk bölümüne * ekleyip sondan 3 karakterini alarak aynı 
--        işlemi yapınız.
-- İsmet Temur  ->  İsm**  **mur
-- Korhan Bozdemir -> Kor*** *****mir

-- sub select 
select gizliAd from

(select   -- customer gibi spnucu bir tablo  SUB SELECT   
concat(left(first_name,3), repeat('*', length(first_name)-3)) as gizliAd
, concat(repeat('*', length(last_name)-3) ,right(last_name,3)) as gizliSoyad
from customer) as SonucTablosu;

-- TODO
-- Soru :  isim ve soyisimlerin ilk karakterden sonraki kısımlarına * atarak listeletiniz.
--         örnek : İsmet Temur  ->  İ****  T****
-- Soru : isim ve soyisimi örneğin Ismet Temur -> IT TR şeklinde bitişik yazdırınız.
-- Soru : isim ve soyisimi örneğin Ismet Temur -> I***T T***R şeklinde bitişik yazdırınız

-- Tabloları Sorgularda Birleştirmek a) ALT ALTA Birleştirme  b) Yan Yana birleştirme

-- a) Alt alta birleştirme  UNION // ALL

-- union sorgularda her sorgunun kolon sayısı aynı olmalı
select city from sakila.city  --  600
union   -- alttaki sorgunun sonucunu yukarının sonucuna ekle
select name from world.city;  -- 4079   4679  toplam ama 4004 tane geldi

-- union aynı olan satırları tekrarlama ,
-- Tekrarlasın yanı olduğu hali ile birleştirsin istiyorsam UNION ALL yazılacak

select city from sakila.city  --  600
union all  -- burada tüm satırlar sonuca alındı
select name from world.city; -- 4079  

-- Soru : sakila.city tablosundan A ile başlayan şehirleri
--        world.city tablosundan A ile başlayan şehirleri
--        world_x.city tablosundan A ile başlayan şehirleri leri de listeye ekleyiniz.
--        a) aynı şehirleri almayınız b) aynı şehirleri alınız  

select * from sakila.city where city like 'a%';   -- 44
select * from world.city where name like 'a%'; -- 260
select * from world_x.city where name like 'a%'; -- 260

select city from sakila.city where city like 'a%'
union
select name from world.city where name like 'a%'
union
select name from world_x.city where name like 'a%';  -- 256

select city from sakila.city where city like 'a%'
union all
select name from world.city where name like 'a%'
union all
select name from world_x.city where name like 'a%';  -- 564


-- Soru : Hangi dil id den kaç film olduğunu bulunuz. 
--        listenin altına TOPLAM film sayısını ekleyiniz.
select language_id , count(*) 
from film
group by language_id
union
select 'Toplam',count(*) from film;


-- b) Yan yana birleştirme
-- Her filmin satırının yanına Dilin adını yazdırınız
select film_id, title, description, language_id from film;
select * from language;

-- left join : sol taraf ana tablo olmak üzere buranın yanına kat, EKLE, Birleştir
select film_id, title, description,  language.name as dilAd 
from film
left join language ON film.language_id = language.language_id;

-- Soru : Her müşterinin adı ve soyadının yanına adresini yazdırınız
select * from customer;
select * from address;

select first_name, last_name, address.address
from customer
left join address ON customer.address_id = address.address_id
order by first_name, last_name;



































