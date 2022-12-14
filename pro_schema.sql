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

Create table Products(
    product_id varchar(16) primary key,
    name varchar(50) not null,
    price real not null,
    availability integer not null
);

--date format : yyyy-mm-dd
create table Coupons(
    coupon_id varchar(16) primary key,
    name varchar(16) not null,
    discount real not null
);

Create table MadeReview(
  customer_id  varchar(16) not null,
  product_id varchar(16) not null,
  stars integer not null,
  review text,
  primary key(customer_id, product_id)
  foreign key(Customer_id ) references Customers(customer_id),
  foreign key(product_id) references Products(product_id)
);

Create table WorksAtEmployees(
	employee_id varchar(16) primary key,
	employee_name varchar(50) not null,
	employee_designation varchar(50) not null,
	employee_department varchar(50) not null, 
	warehouse_name varchar(50),
	warehouse_zipcode integer,
	foreign key(warehouse_name, warehouse_zipcode) references ShippedFromWarehouse(name, zipcode)
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





INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('542778', 'CBAYPDT0001', 4, 'Exactly what I was looking for');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('807336', 'CBAYPDT0002', 2, 'Not worth the price');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('770430', 'CBAYPDT0002', 1, 'Quality feels cheap');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('525285', 'CBAYPDT0004', 2, 'The bedframe broke during the first week. Never buying this again');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('532186', 'CBAYPDT0004', 1, 'Not worth spending your money on this trash');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('372023', 'CBAYPDT0004', 1, 'Didnt even last a month, broke in the second week');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('836535', 'CBAYPDT0005', 3, 'Clean and easy to wash and stay wrinkle free');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('372023', 'CBAYPDT0005', 3, 'You get what you pay for.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('696323', 'CBAYPDT0005', 4, 'Looks amazing. Guests take notice of my bed sheets.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('724131', 'CBAYPDT0007', 3, 'The glasses look amazing but are very easy to break.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('804227', 'CBAYPDT0008', 4, 'Really compliments my other kitchen ware');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('685032', 'CBAYPDT0008', 5, 'Does not break easily and designs are awesome!!! Will buy again.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('495114', 'CBAYPDT0011', 4, 'The spoons are sufficiently strong and do not loose shine');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('294197', 'CBAYPDT0012', 5, 'Awesome!!!');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('731585', 'CBAYPDT0013', 3, 'Not exactly for new york weather'); 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('507465', 'CBAYPDT0013', 3, 'It is okay!'); 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('579944', 'CBAYPDT0013', 4, 'Works perfectly for me!');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('610746', 'CBAYPDT0014', 2, 'Makes a lot of noise -.-');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('715915', 'CBAYPDT0014', 2, 'Does not work for even mid sized rooms.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('807336', 'CBAYPDT0015', 5, 'Better than its competitors');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('342623', 'CBAYPDT0015', 5, 'I am a fan of this fan. Pun intended! :)');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('223825', 'CBAYPDT0019', 5, 'Never had a problem');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('811096', 'CBAYPDT0019', 4, 'Makes my hair silky and dandruff free');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('894432', 'CBAYPDT0019', 4, 'So much for such a little price');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('710936', 'CBAYPDT0019', 3, 'I wish I had bought this earlier');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('155199', 'CBAYPDT0021', 5, 'Sturdy and easy to install.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('663494', 'CBAYPDT0022', 5, 'Smells so nice.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('968675', 'CBAYPDT0022', 4, 'I like the smell.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('223825', 'CBAYPDT0022', 4, 'Smells amazing');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('579944', 'CBAYPDT0022', 3, 'I do not like this smell particulary, but it is not bad either.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('884910', 'CBAYPDT0023', 2, 'Too small and thin.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('297857', 'CBAYPDT0023', 1, 'Do not buy this product. The one at the costco is half the price and does a better job than this.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('115679', 'CBAYPDT0025', 5, 'Works amazing, the clothes have never been clearer.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('542778', 'CBAYPDT0025', 5, 'Works as mentioned.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('140906', 'CBAYPDT0025', 4, 'This is probably the best one out there');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('785242', 'CBAYPDT0025', 5, 'Amazing!');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('542778', 'CBAYPDT0027', 1, 'Had a lot of cuts while using this. Total waste of money');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('699506', 'CBAYPDT0027', 4, 'Works just fine.'); 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('181479', 'CBAYPDT0028', 5, 'This is my go to place when it comes to buying mops.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('190194', 'CBAYPDT0028', 4, 'Better than swiffer.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('280203', 'CBAYPDT0028', 3, 'Works fine I guess.');
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('811096', 'CBAYPDT0028', 4, 'No need to look anywhere else when you have this.');

INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00001','Nicola Oliver','Worker','receiving','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00002','Jason Rees','Worker','receiving','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00003','Natalie Jones','Worker','receiving','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00004','Harry Avery','Worker','receiving','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00005','Adrian Paige','Worker','putaway','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00006','Cameron King','Worker','putaway','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00007','Joe Forsyth','Worker','putaway','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00008','Penelope Ellison','Worker','putaway','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP00009','Sarah Edmunds','Worker','storage','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000010','Jane Jackson','Worker','storage','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000011','Mary Mitchell','Worker','storage','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000012','Alexandra Langdon','Worker','storage','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000013','Diane Edmunds','Worker','picking','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000014','Peter Welch','Worker','picking','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000015','Jake Roberts','Worker','picking','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000016','Brian Hughes','Worker','picking','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000017','Katherine Sanderson','Worker','packing','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000018','Ryan Peake','Worker','packing','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000019','Frank Parsons','Worker','packing','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000020','Stephen Powell','Worker','packing','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000021','Rose Sanderson','Worker','shipping','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000022','Luke Bower','Worker','shipping','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000023','Jack Henderson','Worker','shipping','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000024','Chloe Lyman','Worker','shipping','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000025','Abigail Lee','SuperVisor','Supervision','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000026','Zoe Howard','SuperVisor','Supervision','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000027','Virginia Reid','SuperVisor','Supervision','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000028','Nathan King','SuperVisor','Supervision','C-bay Warehouse1', 90040);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000029','David Henderson','Manager','Management','C-bay Warehouse2', 10018);
INSERT INTO WorksAtEmployees (employee_id, employee_name, employee_designation, employee_department, warehouse_name, warehouse_zipcode) 
values ('CBAYEMP000030','Blake Metcalfe','Manager','Management','C-bay Warehouse1', 90040);