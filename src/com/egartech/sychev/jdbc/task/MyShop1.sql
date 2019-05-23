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

INSERT INTO `permission` (`p_permission_id`, `p_permission_name`)
VALUES
(1, 'editor'),
(2, 'reading');


INSERT INTO `user` (`u_user_id`, `u_user_login`, `u_user_password`)
VALUES
(1, 'JecEA',' 45gh34j'),
(2, 'PetrovS',' fjgk450'),
(3, 'Semcov93','594kjf324'),
(4, 'login','590324'),
(5, 'ivanov32','346213');



INSERT INTO `role` (`r_role_id`,`r_role_name`, `p_permission_id`, `u_user_id`)
VALUES
(1, 'admin' ,1, 1),
(2, 'admin' ,1 , 2),
(3, 'user'  ,2, 3),
(4, 'user'  ,2 ,4),
(5, 'user' ,2 , 5);



INSERT INTO `deliverytype` (`d_deliverytype_id`, `d_deliverytype_name`)
VALUES
(1, 'pickup'),
(2, 'home_delivery');

INSERT INTO `basket` (`b_basket_id`, `u_user_id`)
VALUES
(1, 1),
(2, 2);

INSERT INTO `order` (`o_order_id`, `u_user_id`, `d_deliverytype_id`, `p_price_product`, `o_quantity`, `o_order_date`)
VALUES
(1,1,1, 14,  14,'2019-01-12'),
(2,2,2 , 51, 14, '2019-04-12'),
(3,3,1, 15, 14,'2018-01-12'),
(4,4,2 , 34, 14,'2019-02-12'),
(5,5,2 , 24, 14,'2017-01-12'),
(6,2,1 , 25, 14,'2019-03-12');



INSERT INTO `product` (`p_product_id`, `p_product_name`, `p_price_product`)
VALUES
(1, 'Телефон', 32),
(2, 'Пылесос ', 56),
(3, 'Газовая плита', 64),
(4, 'Кухонный комбайн', 15),
(5, 'Вытяжка кухонная',10);

INSERT INTO `m2m_product_order` (`m2m_product_order_id`,`p_product_id`,`o_order_id`)
VALUES
(1,1, 1),
(2,2, 2),
(3,3, 3),
(4,4, 4),
(5,5, 5),
(6,5, 6);


INSERT INTO `m2m_product_basket` (`m2m_product_basket_id`,`p_product_id`,`b_basket_id`)
VALUES
(1,1, 1),
(2,2, 1),
(3,3, 2),
(4,4, 2),
(5,5, 2),
(6,1, 2);





