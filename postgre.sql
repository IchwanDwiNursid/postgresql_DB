CREATE TABLE barang (
    kode INT,
    name VARCHAR(100),
    harga int,
    jumlah int,
    waktu_dibuat  timestamp not null default CURRENT_TIMESTAMP
)

-- edit column

alter table barang 
add column deskripsi text;

alter table barang 
drop column deskripsi;

alter table barang 
rename column name to nama;



-- hapus table 

TRUNCATE barang;
DROP table barang;


-- tabel products

create table products (
    id varchar(10) not null,
    name varchar(100) not null,
    description text,
    price int not null,
    quantity int not null default 0,
    created_at timestamp not null default current_timestamp
);

-- insert data

insert into products(id,name,description,price,quantity,category)
values
('p009','es jeruk','jeruk florida',15000,10,'makanan');

-- insert multiple data

insert into products(id,name,description,price,quantity)
values
('p014','Bakso Kuah kari','makanan berat',15000,30),
('p015','Bakso Malang','makanan berat',16000,50),
('p016','Bakso Goreng Cryspy','makanan ringan',17000,45);

-- retrieve data

select * from products
select id,name,price,quantity from products;


-- add primary key

alter table products
add primary key(id)


-- search data

select * from products
where price = 10000;


-- update data
  -- create enum
create type PRODUCT_CATEGORY as enum('makanan','minuman','dll');

alter table products
add column category PRODUCT_CATEGORY;
--
update products
set category = 'minuman'
where id = 'p010'
--
update products
set category = 'minuman'
where id = 'p011'
--
update products
set category = 'minuman'
where id = 'p012'
--
update products
set category = 'makanan'
where id = 'p002'
--
update products
set category = 'makanan'
where id = 'p003'
--
update products
set category = 'makanan'
where id = 'p004'
--
update products
set category = 'makanan'
where id = 'p005'
--
update products
set price = price + 5000
where id = 'p003'


-- delete products

delete from products 
where id = 'p009'


-- alias (nama lain)

select id as Kode,
        price as Harga,
        description as Keterengan 
from products;


-- Where Operator (Perbandingan)

select * from products
where price <= 15000

select * from products
where price >= 15000 and categor  delete from products
        where id = "p001" and category= 'minuman';
-- ------> AND
select * from products
where price < 5000 and category = 'minuman';
-- ------> OR
select * from products
where price >= 5000 or category = 'minuman';
-- ------> LIKE / ILIKE
select * from products
where name ilike 'eS%'and price < 5000;
--
select * from products
where name ilike 'bakso%';
-- ------> BETWEEN (diantara)
select * from products
where price between 10000 and 20000;
--
select * from products
where price not between 10000 and 20000;
-- ------> IN
select * from products
where category in ('makanan','minuman');
--
select * from products
where category not in ('makanan','minuman');


-- Oreder By (Urutan) - ASC (a,b,c) | DESC (c,b,a)

select * from products 
order by price asc;
--
select * from products 
order by id desc;


-- Limit (batas)

select * from products 
where price > 5000
ORDER BY price asc,id desc
limit 4;
-- -----> OFFSET
select * from products 
where price > 5000
ORDER BY price asc,id desc
limit 2 offset 2 -- BIASANYA UNTUK PAGING


-- DISTICNT no Duplicate
select distinct category from products;


-- Numeric Function
-- -----> ARITMATIKA
select 10 * 10 as hasil;
select id , price / 1000 as price_in_k from products;
-- -----> MATEMATIKA
select id , name , POWER(quantity,2) as jumlah_pangkat_2 from products; -- silahkan baca di documentasi


-- AUTO_INCREMENT

create table admin (
    id serial not null,
    first_name varchar(100) not null,
    last_name varchar(100),
    primary key(id)
);
--
insert into admin(first_name,last_name)
values
('budi','nugraha'),
('amir','mustofa'),
('haikal','indra'),
('aji','kusuma');
--
select * from admin;
-- -----> SELECT current value
select currval('admin_id_seq');


-- sequence

create sequence contoh_sequence;
--
select nextval('contoh_sequence');
--
select currval('contoh_sequence');
--
select lastval('contoh_sequence');


-- String Function

select upper(name) as name_capital,
length(name) as panjang_nama,
lower(description) as deskripsi from products;


-- DATE_TIME FUNCTION  

select now();
--
select extract(year from created_at) as Tahun,
extract(month from created_at) as Bulan,
extract(day from created_at) as Hari,
extract(hour from created_at) as Jam,
extract(minute from created_at) as Menit,
extract(second from created_at) as Detik
from products;


-- FLOW - CONTROL

select id,category,
    case category
        when 'makanan' then 'Enak'
        when 'minuman' then 'Segar'
        else 'Apa itu ?'
        end as category
from products;
--
select id,price,
    case 
    when price <= 10000 then 'Murah'
    when price >= 15000 then 'Mahal'
    else 'Lumayan'
    end as Harga
from products;
--
select id,name,
    case 
    when description is Null then 'Kosong'
    when description ilike 'mie%' then 'Mie'
    else description
    end as description
from products;


-- agregation fn

select sum(price) as tambah from products;
select avg(price) as rata2 from products;
select min(price) as rendah from products;
select max(price) as tinggi from products;
select count(price) as jumlah from products;


-- Group BY

select category,
    avg(price) as "Rata2 Harga",
    min(price) as "Harga Terendah",
    max(price) as "Harga Tertinggi",
    count(price) as "Jumlah"
from products
group by category;
-- ------> Having Clause
select category,
    count(price) as "Jumlah Product"
from products
group by category
having count(id) > 3


-- Constraint (Peraturan)
-- -----> Unique Contraint (tidak boleh duplikat)
create table customers
(
    id serial not null,
    rirst_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100) not null,
    primary key (id),
    constraint unique_email unique(email)
);
--
insert into customers(rirst_name,last_name,email)
values
('budi','nugraha','budi@b.com'),
('amir','mustofa','amir@b.com'),
('haikal','indra','haikal@b.com'),
('aji','kusuma','aji@b.com');
-- -----> Error 
insert into customers(first_name,last_name,email)
values
('jaka','bata','budi@b.com');
-- -----> delete constraint
alter table customers
drop constraint unique_email;
-- -----> create contraint
alter table customers
add constraint unique_email unique(email);
-- -----> check Constraint
create table customers
(
    id serial not null,
    rirst_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100) not null,
    primary key (id),
    constraint unique_email unique(email),
    constraint check_email check(email like '%@%')
);
-- ----->  create check constraint
alter table products
add constraint check_price check(price >= 1000);
--
alter table products
add constraint check_quantity check(quantity >= 0);
--
insert into products(id,name,price,quantity,category)
values ('XXX1','fail example',10000,-10,'makanan');


-- index

create table sellers 
(
    id serial not null,
    name varchar(100) not null,
    email varchar(100) not null,
    primary key(id),
    constraint unique_email_constraint unique (email),
    constraint check_email check (email like '%@%')
);
--
insert into sellers(name,email)
values ('gallery_indonesia','gallery@gmail.com');
-- ----> fast
select * from sellers;
-- ----> slow
select * from sellers
where email = 'gallery@gmail.com' and name = 'gallery_indonesia'
-- ----> create index
create index  seller_id_and_name_index on sellers(id,name);
create index  seller_email_and_name_index on sellers(email,name);


-- FULL Text Search 
-- -----> using Like
select * from products 
where name ilike '%mie%'
--
select * from products 
where to_tsvector(name) @@ to_tsquery('mie')
-- ----> Get available language
select cfgname from pg_ts_config;
-- ----> Create Index FULL TEXT Search
create index product_name_search on products using gin(to_tsvector('indonesian',name));
--
create index product_description_search on products using gin(to_tsvector('indonesian',description));
-- -----> Search
select * from products 
where description @@ to_tsquery('mie')
-- -----> Search Using Operator
select * from products 
where name @@ to_tsquery('mie | bakso')
--
select * from products 
where name @@ to_tsquery('''mie ayam''')


