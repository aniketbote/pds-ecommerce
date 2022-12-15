DROP TABLE IF EXISTS "coupons" CASCADE;
DROP TABLE IF EXISTS "customers" CASCADE;
DROP TABLE IF EXISTS "hascards" CASCADE;
DROP TABLE IF EXISTS "sellers" CASCADE;
DROP TABLE IF EXISTS "products" CASCADE;
DROP TABLE IF EXISTS "madereview" CASCADE;
DROP TABLE IF EXISTS "warehouse" CASCADE;
DROP TABLE IF EXISTS "orderedbyappliedonshippedfrom" CASCADE;
DROP TABLE IF EXISTS "boughtin" CASCADE;
DROP TABLE IF EXISTS "worksatemployees" CASCADE;


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
	card_number varchar(60) primary key,
	customer_id  varchar(60) not null,
	billing_address varchar(256) not null,
	expiry_month integer not null,
	expiry_year integer not null,
	Foreign key(customer_id) references Customers(customer_id)
);

Create table Sellers(
    seller_id varchar(60) primary key,
    name varchar(60) not null,
    email varchar(60) not null,
    address varchar(256) not null,
    phone_num varchar(60) not null
);

Create table Products(
    product_id varchar(60) primary key,
    name varchar(60) not null,
    price real not null,
    availability integer not null
);


Create table MadeReview(
  customer_id  varchar(60) not null,
  product_id varchar(60) not null,
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
    primary key(warehouse_name, warehouse_zipcode)
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
	foreign key (customer_id) references Customers(customer_id),
    foreign key(warehouse_name, warehouse_zipcode) references Warehouse(warehouse_name, warehouse_zipcode)
);


Create table BoughtIn(
	order_id varchar(120),
	product_id varchar(60),
	quantity integer not null,
	Primary key(product_id, order_id),
	Foreign key (product_id) references Products(product_id),
	Foreign key (order_id) references OrderedByAppliedonShippedfrom(order_id)
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

INSERT INTO coupons (coupon_id , name , discount) values ('MTUOGB','FLAT20', 0.2);
INSERT INTO coupons (coupon_id , name , discount) values ('UAWYVQ','BLACKFRIDAY', 0.5);
INSERT INTO coupons (coupon_id , name , discount) values ('GHXANS','FIRSTORDER', 0.5);
INSERT INTO coupons (coupon_id , name , discount) values ('KPFVWY','SUMMERSALE', 0.3);
INSERT INTO coupons (coupon_id , name , discount) values ('YZKSWQ','WINTERSALE', 0.3);
INSERT INTO coupons (coupon_id , name , discount) values ('KZFGFA','GIFTGUIDE', 0.11);
INSERT INTO coupons (coupon_id , name , discount) values ('MAILAP','MYSTERYDEAL', 0.2);
INSERT INTO coupons (coupon_id , name , discount) values ('GTFWGT','DOORBUSTER', 0.15);
INSERT INTO coupons (coupon_id , name , discount) values ('KGSXXU','BFCONTEST', 0.05);
INSERT INTO coupons (coupon_id , name , discount) values ('LITZMO','SHOPPINGSPREE', 0.1);
INSERT INTO coupons (coupon_id , name , discount) values ('NHTBVT','SPRUCEUP', 0.18);
INSERT INTO coupons (coupon_id , name , discount) values ('LMFWGF','TAKEITALL', 0.2);
INSERT INTO coupons (coupon_id , name , discount) values ('WAFANK','STOCKTAKESALE', 0.08);
INSERT INTO coupons (coupon_id , name , discount) values ('NOAXDQ','BIGSTOCKTAKE', 0.11);
INSERT INTO coupons (coupon_id , name , discount) values ('WXKVAA','HELPUSMOVE', 0.18);
INSERT INTO coupons (coupon_id , name , discount) values ('HWTIUT','OVERSTOCKED', 0.09);
INSERT INTO coupons (coupon_id , name , discount) values ('EUGWZA','WELCOMEABOARD', 0.15);
INSERT INTO coupons (coupon_id , name , discount) values ('KLPBCG','ALLABOARD', 0.14);
INSERT INTO coupons (coupon_id , name , discount) values ('JPVVOB','HOWDY10', 0.08);
INSERT INTO coupons (coupon_id , name , discount) values ('ZDLXRF','GDAY10', 0.16);
INSERT INTO coupons (coupon_id , name , discount) values ('JTZGMP','RUDOLFSDEAL', 0.08);
INSERT INTO coupons (coupon_id , name , discount) values ('UGLFVP','JOLLY15', 0.09);
INSERT INTO coupons (coupon_id , name , discount) values ('YTOVZI','REDHATWHITEBEARD', 0.16);
INSERT INTO coupons (coupon_id , name , discount) values ('ZIHFVV','FESTIVE10', 0.08);
INSERT INTO coupons (coupon_id , name , discount) values ('ALHIRB','HOLIDAYSPIRIT', 0.05);
INSERT INTO coupons (coupon_id , name , discount) values ('LERDKB','DRINKMAS', 0.17);
INSERT INTO coupons (coupon_id , name , discount) values ('CJUKCJ','NOTRICKS', 0.2);
INSERT INTO coupons (coupon_id , name , discount) values ('QBBEYD','PUMPKIN', 0.13);
INSERT INTO coupons (coupon_id , name , discount) values ('CBVPKD','TRICKORTREAT', 0.11);
INSERT INTO coupons (coupon_id , name , discount) values ('XHQOGH','HALLOWEENIE', 0.11);


INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER1','Cecily Wall','cecily.wall@yahoo.com','611 Valley St. Massillon, OH 44646', 2579628381 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER2','Eden Coleman','eden.coleman@yahoo.com','254 Lookout Street Bear, DE 19701', 6585341215 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER3','Zach Washington','zach.washington@outlook.com','8720 Newport Street Crystal Lake, IL 60014', 7776347309 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER4','Kristina Holmes','kristina.holmes@gmail.com','64 Van Dyke Circle Titusville, FL 32780', 2819497046 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER5','Wilson Hayden','wilson.hayden@yahoo.com','54 N. Cottage St. Suite 630 Fayetteville, NC 28303', 7804286556 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER6','Shaun Frost','shaun.frost@yahoo.com','8643 Shipley Street Cookeville, TN 38501', 7663732392 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER7','Karim Matthams','karim.matthams@outlook.com','875 Wakehurst Dr. Duarte, CA 91010', 2392275905 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER8','Jenna Mejia','jenna.mejia@outlook.com','715 College Lane Glen Allen, VA 23059', 2668181868 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER9','Jonty Conner','jonty.conner@yahoo.com','816 Glenridge St. Rolling Meadows, IL 60008', 4604675159 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER10','Abdur Benton','abdur.benton@gmail.com','9180 Griffin Road Homestead, FL 33030', 8494975854 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER11','Carla Tucker','carla.tucker@outlook.com','171 Newport Street Fuquay Varina, NC 27526', 6516926163 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER12','Katrina Campos','katrina.campos@gmail.com','909 Chestnut Rd. Whitehall, PA 18052', 9452886410 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER13','Hermione Mcclain','hermione.mcclain@yahoo.com','9472 Military Lane Reston, VA 20191', 8913373541 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER14','Erin Mayer','erin.mayer@outlook.com','438 Woodside Dr. Lakeland, FL 33801', 9985722503 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER15','Asiya Wong','asiya.wong@yahoo.com','92 E. Aspen Street Dayton, OH 45420', 9629854313 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER16','Elise Velez','elise.velez@yahoo.com','97 Lake Street East Hartford, CT 06118', 3646011923 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER17','Aine Cooke','aine.cooke@outlook.com','177 Pawnee Street Owings Mills, MD 21117', 3587172688 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER18','Melanie Saunders','melanie.saunders@outlook.com','8969 Vine Rd. Des Moines, IA 50310', 5625068710 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER19','Shannon Branch','shannon.branch@gmail.com','500 Hamilton Dr. Manchester, NH 03102', 8884707391 );
INSERT INTO Sellers (seller_id, name, email, address, phone_num) values ('CBAYSELLER20','Joao Riggs','joao.riggs@outlook.com','324 East Iroquois Drive Leland, NC 28451', 9979105981 );

INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0001','C-bay Mattress', 149.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0002','C-bay Pillows', 14.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0003','C-bay Cloth Hangars', 5.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0004','C-bay Bed Frame', 74.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0005','C-bay Bed Sheet', 13.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0006','C-bay Comforter', 24.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0007','C-bay Wine Glasses', 27.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0008','C-bay Plate Set', 34.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT0009','C-bay Storage Container Set', 19.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00010','C-bay Knife Set', 16.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00011','C-bay Spoon Set', 9.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00012','C-bay Cast Iron Skillet', 13.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00013','C-bay Heater', 29.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00014','C-bay Air Conditioner', 174.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00015','C-bay Fan', 14.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00016','C-bay Kitchen Cart', 12.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00017','C-bay Coffee Table', 134.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00018','C-bay Body Wash', 5.23 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00019','C-bay Shampoo and Conditioner', 4.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00020','C-bay Dry Bath Towel', 14.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00021','C-bay Curtain Rod', 14.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00022','C-bay Handwash', 2.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00023','C-bay Toilet Roll Pack', 14.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00024','C-bay Trash Bags 40 Count', 19.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00025','C-bay Laundry Detergent Pacs', 16.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00026','C-bay Storage Bags 300 count', 18.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00027','C-bay Razor', 14.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00028','C-bay Mop', 16.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00029','C-bay Paper Towels', 20.99 , 1000 );
INSERT INTO products (product_id, name , price ,availability) values ('CBAYPDT00030','C-bay Handsoap Liquid', 9.99 , 1000 );