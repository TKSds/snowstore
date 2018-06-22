CREATE TABLE category (
     
	 id SERIAL,
	 name VARCHAR(50),
	 description VARCHAR(255),
	 image_url VARCHAR(50),
	 is_active BOOLEAN,
	 
	 CONSTRAINT pk_category_id PRIMARY KEY(id)

);

INSERT INTO category (name, description, image_url, is_active) VALUES ('Snowboards', 'Snowboard category description', 'Snowboard_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Bindings', 'Binding category description', 'Bindings_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Boots', 'Boots category description', 'Boots_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Snow wear', 'Snow wear category description', 'Snowwear_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Goggles', 'Goggles category description', 'Goggles_01.png', true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Helmets', 'Helments category description', 'Helmets_01.png', true);
