CREATE TABLE salesperson(
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	contact_num	VARCHAR(15),
	email VARCHAR(200)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	address VARCHAR(150),
	phone VARCHAR(15),
	email VARCHAR(200)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(150),
	address VARCHAR(150),
	phone VARCHAR(15),
	email VARCHAR(200)
);

-- I  did not think that we needed salesperson or customer in this table as Foreign Keys
CREATE TABLE car_inventory(
	serial_id SERIAL PRIMARY KEY,
	make VARCHAR(15),
	model VARCHAR(150)		  

);
	
CREATE TABLE sales_invoice(
	sales_id SERIAL PRIMARY KEY,
	amount NUMERIC(9,2),
	purchase_date DATE,
	serial_id INTEGER NOT NULL,
	staff_id INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(serial_id) REFERENCES car_inventory(serial_id),
	FOREIGN KEY(staff_id) REFERENCES salesperson(staff_id),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)	
);


-- I  did not think that we needed service_id in this table as a Foreign Key
 
CREATE TABLE parts(
	parts_id SERIAL PRIMARY KEY,
	part_type VARCHAR (100),
	part_price NUMERIC(6,2)
);


--typo in ERD the item_id should be parts_id.
--I added a car_inventory.serial_id as foreign key. I allowed it to be null because the customer
--might not have bought the car at this dealership

CREATE TABLE service_invoice(
	service_id SERIAL PRIMARY KEY,
	invoice_date DATE,
	amount NUMERIC(8,2),
	total_cost NUMERIC (10,2),
	description VARCHAR (500),
	customer_id INTEGER NOT NULL,
	parts_id INTEGER NOT NULL,
	serial_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(parts_id) REFERENCES parts(parts_id),
	FOREIGN KEY(serial_id) REFERENCES car_inventory(serial_id)
);

CREATE TABLE mechanic_record(
	record_id SERIAL PRIMARY KEY,
	service_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(service_id) REFERENCES service_invoice(service_id)	
);



--Insert data into tables

INSERT INTO customer(
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	'Phil',
	'Esposito',
	'123 Oak Dr Calgary AB T2S 5E4',
	'403-222-1234',
	'phil@gmail.com'	
);


INSERT INTO customer(
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	'Rocket',
	'Richard',
	'456 Elm Dr Calgary AB T2S 5E6',
	'403-222-4567',
	'rocket@gmail.com'	
);

INSERT INTO customer(
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	'Wayne',
	'Gretsky',
	'888 Pine Dr Calgary AB T2S 5E8',
	'403-222-8912',
	'wayne@gmail.com'	
);

INSERT INTO customer(
	first_name,
	last_name,
	address,
	phone,
	email
)
VALUES(
	'Bobby',
	'Orr',
	'777 Sruce Dr Calgary AB T2S 5E2',
	'403-222-3456',
	'bobby@gmail.com'	
);


INSERT INTO salesperson(
	first_name,
	last_name,	
	contact_num,
	email
)
VALUES(
	'Adam',
	'Ondra',	
	'403-222-1212',
	'adam@gmail.com'	
);

INSERT INTO salesperson(
	first_name,
	last_name,	
	contact_num,
	email
)
VALUES(
	'Margo',
	'Hayes',	
	'403-222-2323',
	'margo@gmail.com'	
);

INSERT INTO salesperson(
	first_name,
	last_name,	
	contact_num,
	email
)
VALUES(
	'Lynn',
	'Hill',	
	'403-222-3434',
	'lynn@gmail.com'	
);

INSERT INTO salesperson(
	first_name,
	last_name,	
	contact_num,
	email
)
VALUES(
	'Sarah',
	'Hueniken',	
	'403-222-5656',
	'sarah@gmail.com'	
);

select * from salesperson


INSERT INTO mechanic(
	first_name,
	last_name,	
	address,
	phone,
	email	
)
VALUES(
	'Walter',
	'Payton',	
	'456 Cascade Rd Canmore AB  T4R 1R3',
	'403-222-7878',
	'walter@gmail.com'
);

INSERT INTO mechanic(
	first_name,
	last_name,	
	address,
	phone,
	email
	
)
VALUES(
	'Mike',
	'Ditka',	
	'555 Rundle Rd Canmore AB  T4R 1L9',
	'403-222-7777',
	'mike@gmail.com'
);

INSERT INTO mechanic(
	first_name,
	last_name,	
	address,
	phone,
	email
	
)
VALUES(
	'Jim',
	'McMahon',	
	'555 Corey Rd Canmore AB  T4S 2L9',
	'403-222-8888',
	'jim@gmail.com'
);

INSERT INTO mechanic(
	first_name,
	last_name,	
	address,
	phone,
	email
	
)
VALUES(
	'Willie',
	'Gault',	
	'589 Castle Rd Canmore AB  T9S 2X9',
	'403-222-8965',
	'willie@gmail.com'
);

select * from mechanic;





INSERT INTO car_inventory(
	make,
	model
)
VALUES(
	'Subaru',
	'Crosstrek'
);

INSERT INTO car_inventory(
	make,
	model
)
VALUES(
	'Subaru',
	'Forrester'	
);

INSERT INTO car_inventory(
	make,
	model
)
VALUES(
	'Subaru',
	'Outback'
);

INSERT INTO car_inventory(
	make,
	model
)
VALUES(
	'Subaru',
	'Imprezza'
);
select * from car_inventory;




INSERT INTO parts(
	part_type,
	part_price
)
VALUES(
	'pistons',
	125.98
);

INSERT INTO parts(
	part_type,
	part_price
)
VALUES(
	'drive shaft',
	2569.98
);

INSERT INTO parts(
	part_type,
	part_price
)
VALUES(
	'head',
	1125.69
);

INSERT INTO parts(
	part_type,
	part_price
)
VALUES(
	'brake rotors',
	89.25
);

select * from parts;



INSERT INTO sales_invoice(
	amount,
	purchase_date,
	serial_id,
	staff_id,
	customer_id
)
VALUES(
	30000.00,
	'2020/08/01',
	1,
	1,
	4
);

INSERT INTO sales_invoice(
	amount,
	purchase_date,
	serial_id,
	staff_id,
	customer_id
)
VALUES(
	50000.00,
	'2020/08/07',
	2,
	4,
	5
);

INSERT INTO sales_invoice(
	amount,
	purchase_date,
	serial_id,
	staff_id,
	customer_id
)
VALUES(
	30000.00,
	'2020/08/01',
	3,
	3,
	6
);

INSERT INTO sales_invoice(
	amount,
	purchase_date,
	serial_id,
	staff_id,
	customer_id
)
VALUES(
	35000.00,
	'2020/08/05',
	2,
	4,
	7
);

select * from sales_invoice;




INSERT INTO service_invoice(
	invoice_date,
	amount,
	total_cost,
	description,
	customer_id,
	parts_id,
	serial_id
)
VALUES(
	'2020/08/05',
	100.00,
	120.00,
	'oil change and battery test',
	4,
	4,
	null
);

INSERT INTO service_invoice(
	invoice_date,
	amount,
	total_cost,
	description,
	customer_id,
	parts_id,
	serial_id
)
VALUES(
	'2020/08/01',
	3595.30,
	3865.25,
	'Replace drive shaft',
	5,
	2,
    1
);

ALTER TABLE service_invoice
ALTER COLUMN parts_id
DROP NOT NULL;


INSERT INTO service_invoice(
	invoice_date,
	amount,
	total_cost,
	description,
	customer_id,
	parts_id,
	serial_id
)
VALUES(
	'2020/08/04',
	95.00,
	105.00,
	'Test alternator',
	6,
	null,
   3
);

INSERT INTO service_invoice(
	invoice_date,
	amount,
	total_cost,
	description,
	customer_id,
	parts_id,
	serial_id
)
VALUES(
	'2020/08/07',
	2358.29,
	2958.14,
	'Replace head and gaskets',
	7,
	3,
    2
);

select * from service_invoice;



INSERT INTO mechanic_record(
	service_id,
	mechanic_id
)
VALUES(
	1,
	4
);

INSERT INTO mechanic_record(
	service_id,
	mechanic_id
)
VALUES(
	4,
	4
);

INSERT INTO mechanic_record(
	service_id,
	mechanic_id
)
VALUES(
	2,
	1
);

INSERT INTO mechanic_record(
	service_id,
	mechanic_id
)
VALUES(
	5,
	2
);

