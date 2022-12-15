create table Coupons(
    coupon_id varchar(60) primary key,
    name varchar(60) not null,
    discount real not null
);

Create table Customers(
	customer_id varchar(60) primary key,
	fname varchar(60) not null,
	lname varchar(60) not null,
	age integer not null,
	email varchar(60) not null,
	address varchar(256) not null
);

Create table OrderedByappliedon(
	order_id varchar(120) primary key,
    customer_id varchar(60) not null,
	order_placed_on date not null,
	total_amount real not null,
	tax_amount real not null,
	delivery_charges real not null,
	billed_amount real not null,
	coupon_id varchar(60),
	foreign key(coupon_id) references  Coupons(Coupon_id),
	Foreign key (customer_id) references Customers(customer_id)
);



Create table ShippedFromWarehouse(
	order_id varchar(120) primary key,
	warehouse_name varchar(50) not null,
    warehouse_location varchar(256),
	warehouse_zipcode integer not null,
	Foreign key(order_id) references OrderedByappliedon(order_id)
);
