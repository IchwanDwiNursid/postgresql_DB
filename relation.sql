-- Table Relationship

create table wishlist (
    id serial not null,
    id_product varchar(100) not null,
    description text,
    primary key(id),
    constraint fk_product foreign key(id_product) references products(id)
);
-- -----> add foreign key
alter table wishlist
    add constraint fk_wishlist_products foreign key (id_product) references products (id);
-- -----> delete foreign key
alter table wishlist
    drop constraint fk_wishlist_product;
-- -----> Add products with relation
insert into wishlist(id_product,description)
values
('p001','ini wishlist 1'),
('p002','ini wishlist 2'),
('p003','ini wishlist 3'),
('p004','ini wishlist 4'),
('p010','ini wishlist 5'),
('p011','ini wishlist 6');
-- -----> Behavior foreign key (restrict,cascade,set null)
alter table wishlist
    add constraint fk_wishlist_products foreign key (id_product) references products (id) 
    on update cascade on delete cascade;
    -- ------> can delete because product deleted
    -- ------> can update because product updated
    delete from products 
        where id = 'p001';
-- 
insert into wishlist(id_product,description)
values ('xxx1','ini adalah wistlish batagor'),
        ('xxx2','ini adalah wishlist otak-otak'),
         ('xxx3','ini adalah wistlish mie jawa');


-- JOIN

select * from wishlist join products on wishlist.id_product = products.id;
-- join double
select products.id , products.name , wishlist.id , wishlist.description
from wishlist join products on wishlist.id_product = products.id;
-- join multiple
alter table wishlist
add column id_customer INT;
--
alter table wishlist
add constraint fk_wishlist_customer foreign key(id_customer) references customers(id);
--
update wishlist
set id_customer = 2
where id in (8,9);
--
update wishlist
set id_customer = 4
where id in (17,18);
--
select * from wishlist join products on wishlist.id_product = products.id
join customers on wishlist.id_customer = customers.id