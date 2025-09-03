
create table customer(
id int not null auto_increment primary key,
name varchar(30) not null,
lastname varchar(30) not null,
age int not null,
gender enum ('M','F') not null,
locality varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

insert into customer(name, lastname, age, gender, locality) values 
('Casper','Svensson', '15', 'M','Stockholm'),
('Mikaela','Lindström','24','F','Eskilstuna'),
('Johan','Berglund','18','M','Göteborg'),
('Frida','Olsson','21','F','Malmö'),
('Anna','Hakanen','30','F','Kiruna');

create table brand(
id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

insert into brand(name) values
('PUMA'),
('Adidas'),
('H&M'),
('Dressman'),
('Gucci'),
('Gant'),
('Gymshark'),
('Levis'),
('SweetPants');

create table categories(
id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

insert into categories(name) values 
('Footwear'),
('Underwear'),
('Sport'),
('Autumn'),
('Jacket'),
('Mens'),
('Womens'),
('Socks'),
('Sneakers'),
('Bra'),
('Boxers'),
('Dress'),
('Shirt'),
('Hoodie'),
('T-Shirt'),
('Pants'),
('Summer');

create table item(
id int not null auto_increment primary key,
name varchar(30) not null,
brand int not null,
cost float not null,
size varchar(30) not null,
color varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
foreign key(brand) references brand(id)
);

insert into item(name, brand, cost, size, color) values 
('Sport Socks',(select id from brand where name = 'PUMA'),'49','39-42','White'),
('Sleekers',(select id from brand where name = 'Adidas'),'1249','42-45','Red & Black'),
('Sport Bra',(select id from brand where name = 'Adidas'),'199','B35','Black'),
('Comfort Boxers',(select id from brand where name = 'PUMA'),'49','M','Orange'),
('Elegant Dress',(select id from brand where name = 'Gucci'),'749','S','Yellow'),
('Business Shirt',(select id from brand where name = 'Gant'),'699','L','White'),
('Cozy Hoodie',(select id from brand where name = 'Gymshark'),'299','XL','Red'),
('Punk T-shirt',(select id from brand where name = 'Gymshark'),'449','M','Purple'),
('Runner',(select id from brand where name = 'SweetPants'),'349','S','Black');

create table itemCategories(
itemId int not null,
categoryId int not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
foreign key(itemId) references item(id),
foreign key(categoryId) references categories(id));

#Det var strul med att göra som vanlig så jag hittade denna metod som också gör allting i ett kommando
insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Socks', 'Sport', 'Summer')
where i.name = 'Sport Socks';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Pants', 'Sport', 'Summer')
where i.name = 'Runner';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Sneakers', 'Sport', 'Summer','Footwear')
where i.name = 'Sleekers';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Womens', 'Sport', 'Summer','Bra')
where i.name = 'Sport Bra';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Mens', 'Underwear','Boxers')
where i.name = 'Comfort Boxers';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Womens', 'Summer','Dress')
where i.name = 'Elegant Dress';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Shirt','Summer')
where i.name = 'Business Shirt';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('Hoodie','Autumn')
where i.name = 'Cozy Hoodie';

insert into itemCategories (itemId, categoryId)
select i.id, c.id
from item i
join categories c on c.name in ('T-Shirt','Summer')
where i.name = 'Punk T-Shirt';

select * from itemCategories;

create table orders(
id int not null auto_increment primary key,
customerid int not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
foreign key(customerid) references customer(id)
);

insert into orders(customerid) values
((select id from customer where name = 'Casper')),
((select id from customer where name = 'Mikaela')),
((select id from customer where name = 'Johan')),
((select id from customer where name = 'Frida')),
((select id from customer where name = 'Anna'));

create table orderItems(
orderId int not null,
itemId int not null,
count int not null DEFAULT '0',
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
foreign key(orderId) references orders(id),
foreign key(itemId) references item(id)
);

insert into orderItems(orderId, itemId, count) values
((select id from orders where customerid = '1'),(select id from item where name = 'Runner'),'3'),
((select id from orders where customerid = '1'),(select id from item where name = 'Cozy Hoodie'),'2'),
((select id from orders where customerid = '3'),(select id from item where name = 'Sleekers'),'1'),
((select id from orders where customerid = '3'),(select id from item where name = 'Sport Bra'),'5'),
((select id from orders where customerid = '4'),(select id from item where name = 'Cozy Hoodie'),'7'),
((select id from orders where customerid = '4'),(select id from item where name = 'Elegant Dress'),'2'),
((select id from orders where customerid = '4'),(select id from item where name = 'Cozy Hoodie'),'1'),
((select id from orders where customerid = '5'),(select id from item where name = 'Business Shirt'),'3'),
((select id from orders where customerid = '5'),(select id from item where name = 'Punk T-Shirt'),'2'),
((select id from orders where customerid = '5'),(select id from item where name = 'Cozy Hoodie'),'3'),
((select id from orders where customerid = '2'),(select id from item where name = 'Cozy Hoodie'),'2'),
((select id from orders where customerid = '2'),(select id from item where name = 'Sport Socks'),'1'),
((select id from orders where customerid = '2'),(select id from item where name = 'Cozy Hoodie'),'1'),
((select id from orders where customerid = '2'),(select id from item where name = 'Cozy Hoodie'),'3');

#Denna insert är separat så att jag inte behöver sätta en " created " på dem andra. Detta är för fråga 3
insert into orderItems(orderId, itemId, count, created) values
((select id from orders where customerid = '5'),(select id from item where name = 'Sleekers'),'19', '2025-07-13'),
((select id from orders where customerid = '1'),(select id from item where name = 'Elegant Dress'),'15', '2025-07-13'),
((select id from orders where customerid = '3'),(select id from item where name = 'Runner'),'13', '2025-07-13'),
((select id from orders where customerid = '4'),(select id from item where name = 'Business Shirt'),'8', '2025-07-13'),
((select id from orders where customerid = '2'),(select id from item where name = 'Punk T-Shirt'),'5', '2025-07-13');



