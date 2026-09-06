create table users(
    id int primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    age int not null
);

create table products(
    id int primary key,
    product_name varchar(50) not null,
    product_description varchar(500) not null,
    price_cents int not null
);

create table product_reviews(
    user_id int,
    product_id int,
    stars int not null,
    review varchar(500) not null,
    primary key (user_id, product_id),
    foreign key (user_id) references users(id),
    foreign key (product_id) references products(id)
);