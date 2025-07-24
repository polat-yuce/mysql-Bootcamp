select * from city;
select count(ID) from city; -- id leri say , yani satır sayısı, 
                            -- yani şehir sayısı
                            
select count(*) from city; -- herhangi bir baslıgı say, kaç satır var
select distinct(name) from city; -- benzersiz isim leri göster 
select count(distinct(name)) from city; -- benzersiz isim sayısı 

select 4-2; 
select 45/6*4;  
use sakila; -- film kiralama programının database i
select * from actor; -- actorlerin tablosu
select * from customer; -- müşteriler
select * from address; -- müşterilerin adresleri
select * from city; -- müşterilerin adreslerinin illeri
select * from country; -- müşteri adreslerindeki illerin ülkeleri
select * from film; -- mağazadaki film listesi
select * from film_actor;  -- hangi actor hangi filmde oynamış
select * from payment; -- hangi müşteri nekadar ödeme yapmış

select count(*) as AktorSayisi from actor; -- aktor sayısı

select * from payment;
select max(amount) as EnFazlaOdeme from payment; -- En pahalı kiralam
select min(amount) as EnUcuzOdeme from payment; -- En ucuz kiralama
select sum(amount) as OdemeToplam from payment; -- Toplam gelir
select avg(amount) as OdemeOrtalamasi from payment; -- Ortalama

-- payment tablosundan cursotmer id si 3 olan müşterinin ödemlerini getir
select * from payment where customer_id=3; 

-- 3 nolu müşteri toplam kaç lira ödemiştir ?
select sum(amount) from payment where customer_id=3;

-- Soru : 3 nolu müşterinin yapmış olduğu min ve max ödemeleri bulunuz.
select max(amount) as max, min(amount) as min from payment where customer_id=3;

-- Soru : 3 nolu müşteri kaç ödeme yapmıştır
select count(*) as KiralamaMik from payment where customer_id=3;

-- Birden fazla Kriter nasıl verebilirim
-- javada:  !=  && || ,    sql de : <>,!=,  and or 
select * from payment where customer_id=3 and staff_id=2;

-- 3 ve 6 nolu müşterilerin ödemelerini listeletiniz.
select * from payment where customer_id=3 or customer_id=6;

select * from payment where customer_id in (3,6,7,8); -- customer id bu olanlar
select * from payment where customer_id between 3 and 6; -- 3 ve 6 arasındakiler
select * from payment where customer_id>=3 and customer_id<6; -- 3 den büyük ve 6 küçük olanlar

select * from customer;
select * from customer where first_name='SCOTT' or first_name='Elizabeth';
select * from customer where first_name in ('SCOTT','Elizabeth');

 -- Soru : payment tablosundan 5 ve 7 dolar arası ödeme yapan 
        -- müşteri numaralarını bulunuz
select * from payment where amount>=5 and amount<=7;
select * from payment where amount between 5 and 7;

-- Soru : 5 nolu müşterinin haricideki müşterileri customer tablosundan listeletiniz
select * from customer where customer_id <> 5;   
        
-- Soru : 2005-07-08 gününde 5 ile 7 dolar ödeyen müşterilerin id listesini bulunuz.
select * from payment where 
payment_date between '2005-07-08 00:00:00' and '2005-07-08 23:59:59'
and amount between 5 and 7;-- 5 ila 7 arası ödeyenler

select * from payment where 
(payment_date >='2005-07-08 00:00:00' and payment_date<='2005-07-08 23:59:59')
and amount between 5 and 7;-- 5 ila 7 arası ödeyenler

select * from payment where 
DATE(payment_date) ='2005-07-08'  -- Date zamanın sadece tarih kısmını alır
and amount between 5 and 7;  -- 5 ila 7 arası ödeyenler

select * from payment where 
DATE(payment_date) ='2005-07-08'  -- Date zamanın sadece tarih kısmını alır
and (amount=5.99 or amount=7.99);   -- direk 5 veya 7 ödeyeneler

-- String arama işlemleri
select * from customer where first_name='SCOTT';
select * from customer where first_name like 'S%'; -- S ile başlayanlar (startwith)
select * from customer where first_name like '%T'; -- T ile bitenler (endWith)
select * from customer where first_name like '%ER%'; -- içinde ER geçenler(contains)

-- A ile başlayan, T ile biten ama içinde E olan
select * from customer where first_name like 'a%e%t'; 
 
select * from payment where payment_date like '2005-07-08%'; -- tarih bilgisinde kullanılabilir

-- limit : Ekranda gösterilecek kayıt sayısı ve başlama noktası
select * from customer limit 10; -- ilk 10 kaydı göster
select * from customer limit 10,10;  -- ilk 10 kayıttan sonraki 10 kayıt 11-20
-- limit 10,10  burdaki birinci 10, kaçıncı kayıttan sonra başlanacağını,
--                      ikinci  10 ise kaç kayıt gösterileceğini belirtir
select * from customer limit 20,13; -- 20 den sonraki ilk 13 kayıt                     
                                          
-- ORDER : gelen bilgi için sıralama kriteri
select * from customer;
select * from customer order by first_name; -- müşterile isme göre sırala

-- 2 nolu mğazanın müşerileri isim sıralı getir
select * from customer where store_id=2 order by first_name;



                     
                     
                     
                     
                     
                     
                     
                     