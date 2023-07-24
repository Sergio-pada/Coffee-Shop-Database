CREATE TABLE Coffee_Shop(
	shop_id INTEGER, 
    shop_name VARCHAR(30),
    city VARCHAR(30),
    state CHAR(2),
	PRIMARY KEY(shop_id)
);

CREATE TABLE Employee( 
  emp_id INTEGER,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  hire_date DATE,
  job_title VARCHAR(30),
  shop_id INTEGER,
  FOREIGN KEY(shop_id) REFERENCES Coffee_Shop(shop_id),
  PRIMARY KEY(emp_id)
);

CREATE TABLE Supplier(
  supplier_id INTEGER,
  company_name VARCHAR(50),
  country VARCHAR(30),
  sales_contact_name VARCHAR(60),
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY(supplier_id)
);

CREATE TABLE Coffee( 
  coffee_id INTEGER,
  shop_id INTEGER,
  supplier_id INTEGER,
  coffee_name VARCHAR(30),
  price_per_pound NUMERIC(5,2), 
  PRIMARY KEY(coffee_id),
  FOREIGN KEY(shop_id) REFERENCES Coffee_Shop(shop_id),
  FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id)
);
 
INSERT INTO Coffee_Shop VALUES
	(1, 'Alberts Coffee Shop', 'Anchorage', 'AK'),
	(2, 'Courtneys Coffee Shop', 'Carlsbad', 'CA'),
	(3, 'Dereks Coffee Shop', 'Dover', 'DE');

INSERT INTO Employee VALUES
	(1, 'Albert', 'Aethelberry', '2001-01-01', 'Owner', 1),
	(2, 'Courtney', 'Coffee', '2002-02-02', 'Proprietor', 2),
	(3, 'Derek', 'Dougal', '2003-03-03', 'Squire', 3);

INSERT INTO Supplier VALUES
	(01, 'AJs Aromatics', 'Argentina', 'AJ', 'a.j.caol.com'),
	(02, 'Coreys Coffee Co', 'Canada', 'Corey', 'corey@icloud.com'),
    (03, 'Donnas Delectable Deliveries', 'Denmark', 'Donna', 'donna@donely.com')
;
    
INSERT INTO Coffee VALUES
	(1, 1, 1, 'AJs Arabica', 10.00),
	(2, 2, 2, 'Coreys Crazy Coffee', 20.00),
	(3, 3, 3, 'Donnas Decaf', 30.00);
    
CREATE VIEW view1 AS
SELECT emp_id, CONCAT(first_name, ' ', last_name) AS 'employee full name:', hire_date, job_title, shop_id
   FROM Employee;
   
CREATE INDEX coffeeindex ON Coffee(coffee_name);
