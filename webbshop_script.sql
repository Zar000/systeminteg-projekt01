create table customer(
id int not null auto_increment primary key,
name varchar(30) not null,
age int not null,
gender enum ('M','F') not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

insert into customer(name, age, gender) values 
('Casper', '15', 'M'),
('Mikaela','24','F'),
('Johan','18','M'),
('Frida','21','F'),
('Anna','30','F');

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
('Levis');

create table type(
id int not null auto_increment primary key,
name varchar(30) not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

insert into type(name) values 
('Footwear'),
('Underwear'),
('Sport'),
('Sport'),
('Autumn'),
('Jacket'),
('Mens'),
('Womens')
('Socks'),
('Sneakers'),
('Bra'),
('Boxers'),
('Dress'),
('Shirt'),
('Hoodie'),
('T-Shirt');

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
('Punk T-shirt',(select id from brand where name = 'Gymshark'),'449','M','Purple');


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

select * from orders;

create table orderItems(
orderId int not null,
itemId int not null,
created timestamp default CURRENT_TIMESTAMP,
lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
foreign key(orderId) references orders(id),
foreign key(itemId) references item(id)
);


select * from orderitems;
DROP database webbshop;

