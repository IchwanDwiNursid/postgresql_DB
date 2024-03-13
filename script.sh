USER_NAME="iwan"
PASSWORD="iwan"
DB_NAME="belajar"
# connect from docker mysql
mysql -u root -P 3305 -p  #-----> beda antara -P (port) dan -p (password)

# Connect from Docker 

psql -h localhost -p 5432 -U iwan -d mydb -W  #------> w = password 

# Login Postgres
psql -U iwan -d belajar -W -h 127.0.0.1 -p 5432 

# Show Database
\l 

# Show table
\dt

# Create Database
create database mydb;

# Delete database
drop database products;

# switch database
\c mydb

# detail table / show column
\d barang

# watch last id
select currval('admin_id_seq');


