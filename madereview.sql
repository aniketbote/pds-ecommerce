Create table MadeReview(
	customer_id  varchar(16) not null,
	product_id varchar(16) not null,
    stars integer not null,
	review text,
	foreign key(Customer_id ) references Customers(customer_id),
	foreign key(product_id) references Products(product_id)
);
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('542778', 'CBAYPDT0001', 4, "Exactly what I was looking for");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('807336', 'CBAYPDT0002', 2, "Not worth the price");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('770430', 'CBAYPDT0002', 1, "Quality feels cheap");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('525285', 'CBAYPDT0004', 2, "The bedframe broke during the first week. Never buying this again");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('532186', 'CBAYPDT0004', 1, "Not worth spending your money on this trash");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('372023', 'CBAYPDT0004', 1, "Didn't even last a month, broke in the second week");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('836535', 'CBAYPDT0005', 3, "Clean and easy to wash and stay wrinkle free");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('372023', 'CBAYPDT0005', 3, "You get what you pay for.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('696323', 'CBAYPDT0005', 4, "Looks amazing. Guests take notice of my bed sheets.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('724131', 'CBAYPDT0007', 3, "The glasses look amazing but are very easy to break.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('804227', 'CBAYPDT0008', 4, "Really compliments my other kitchen ware");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('685032', 'CBAYPDT0008', 5, "Doesn't break easily and designs are awesome!!! Will buy again.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('495114', 'CBAYPDT0011', 4, "The spoons are sufficiently strong and don't loose shine");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('294197', 'CBAYPDT0012', 5, "Awesome!!!");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('731585', 'CBAYPDT0013', 3, "Not exactly for new york weather"); 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('507465', 'CBAYPDT0013', 3, "It is okay!"); 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('579944', 'CBAYPDT0013', 4, "Works perfectly for me!");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('610746', 'CBAYPDT0014', 2, "Makes a lot of noise -.-");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('715915', 'CBAYPDT0014', 2, "Doesn't work for even mid sized rooms.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('807336', 'CBAYPDT0015', 5, "Better than it's competitors");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('342623', 'CBAYPDT0015', 5, "I am a fan of this fan. Pun intended! :)");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('223825', 'CBAYPDT0019', 5, "Never had a problem");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('811096', 'CBAYPDT0019', 4, "Makes my hair silky and dandruff free");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('894432', 'CBAYPDT0019', 4, "So much for such a little price");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('710936', 'CBAYPDT0019', 3, "I wish I had bought this earlier");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('155199', 'CBAYPDT0021', 5, "Sturdy and easy to install.");

'CBAYPDT00022': {663494: 5, 968675: 3, 223825: 2, 579944: 1}, 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('663494', 'CBAYPDT0022', 5, "Smells so nice.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('968675', 'CBAYPDT0022', 4, "I like the smell.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('223825', 'CBAYPDT0022', 4, "Smells amazing");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('579944', 'CBAYPDT0022', 3, "I don't like this smell particulary, but it is not bad either.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('884910', 'CBAYPDT0023', 2, "Too small and thin.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('297857', 'CBAYPDT0023', 1, "Don't buy this product. The one at the costco is half the price and does a better job than this.");

'CBAYPDT00025': {115679: 5, 542778: 5, 140906: 1, 785242: 3}
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('115679', 'CBAYPDT0025', 5, "Works amazing, the clothes have never been clearer.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('542778', 'CBAYPDT0025', 5, "Works as mentioned.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('140906', 'CBAYPDT0025', 4, "This is probably the best one out there");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('785242', 'CBAYPDT0025', 5, "Amazing!");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('542778', 'CBAYPDT0027', 1, "Had a lot of cuts while using this. Total waste of money");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('699506', 'CBAYPDT0027', 4, "Works just fine."); 
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('181479', 'CBAYPDT0028', 5, "This is my go to place when it comes to buying mops.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('190194', 'CBAYPDT0028', 4, "Better than swiffer.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('280203', 'CBAYPDT0028', 3, "Works fine I guess.");
INSERT INTO MadeReview (customer_id, product_id, stars, review) 
values ('811096', 'CBAYPDT0028', 4, "No need to look anywhere else when you have this.");
