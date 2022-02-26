use jdbc_demo;
create table if not exists `supplier`(
`SUPP_ID` int primary key,
`SUPP_NAME` varchar(50) ,
`SUPP_CITY` varchar(50),
`SUPP_PHONE` varchar(10)
);
CREATE TABLE IF NOT EXISTS `customer` (
  `CUS_ID` INT NOT NULL,
  `CUS_NAME` VARCHAR(20) NULL DEFAULT NULL,
  `CUS_PHONE` VARCHAR(10),
  `CUS_CITY` varchar(30) ,
  `CUS_GENDER` CHAR,
  PRIMARY KEY (`CUS_ID`));
  CREATE TABLE IF NOT EXISTS `category` (
  `CAT_ID` INT NOT NULL,
  `CAT_NAME` VARCHAR(20) NULL DEFAULT NULL,
 
  PRIMARY KEY (`CAT_ID`)
  );
  CREATE TABLE IF NOT EXISTS `product` (
  `PRO_ID` INT NOT NULL,
  `PRO_NAME` VARCHAR(20) NULL DEFAULT NULL,
  `PRO_DESC` VARCHAR(60) NULL DEFAULT NULL,
  `CAT_ID` INT NOT NULL,
  PRIMARY KEY (`PRO_ID`),
  FOREIGN KEY (`CAT_ID`) REFERENCES CATEGORY (`CAT_ID`)
  
  );
  
  CREATE TABLE IF NOT EXISTS `product_details` (
  `PROD_ID` INT NOT NULL,
  `PRO_ID` INT NOT NULL,
  `SUPP_ID` INT NOT NULL,
  `PROD_PRICE` INT NOT NULL,
  PRIMARY KEY (`PROD_ID`),
  FOREIGN KEY (`PRO_ID`) REFERENCES PRODUCT (`PRO_ID`),
  FOREIGN KEY (`SUPP_ID`) REFERENCES SUPPLIER(`SUPP_ID`)
  
  );

CREATE TABLE IF NOT EXISTS `order` (
  `ORD_ID` INT NOT NULL,
  `ORD_AMOUNT` INT NOT NULL,
  `ORD_DATE` DATE,
  `CUS_ID` INT NOT NULL,
  `PROD_ID` INT NOT NULL,
  PRIMARY KEY (`ORD_ID`),
  FOREIGN KEY (`CUS_ID`) REFERENCES CUSTOMER(`CUS_ID`),
  FOREIGN KEY (`PROD_ID`) REFERENCES PRODUCT_DETAILS(`PROD_ID`)
  );
  
  CREATE TABLE IF NOT EXISTS `rating` (
  `RAT_ID` INT NOT NULL,
  `CUS_ID` INT NOT NULL,
  `SUPP_ID` INT NOT NULL,
  `RAT_RATSTARS` INT NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  FOREIGN KEY (`SUPP_ID`) REFERENCES SUPPLIER (`SUPP_ID`),
  FOREIGN KEY (`CUS_ID`) REFERENCES CUSTOMER(`CUS_ID`)
  );
  
insert into `supplier` values(1,"Rajesh Retails","Delhi",'1234567890');
insert into `supplier` values(2,"Appario Ltd.","Mumbai",'2589631470');
insert into `supplier` values(3,"Knome products","Banglore",'9785462315');
insert into `supplier` values(4,"Bansal Retails","Kochi",'8975463285');
insert into `supplier` values(5,"Mittal Ltd.","Lucknow",'7898456532');
INSERT INTO `CUSTOMER` VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO `CUSTOMER` VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO `CUSTOMER` VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO `CUSTOMER` VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO `CUSTOMER` VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
INSERT INTO `CATEGORY` VALUES( 1,"BOOKS");
INSERT INTO `CATEGORY` VALUES(2,"GAMES");
INSERT INTO `CATEGORY` VALUES(3,"GROCERIES");
INSERT INTO `CATEGORY` VALUES (4,"ELECTRONICS");
INSERT INTO `CATEGORY` VALUES(5,"CLOTHES");
INSERT INTO `PRODUCT` VALUES(1,"GTA V","DFJDJFDJFDJFDJFJF",2);
INSERT INTO `PRODUCT` VALUES(2,"TSHIRT","DFDFJDFJDKFD",5);
INSERT INTO `PRODUCT` VALUES(3,"ROG LAPTOP","DFNTTNTNTERND",4);
INSERT INTO `PRODUCT` VALUES(4,"OATS","REURENTBTOTH",3);
INSERT INTO `PRODUCT` VALUES(5,"HARRY POTTER","NBEMCTHTJTH",1);
INSERT INTO `ORDER` VALUES (50,2000,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(20,1500,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(25,30500,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(26,2000,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(30,3500,"2021-08-16",4,3);
INSERT INTO `RATING` VALUES(1,2,2,4);
INSERT INTO `RATING` VALUES(2,3,4,3);
INSERT INTO `RATING` VALUES(3,5,1,5);
INSERT INTO `RATING` VALUES(4,1,3,2);
INSERT INTO `RATING` VALUES(5,4,5,4);
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `ORDER` VALUES (50,2000,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(20,1500,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(25,30500,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(26,2000,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(30,3500,"2021-08-16",4,3);
INSERT INTO `PRODUCT_DETALIS` VALUES  ('1', '1', '2', ' 1500');
insert into `PRODUCT_DETALIS`  VALUES  ('2', '3', '5', ' 30000');
insert into `PRODUCT_DETALIS`  VALUES  ('3', '5', '1', ' 3000');
insert into `PRODUCT_DETALIS`  VALUES  ('4', '2', '3', ' 2500');
insert into `PRODUCT_DETALIS`  VALUES  ('5', '4', '1', ' 1000');
select * from product_details;
INSERT INTO `PRODUCT_DETALIS`  VALUES  ('5', '4', '1', ' 1000');
insert into `PRODUCT_DETALIS`  VALUES  ('3', '5', '1', ' 3000');

CREATE TABLE IF NOT EXISTS `product_details` (
  `PROD_ID` INT NOT NULL,
  `PRO_ID` INT NOT NULL,
  `SUPP_ID` INT NOT NULL,
  `PROD_PRICE` INT NOT NULL,
  PRIMARY KEY (`PROD_ID`),
  FOREIGN KEY (`PRO_ID`) REFERENCES PRODUCT (`PRO_ID`),
  FOREIGN KEY (`SUPP_ID`) REFERENCES SUPPLIER(`SUPP_ID`)
  
  );
  SET FOREIGN_KEY_CHECKS=0;
  
INSERT INTO `product_details` VALUES  ('1', '1', '2', ' 1500');
insert into `product_details`  VALUES  ('2', '3', '5', ' 30000');
insert into `product_details`  VALUES  ('3', '5', '1', ' 3000');
insert into `product_details`  VALUES  ('4', '2', '3', ' 2500');
insert into `product_details`  VALUES  ('5', '4', '1', ' 1000');
SELECT customer.CUS_GENDER, count(customer.CUS_GENDER) as count from customer INNER JOIN `ORDER` ON customer.CUS_ID=`ORDER`.CUS_ID where `ORDER`.ord_amount>=3000 GROUP BY customer.CUS_GENDER;
select `ORDER`.*, product.pro_name from `ORDER`, product_details, product where `ORDER`.CUS_ID=2 AND `ORDER`.prod_Id=product_details.prod_id AND product_details.prod_id=product.pro_id;
SELECT supplier.* from supplier, product_details where supplier.supp_ID IN(select product_details.supp_ID from product_details group by product_details.supp_ID having count(product_details.supp_ID)>1) group by supplier.supp_ID;   
select category.* from `ORDER` inner join product_details on `ORDER`.prod_id=product_details.prod_id inner join product on product.pro_id=product_details.pro_id inner join category on category.cat_id=product.cat_id having min(`ORDER`.ord_amount);
select product.PRO_ID, product.PRO_NAME from `ORDER` inner join `product_details` ON product_details.PROD_ID=`ORDER`.PROD_ID inner join product ON product.PRO_ID=product_details.pro_id where `ORDER`.ORD_DATE>"2021-10-05";
Select  CUS_NAME, CUS_GENDER from customer where customer.CUS_NAME LIKE 'A%' OR customer.CUS_NAME LIKE '%A' ;
select supplier.SUPP_ID,supplier.SUPP_NAME,`RATING`.RAT_RATSTARS,
CASE
WHEN `RATING`.RAT_RATSTARS>4 THEN 'Genuine Supplier'
WHEN `RATING`.RAT_RATSTARS>2 THEN 'Average Supplier'
ELSE 'Supplier should not be considered'
END AS Verdict FROM `RATING`INNER JOIN supplier ON supplier.SUPP_ID=`RATING`.SUPP_ID;

call proc1();
SET FOREIGN_KEY_CHECKS=1;
SET GLOBAL FOREIGN_KEY_CHECKS=1;

