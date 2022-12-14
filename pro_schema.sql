Create table Customers(
	customer_id varchar(16) primary key,
	fname varchar(50) not null,
	lname varchar(50) not null,
	age integer not null,
	email varchar(50) not null,
	address varchar(256) not null
);

Create table HasCards(
	card_number varchar(16) primary key,
	customer_id  varchar(16) not null,
	billing_address varchar(256) not null,
	expiry_month integer not null,
	expiry_year integer not null,
	Foreign key(customer_id) references Customers(customer_id)
);

Create table Sellers(
    seller_id varchar(16) primary key,
    name varchar(50) not null,
    email varchar(50) not null,
    address varchar(256) not null,
    phone_num varchar(16) not null
);

Create table Employees(
    employee_id varchar(16) primary key,
    employee_name varchar(50) not null,
    designation varchar(50) not null,
    department varchar(50) not null
);

Creating products data
Create table Products(
    product_id varchar(16) primary key,
    name varchar(50) not null,
    price real not null,
    availability integer not null
);

create table Coupons(
    coupon_id varchar(16) primary key,
    name varchar(16) not null,
    discount real not null,
    start_date date not null, - yyyy-mm-dd
    end_date date not null - yyyy-mm-dd
);