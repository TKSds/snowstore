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
   password VARCHAR(100),
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

-- the cart line table to store the cart details

CREATE TABLE cart_line(
	id SERIAL,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_cart_id FOREIGN KEY (cart_id) REFERENCES cart(id),
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
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
VALUES ('Sebastian', 'Dobrea', 'ADMIN', true, '$2y$12$zUL06Ol4vEEQfK9WN0s2WO3/K29x.RchvsMkDT/JlABGe5GJjMAw.', 'ds@gmail.com', '0726332705');

INSERT INTO user_detail (first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Jake', 'Burton', 'SUPPLIER', true, '$2y$12$b/9.enc9yLyGEALtCv19SeDvQNdIEIGUYywBNRTIwijXzsHQzv7AG', 'jakeb@burtonsnowboards.com', '0344566777');

INSERT INTO user_detail(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Mike', 'Olson', 'SUPPLIER', true, '$2y$12$OqFO2ldaqWC6Bv3NXfsIIu1fB6u6v22g3M2rZ02eRqic32FI72E1m', 'mikeo@bluetomato.com', '4031256789');

INSERT INTO user_detail(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Marius', 'George', 'SUPPLIER', true, '$2y$12$BEuEt3m1eJsF.1bqWrkycewBoVV66zxcGzrutFxWhI9DzLpQ/TWMi', 'mg@funride.ro', '0733669339');

INSERT INTO user_detail(first_name, last_name, role, enabled, password, email, contact_number)
VALUES ('Andrei', 'Ion', 'USER', true, '$2y$12$pzSjPdhQbmd6jHrERZwYKeV7BsiK4wg2X1BHiSG/8aGM2VJ9dAokK', 'andreion@gmail.com', '0747314248');



-- add products

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD90A9D4E295', 'Burton Process Flying V', 'Burton', 'One of the best boards from Burton', 500, 10, true, 1, 4, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDF005A113B6', 'Rome Mountain Division', 'Rome', 'Best of a Board. Ride the buck, be the buck', 650, 5, true, 1, 4, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDC588840157', 'Dragon NFX2', 'Dragon', 'Dragon description', 170, 8, true, 5, 4, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDCEF46ED887', 'Union Force', 'Union', 'Union description', 250, 15, true, 2, 4, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRD8266379E64', 'Burton Ion Boa', 'Burton', 'Burton Ion Boa description', 300, 6, true, 3, 4, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES('PRD096BE55DC1', 'Rossignol Distrikt 2019', 'Rossignol', 'Rossignol board description', 300, 4, true, 1, 4, 0, 0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES('PRDC04AA7FE3F', 'Quicksilver Helmet', 'Quicksilver', 'Quciksilver description', 150, 6, true, 6, 5, 0, 0);

-- add addresses

INSERT INTO address(user_id, address_line_one, address_line_two, is_billing, city, country, postal_code, is_shipping, state)
VALUES(1, Str. Mihai Bravu nr 196, Str Erou Grigore Nicolae, true, Bucharest, Romania, 105600, false, Bucharest);