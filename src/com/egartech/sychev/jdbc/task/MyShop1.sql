create database myshop;
/* Create Tables */



use myshop;
CREATE TABLE `permission`
(
	`p_permission_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`p_permission_name` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_permission` PRIMARY KEY (`p_permission_id`)
)

;




CREATE TABLE `user`
(
	`u_user_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`u_user_login` VARCHAR(150) NOT NULL,
    `u_user_password` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_user` PRIMARY KEY (`u_user_id`)
)

;

CREATE TABLE `role`
(
	`r_role_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`r_role_name` VARCHAR(150) NOT NULL,
    `p_permission_id` INTEGER UNSIGNED NOT NULL,
	`u_user_id` INTEGER UNSIGNED NOT NULL,
	CONSTRAINT `PK_role` PRIMARY KEY (`r_role_id`),
    FOREIGN KEY (p_permission_id) REFERENCES permission(p_permission_id) ON DELETE Cascade ON UPDATE Cascade, 
    FOREIGN KEY (u_user_id) REFERENCES  user(u_user_id) ON DELETE Cascade ON UPDATE Cascade
)

;

CREATE TABLE `deliverytype`
(
	`d_deliverytype_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`d_deliverytype_name` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_deliverytype` PRIMARY KEY (`d_deliverytype_id`)
)

;

CREATE TABLE `basket`
(
	`b_basket_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`u_user_id` INTEGER UNSIGNED NOT NULL,
	CONSTRAINT `PK_basket` PRIMARY KEY (`b_basket_id`),
     FOREIGN KEY (u_user_id) REFERENCES  user(u_user_id) ON DELETE Cascade ON UPDATE Cascade
)

;

CREATE TABLE `order`
(
	`o_order_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`u_user_id` INTEGER UNSIGNED NOT NULL,
    `d_deliverytype_id` INTEGER UNSIGNED NOT NULL,
	`p_price_product` int NOT NULL, 
    `o_quantity` int NOT NULL, 
	`o_order_date` DATE NOT NULL,
	CONSTRAINT `PK_order` PRIMARY KEY (`o_order_id`),
     FOREIGN KEY (u_user_id) REFERENCES  user(u_user_id) ON DELETE Cascade ON UPDATE Cascade,
	FOREIGN KEY (d_deliverytype_id) REFERENCES  deliverytype(d_deliverytype_id) ON DELETE Cascade ON UPDATE Cascade
)

;

CREATE TABLE `product`
(
	`p_product_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`p_product_name` VARCHAR(150) NOT NULL,
    `p_price_product` int NOT NULL, 
	CONSTRAINT `PK_product` PRIMARY KEY (`p_product_id`)
	
)

;
CREATE TABLE `m2m_product_order`
(
	`m2m_product_order_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`p_product_id` INTEGER UNSIGNED NOT NULL,
	`o_order_id` INTEGER UNSIGNED NOT NULL,
	CONSTRAINT `PK_m2m_product_order` PRIMARY KEY (`m2m_product_order_id`),
     FOREIGN KEY (p_product_id) REFERENCES  product(p_product_id) ON DELETE Cascade ON UPDATE Cascade,
	FOREIGN KEY (o_order_id) REFERENCES  `order` (o_order_id) ON DELETE Cascade ON UPDATE Cascade
)

;
CREATE TABLE `m2m_product_basket`
(
	`m2m_product_basket_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`p_product_id` INTEGER UNSIGNED NOT NULL,
	`b_basket_id` INTEGER UNSIGNED NOT NULL,
	CONSTRAINT `PK_m2m_product_basket` PRIMARY KEY (`m2m_product_basket_id`),
	FOREIGN KEY (p_product_id) REFERENCES  product(p_product_id) ON DELETE Cascade ON UPDATE Cascade,
	FOREIGN KEY (b_basket_id) REFERENCES  basket(b_basket_id) ON DELETE Cascade ON UPDATE Cascade
)

;







