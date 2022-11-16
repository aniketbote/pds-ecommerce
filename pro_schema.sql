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



