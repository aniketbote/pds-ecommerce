DROP TABLE IF EXISTS "Coupons" CASCADE;
DROP TABLE IF EXISTS "Customers" CASCADE;
DROP TABLE IF EXISTS "HasCards" CASCADE;
DROP TABLE IF EXISTS "Sellers" CASCADE;
DROP TABLE IF EXISTS "Products" CASCADE;
DROP TABLE IF EXISTS "MadeReview" CASCADE;
DROP TABLE IF EXISTS "Warehouse" CASCADE;
DROP TABLE IF EXISTS "OrderedByAppliedonShippedfrom" CASCADE;
DROP TABLE IF EXISTS "BoughtIn" CASCADE;
DROP TABLE IF EXISTS "WorksAtEmployees" CASCADE;


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

Create table Products(
    product_id varchar(16) primary key,
    name varchar(50) not null,
    price real not null,
    availability integer not null
);


Create table MadeReview(
  customer_id  varchar(16) not null,
  product_id varchar(16) not null,
  stars integer not null,
  review text,
  primary key(customer_id, product_id),
  foreign key(Customer_id ) references Customers(customer_id),
  foreign key(product_id) references Products(product_id)
);

Create table Warehouse(
	warehouse_name varchar(50) not null,
    warehouse_location varchar(256),
	warehouse_zipcode integer not null,
    primary key(warehouse_name, warehouse_zipcode),
);


Create table OrderedByAppliedonShippedfrom(
	order_id varchar(120) primary key,
    customer_id varchar(60) not null,
    warehouse_name varchar(50) not null,
    warehouse_zipcode integer not null,
    coupon_id varchar(60),
	order_placed_on date not null,
	total_amount real not null,
	tax_amount real not null,
	delivery_charges real not null,
	billed_amount real not null,
	foreign key(coupon_id) references  Coupons(Coupon_id),
	foreign key (customer_id) references Customers(customer_id)
    foreign key(warehouse_name, warehouse_zipcode) references Warehouse(warehouse_name, warehouse_zipcode)
);


Create table BoughtIn(
	product_id varchar(20),
	order_id varchar(20),
	quantity integer not null,
	Primary key(product_id, order_id),
	Foreign key (product_id) references Products(product_id),
	Foreign key (order_id) references OrderedBy(order_id)
);



Create table WorksAtEmployees(
	employee_id varchar(16) primary key,
	employee_name varchar(50) not null,
	employee_designation varchar(50) not null,
	employee_department varchar(50) not null, 
	warehouse_name varchar(50),
	warehouse_zipcode integer,
	foreign key(warehouse_name, warehouse_zipcode) references Warehouse(warehouse_name, warehouse_zipcode)
);