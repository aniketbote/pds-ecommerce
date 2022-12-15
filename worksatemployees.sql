Create table WorksAtEmployees(
	employee_id varchar(16) primary key,
	employee_name varchar(50) not null,
	employee_designation varchar(50) not null,
	employee_department varchar(50) not null, 
	warehouse_name varchar(50),
	warehouse_zipcode integer,
	foreign key(warehouse_name, warehouse_zipcode) references ShippedFromWarehouse(name, zipcode)
);
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