-- category table
CREATE TABLE category (
     
	 id SERIAL,
	 name VARCHAR(50),
	 description VARCHAR(255),
	 image_url VARCHAR(50),
	 is_active BOOLEAN,
	 
	 CONSTRAINT pk_category_id PRIMARY KEY(id)

);

-- product table

CREATE TABLE product (

   id SERIAL,
   code VARCHAR(20),
   name VARCHAR(50),
   brand VARCHAR(50),
   description VARCHAR(255),
   unit_price DECIMAL(10,2),
   quantity INT,
   is_active BOOLEAN,
   category_id INT,
   supplier_id INT,
   purchases INT DEFAULT 0,
   views INT DEFAULT 0,
   CONSTRAINT pk_product_id PRIMARY KEY(id),
   CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category(id),
   CONSTRAINT fk_prodcut_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id)

);

-- user detail table

CREATE TABLE user_detail (
     
   id SERIAL,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   role VARCHAR(50),
   enabled BOOLEAN,
   password VARCHAR(50),
   email VARCHAR(100),
   contact_number VARCHAR(15),
   CONSTRAINT pk_user_id PRIMARY KEY(id)
   
);

-- address table

CREATE TABLE address (

   id SERIAL,
   user_id int,
   address_line_one VARCHAR(100),
   address_line_two VARCHAR(100),
   city VARCHAR(20),
   state VARCHAR(20),
   country VARCHAR(20),
   postal_code VARCHAR(10),
   is_billing BOOLEAN,
   is_shipping BOOLEAN,
   CONSTRAINT fk_address_user_id FOREIGN KEY(user_id) REFERENCES user_detail (id),
   CONSTRAINT pk_address_id PRIMARY KEY(id)

);

-- the cart table to store the user cart top-level details

CREATE TABLE cart(

	id SERIAL,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)

);

-- add categories

INSERT INTO category (name, description, image_url, is_active) VALUES ('Snowboards', 'Snowboard category description', 'Snowboard_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Bindings', 'Binding category description', 'Bindings_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Boots', 'Boots category description', 'Boots_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Snow wear', 'Snow wear category description', 'Snowwear_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Goggles', 'Goggles category description', 'Goggles_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Helmets', 'Helments category description', 'Helmets_01.png', true);

-- insert into user_detail

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Sebastian', 'Dobrea', 'ADMIN', true, 'admin', 'ds@gmail.com', '0726332705');

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Jake', 'Burton', 'SUPPLIER', true, 'supplier', 'jakeb@burtonsnowboards.com', '0344566777');

INSERT INTO user_detail(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Mike', 'Olson', 'SUPPLIER', true, 'supplier', 'mikeo@bluetomato.com', '4031256789');

INSERT INTO user_detail(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Marius', 'George', 'SUPPLIER', true, 'supplier', 'mg@funride.ro', '0733669339');

INSERT INTO user_detail(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Andrei', 'Ion', 'USER', true, 'user', 'andreion@gmail.com', '0747314248');



-- add products

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDBRD001BRTN', 'Burton Process Flying V', 'Burton', 'One of the best boards from Burton', 500, 10, true, 1, 1, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDBRD002ROME', 'Rome Mountain Division', 'Rome', 'Best of a Board. Ride the buck, be the buck', 650, 5, true, 1, 2, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDGGLS001DRGN', 'Dragon NFX2', 'Dragon', 'Dragon description', 170, 8, true, 5, 3, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDBNDS001UNON', 'Union Force', 'Union', 'Union description', 250, 15, true, 2, 2, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDBTTS001BRTN', 'Burton Ion Boa', 'Burton', 'Burton Ion Boa description', 300, 6, true, 3, 1, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES('PRDRSSS001DSTR', 'Rossignol Distrikt 2019', 'Rossignol', 'Rossignol board description', 300, 4, true, 1, 3, 0, 0);