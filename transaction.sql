-- Transaction

-- Commit

start transaction;
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','transaction');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','transaction2');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','transaction3');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','transaction4');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','transaction5');
--
commit;


-- Rollback

start transaction;
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','rollback');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','rollback2');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','rollback3');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','rollback4');
--
insert into guestbooks(email,title,content)
values('transaction@b.com','transaction','rollback5');
--
commit;


-- Lock

start transaction;

select * from products where id = 'p002' for update;
--
select * from products where id = 'p003' for update;
--
rollback;


-- schema

create schema contoh;
--
drop schema contoh;
--
set search_path to contoh;
--
select current_schema();
--
select * from public.products;


-- User Management

create role ichwan; -- role = user
--
create role budi; -- role = user
--
drop role ichwan;
--
drop role budi;
--
alter role ichwan login password 'rahasia';
--
alter role budi login password 'rahasia';
-- ------> acces policy
grand insert,update,select on all tables in schema public to ichwan;
