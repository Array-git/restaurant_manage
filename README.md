# restaurant_manage
<b>SQL for create tables:</b><br>
create table rest.desk(
id int auto_increment not null primary key,
description varchar(50),
numberOfPlaces int
);<br>

create table rest.orders(
id int auto_increment not null primary key,
desk_id int not null,
foreign key (desk_id) references desk (id)
);<br>

create table rest.menu_type(
id int auto_increment not null primary key,
type char(20) not null
);<br>

create table rest.menu_items(
id int auto_increment not null primary key,
item char(50),
cost int,
type_item int not null,
foreign key (type_item) references menu_type (id)
);<br>

create table rest.receipt(
id int auto_increment not null primary key,
count int,
item_id int not null,
order_id int not null,
foreign key (item_id) references menu_items (id),
foreign key (order_id) references orders (id)
);<br>

add create tables for user and roles

<b>For create account administration run script in SQL:</b><br>
insert into rest.usr (id, active, password, username) value (1, 1, 'password in bcrypt with rounds=8 ', 'admin');<br>
insert into rest.user_role (user_id, roles) value (1, 'ROLE_ADMIN');
