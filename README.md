# restaurant_manage
SQL for create tables
create table rest.desk(
id int auto_increment not null primary key,
description varchar(50),
numberOfPlaces int
);

create table rest.orders(
id int auto_increment not null primary key,
desk_id int not null,
foreign key (desk_id) references desk (description)
);

create table rest.menu_type(
id int auto_increment not null primary key,
type char(20) not null
);

create table rest.menu_items(
id int auto_increment not null primary key,
item char(50),
cost int,
type_item int not null,
foreign key (type_item) references menu_type (id)
);

create table rest.order(
id int auto_increment not null primary key,
count int,
item_id int not null,
order_id int not null,
foreign key (item_id) references menu_items (id),
foreign key (order_id) references orders (id)
);

