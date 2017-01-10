DROP DATABASE IF EXISTS shoestore;
create database shoestore;
use shoestore;

#tables for admin

create table admin
(
	admin_Id char(5) NOT NULL,
	admin_Pwd varchar(10) NOT NULL,
	primary key(admin_Id)
	
);


#tables for shoes
#USE THESE FOR ALL TABLES; ALL PRIMARY KEYS CHAR(5), 


create table brand
(
	brand_Id char(5),
	brand_Name varchar(30) NOT NULL,
	primary key(brand_Id)
);

create table categories
(
	category_Id char(5),
	category_Name varchar(30) NOT NULL,
	primary key(category_Id)
);


create table shoes 						#table for shoes and maintains as it is a one to many relation along with brand table and categories
(
	admin_Id char(5),
	brand_Id char(5) NOT NULL,
	shoe_Id char(5) NOT NULL,
	shoe_Img BLOB NOT NULL,
	category_Id char(5) NOT NULL,
	cost decimal(6,2) NOT NULL,
	primary key(shoe_Id),
	foreign  key(admin_Id) references admin(admin_Id),
	foreign  key(brand_Id) references brand(brand_Id),
	foreign  key(category_Id) references categories(category_Id)
);


create table gender
(
gender_id char(10) NOT NULL,
primary key (gender_id)
);


create table color
(
	color_Id char(5),
	color_Name varchar(15) NOT NULL,
	primary key(color_Id)
	
);

create table size
(
	size_Number float(5,1) NOT NULL,
	shoe_Id char(5) NOT NULL,
	primary key (size_Number,shoe_Id),
	foreign key (shoe_Id) references shoes(shoe_Id)	
	
);

create table sale
(
	discount decimal(9,9) NOT NULL,
	sale_Id char(5) NOT NULL,
	primary key(sale_Id) 
							
);

create table customer
(
	id int(11) NOT NULL AUTO_INCREMENT,
	dob date NOT NULL,
	first_name varchar(30) NOT NULL,
	middle_name varchar(30),
	last_name varchar(30) NOT NULL,
	gender varchar(6) NOT NULL,
	password varchar(8) NOT NULL,
	emailId varchar(40) NOT NULL,
	registeredDate date NOT NULL,
	primary key (id)
);


create table phonenumber
(
	ph_no bigint(13) NOT NULL,
	cust_Id int(11) NOT NULL,
	primary key(ph_no, cust_Id),
	foreign key(cust_Id) references customer(id)
	ON DELETE CASCADE
);

create table address
(
	address varchar(200) NOT NULL,
	cust_Id int NOT NULL,
	type varchar(20) NOT NULL,
	foreign key(cust_Id) references customer (id)
	ON DELETE CASCADE
);

create table orders
(
	order_Id char(5) NOT NULL,
	cust_Id int NOT NULL,
	orderdate date NOT NULL,
	quantity int NOT NULL,
	Review decimal(4,2) NOT NULL,
	totalcost decimal(6,2) NOT NULL,
	primary key(order_Id, cust_Id),
	foreign key(cust_Id) references customer (id)
);


create table alsohasorderhistory
(
	order_Id int(10) NOT NULL AUTO_INCREMENT,
	cust_Id int NOT NULL,
	orderdate date NOT NULL,
	shoe_Id char(5) NOT NULL,
	quantity int NOT NULL,
	Review decimal(4,2) NOT NULL,
	totalcost decimal(6,2) NOT NULL,
	primary key(order_Id),
	foreign key(cust_Id) references customer (id)	
);

create table mightforgotpassword
(
	cust_Id int NOT NULL,
	emailId varchar(40) NOT NULL,
	newpwd varchar(8),
	primary key (cust_Id),
	foreign key(cust_Id) references customer (id)
);

create table hascarddetails
(
	cust_Id int NOT NULL,
	card_no bigint(16) NOT NULL,
	nameoncard varchar(60) NOT NULL,
	exp_date date NOT NULL,
	primary key(cust_Id, card_no),
	foreign key(cust_Id) references customer (id)
);
	

#Tables for relations areof,havea,alsohas,go_on,contains,shop

create table shoe_gender(
gender_id char(10) NOT NULL,
shoe_id char(10) NOT NULL,
primary key (gender_id,shoe_id),
foreign key (gender_id) references gender (gender_id),
foreign key (shoe_id) references shoes(shoe_id)
);


create table shoesareofcolor
(
color_Id char(5) NOT NULL,
shoe_Id char(5) NOT NULL,
primary key (color_Id,shoe_Id),
foreign  key(color_Id) references color(color_Id),
foreign  key(shoe_Id) references shoes(shoe_Id)
ON UPDATE CASCADE
);

# doubt
create table shoeshavesize
(
size_Number float(5,1) NOT NULL,
shoe_Id char(5) NOT NULL,
primary key (size_Number,shoe_Id),
foreign  key(size_Number) references size(size_Number),
foreign  key(shoe_Id) references shoes(shoe_Id)
ON UPDATE CASCADE
);
	

create table shops
(
shoe_Id char(5) NOT NULL,
cust_Id int NOT NULL,
primary key (shoe_Id,cust_Id),
foreign  key(shoe_Id) references shoes(shoe_Id),
foreign  key(cust_Id) references customer (id)
ON UPDATE CASCADE
);

create table shoesgoondeal
(
shoe_Id char(5) NOT NULL,
sale_Id char(5) NOT NULL,
primary key (shoe_Id,sale_Id),
foreign  key(shoe_Id) references shoes(shoe_Id),	
foreign  key(sale_Id) references sale(sale_Id)
ON UPDATE CASCADE
);

create table contains
(
shoe_Id char(5),
order_Id char(5),
primary key (shoe_Id,order_Id),
foreign  key(shoe_Id) references shoes(shoe_Id),
foreign  key(order_Id) references orders(order_Id)
ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `admindefinesfaqcategory` (
 
 `category_id` varchar(4) NOT NULL,
 
 `category_name` varchar(56) NOT NULL,
 
  `admin_Id` char(5),
 PRIMARY KEY (`category_id`,`admin_id`)
,
foreign  key(admin_id) references admin(admin_id)
);

CREATE TABLE IF NOT EXISTS `faqlist` (
`category_id` varchar(4) NOT NULL,
  
`faqid` varchar(4) NOT NULL,
 
 `question` varchar(56) NOT NULL,

  `Answer` varchar(456) NOT NULL,
 
 PRIMARY KEY (`category_id`,`faqid`),
foreign  key(category_id) references admindefinesfaqcategory(category_id)
); 


#cart
create table cart
(
    shoe_Img BLOB NOT NULL,
    shoe_Id char(5) NOT NULL,
    cust_Id int NOT NULL,
    brand_Name varchar(30) NOT NULL,
    color_Name varchar(15) NOT NULL,
    size_Number float(5,1) NOT NULL,
    discount decimal(9,9) NOT NULL,
    cost decimal(6,2) NOT NULL,
    cost_after_discount decimal(9,2) NOT NULL,
    #primary key (shoe_Id,cust_Id),
    foreign key(shoe_Id) references shoes(shoe_Id),
    foreign key(cust_Id) references customer (id)
);



/*********************************************************************************/

#admin
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg01', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg02', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg03', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg04', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg05', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg06', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg07', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg08', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg09', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg10', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg11', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg12', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg13', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg14', 'password');
INSERT INTO `shoestore`.`admin` (`admin_Id`, `admin_Pwd`) VALUES ('pg15', 'password');

#Brand
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Cr101', 'Croc');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Ad102', 'Addidas');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Re103', 'Reebok');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Fi104', 'Fila');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Ca105', 'Catwal');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd106', 'Prada');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd107', 'Prada2');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd108', 'Prada3');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd109', 'Prada4');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd110', 'Prada5');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd111', 'Prada6');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd112', 'Prada7');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd113', 'Prada8');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd114', 'Prada9');
INSERT INTO `shoestore`.`brand` (`brand_Id`, `brand_Name`) VALUES ('Pd115', 'Prada10');



#Categories

INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo101', 'Formals');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Ca102', 'Casuals');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Sn103', 'Sneakers');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo108', 'Kids Formals');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Lo104', 'Loafers');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo102', 'Mens Formals');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Bo105', 'Boots');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo103', 'Womans Formals');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fl106', 'Flats');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo104', 'Kids Flats');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('He107', 'Heels');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo105', 'Mens Flats');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Sp108', 'Sports');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo106', 'Womans Flats');
INSERT INTO `shoestore`.`categories` (`category_Id`, `category_Name`) VALUES ('Fo107', 'Kid Sports');



#Shoes

INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Ad102', '101', 's1.jpg', 'Sp108','40.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Cr101', '102', 's2.jpg', 'Ca102','50.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Fi104', '103', 's3.jpg', 'Sp108','60.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Re103', '104', 's4.jpg', 'Lo104','70.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Pd106', '105', 's5.jpg', 'Bo105','80.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Ca105', '106', 's6.jpg', 'Fo101','90.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Fi104', '107', 's7.jpg', 'Sp108','20.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Re103', '108', 's8.jpg', 'Sn103','100.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Ad102', '109', 's9.jpg', 'Sp108','140.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Pd106', '110', 's10.jpg', 'Fo101','240.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Cr101', '112', 's12.jpg', 'Ca102','220.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Fi104', '113', 's13.jpg', 'Sp108','65.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Pd106', '114', 's14.jpg', 'Fo101','30.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Re103', '115', 's15.jpg', 'Sp108','48.00');
INSERT INTO `shoestore`.`shoes` (`admin_Id`, `brand_Id`, `shoe_Id`, `shoe_Img`, `category_Id`,`cost`) VALUES ('pg05', 'Ad102', '111', 's11.jpg', 'Sp108','45.00');


#GENDER
INSERT INTO `shoestore`.`gender` (`gender_id`) VALUES ('MEN001');
INSERT INTO `shoestore`.`gender` (`gender_id`) VALUES ('WOMEN002');
INSERT INTO `shoestore`.`gender` (`gender_id`) VALUES ('KIDS003');
INSERT INTO `shoestore`.`gender` (`gender_id`) VALUES ('UNISEX004');


#color

INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c101', 'white');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c102', 'black');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c103', 'white');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c104', 'grey');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c105', 'brown');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c106', 'balck');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c107', 'green');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c108', 'pink');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c109', 'red');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c110', 'black');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c111', 'yellow');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c112', 'red');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c113', 'white');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c114', 'brown');
INSERT INTO `shoestore`.`color` (`color_Id`, `color_Name`) VALUES ('c115', 'black');


#size

INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('7', '101');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('7.5', '102');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('8', '103');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('8.5', '104');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('9', '105');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('5', '106');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('5.5', '107');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('6', '108');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('6.5', '109');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('4.5', '110');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('3', '111');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('3.5', '112');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('4', '113');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('4.5', '114');
INSERT INTO `shoestore`.`size` (`size_Number`, `shoe_Id`) VALUES ('5', '115');


#sale
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.00', 's1');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.3', 's2');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.2', 's3');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.4', 's4');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.25', 's5');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.2', 's6');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.4', 's7');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.25', 's8');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.3', 's9');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.00', 's10');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.00', 's11');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.25', 's12');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.5', 's13');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.35', 's14');
INSERT INTO `shoestore`.`sale` (`discount`, `sale_Id`) VALUES ('0.1', 's15');


#customer

INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1990-02-22', 'john', 'doe', 'Male', 'John@123', 'Johndoe@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1989-07-10', 'mary', 'rose', 'Female', 'Mary@123', 'Mary@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1992-07-23', 'Usman', 'khan', 'Male', 'Usma@123', 'Usman@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1994-08-17', 'Anudeesh', 'U', 'Male', 'Desh@123', 'Deesh@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1991-06-18', 'Narendra', 'Modi', 'Male', 'Modi@123', 'Modi@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1990-02-22', 'john', 'doe2', 'Male', 'John@123', 'Johndoe1@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1989-07-10', 'mary2', 'smith', 'Female', 'Mary@123', 'Mary1@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1992-07-23', 'Usman2', 'khan', 'Male', 'Usma@123', 'Usman1@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1994-08-17', 'Anudeesh2', 'U', 'Male', 'Desh@123', 'Deesh1@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1991-06-18', 'Narendra2', 'Modi', 'Male', 'Modi@123', 'Modi2@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1990-02-22', 'john3', 'smith', 'Male', 'John@123', 'Johndoe2@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1989-07-10', 'mary3', 'rose', 'Female', 'Mary@123', 'Mary2@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1992-07-23', 'Usman3', 'khan', 'Male', 'Usma@123', 'Usman2@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1994-08-17', 'Anudeesh3', 'U', 'Male', 'Desh@123', 'Deesh2@gmail.com',curdate());
INSERT INTO `shoestore`.`customer` (`dob`, `first_name`, `last_name`, `gender`, `password`, `emailId`,`registeredDate`) VALUES ('1991-06-18', 'Narendra3', 'Modi', 'Male', 'Modi@123', 'Modi2@gmail.com',curdate());


#phonenumber
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9876543321', 1);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9887765432', 2);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9888776654', 3);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9988776652', 4);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9877765432', 5);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9876543321', 6);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9887765432', 7);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9888776654', 8);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9988776652', 9);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9877765432', 10);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9876543321', 11);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9887765432', 12);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9888776654', 13);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9988776652', 14);
INSERT INTO `shoestore`.`phonenumber` (`ph_no`, `cust_Id`) VALUES ('9877765432', 15);


#Address
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,935501,NC -28262', 1, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UTN,9523,NC-28263', 2, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,9509,NC-28262', 3, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,95340,NC-28262', 4, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,95440,NC-28262', 4, 'billing');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UTN,95150,NC-28263', 5, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,95051,NC -28262', 6, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UTN,9523,NC-28263', 7, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,909,NC-28262', 8, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,9501,NC -28262', 9, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UTN,92353,NC-28263', 10, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,9509,NC-28262', 11, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,64501,NC -28262', 12, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UTN,945523,NC-28263', 13, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,954509,NC-28262', 15, 'shipping');
INSERT INTO `shoestore`.`address` (`address`, `cust_Id`, `type`) VALUES ('UT,9546309,NC-28262', 14, 'shipping');

#orders

INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o101', 1, '2016-10-15','1','4.5','40.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o102', 2, '2016-09-25','1','3.5','80.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o103', 3, '2016-10-15','1','4.0','100.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o104', 4, '2016-10-19','1','4.5','140.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o105', 5, '2016-10-11','1','5.0','220.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o106', 1, '2016-10-15','1','4.5','40.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o107', 2, '2016-09-25','1','3.5','80.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o108', 3, '2016-10-15','1','4.0','100.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o109', 4, '2016-10-19','1','4.5','140.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o110', 5, '2016-10-11','1','5.0','220.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o111', 1, '2016-10-15','1','4.5','40.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o112', 2, '2016-09-25','1','3.5','80.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o113', 3, '2016-10-15','1','4.0','100.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o114', 4, '2016-10-19','1','4.5','140.00');
INSERT INTO `shoestore`.`orders` (`order_Id`, `cust_Id`, `orderdate`,`quantity`,`review`,`totalcost`) VALUES ('o115', 5, '2016-10-11','1','5.0','220.00');


#alsohasorderhistory

INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 1, '2016-10-15', '101','1','4.5','40.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 2, '2016-09-25', '105','1','3.5','80.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 3, '2016-10-15', '108','1','4.0','100.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 4, '2016-10-19', '109','1','4.5','140.00');
INSERT INTO `shoestore`.`alsohasorderhistory` (`cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES (5, '2016-10-11', '112','1','5.0','220.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 6, '2016-10-15', '101','1','4.5','40.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 7, '2016-09-25', '105','1','3.5','80.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 8, '2016-10-15', '108','1','4.0','100.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 9, '2016-10-19', '109','1','4.5','140.00');
INSERT INTO `shoestore`.`alsohasorderhistory` (`cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES (10, '2016-10-11', '112','1','5.0','220.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 11, '2016-10-15', '101','1','4.5','40.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 12, '2016-09-25', '105','1','3.5','80.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 13, '2016-10-15', '108','1','4.0','100.00');
INSERT INTO `shoestore`.`alsohasorderhistory` ( `cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES ( 14, '2016-10-19', '109','1','4.5','140.00');
INSERT INTO `shoestore`.`alsohasorderhistory` (`cust_Id`, `orderdate`, `shoe_Id`,`quantity`,`review`,`totalcost`) VALUES (15, '2016-10-11', '112','1','5.0','220.00');


#mightforgotpassword
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (1, 'Johndoe@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (2, 'Mary@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (3, 'Usman@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (4, 'Deesh@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (5, 'Modi@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (6, 'Johndoe@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (7, 'Mary@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (8, 'Usman@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (9, 'Deesh@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (10, 'Modi@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (11, 'Johndoe@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (12, 'Mary@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (13, 'Usman@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (14, 'Deesh@gmail.com');
INSERT INTO `shoestore`.`mightforgotpassword` (`cust_Id`, `emailId`) VALUES (15, 'Modi@gmail.com');


# hascarddetails
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (1, '1144223355664478', 'johndoe', '2019-10-10');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (2, '1177000011112222', 'maryrose', '2020-08-25');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`, `exp_date`) VALUES (3, '4444888899992222', 'usmankhan','2017-11-28');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (4, '4477999933335555', 'anudessh u', '2019-04-19');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (5, '4141525289897632', 'narendra modi','2021-09-09');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (6, '1144223355664478', 'johndoe', '2019-10-10');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (7, '1177000011112222', 'maryrose', '2020-08-25');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`, `exp_date`) VALUES (8, '4444888899992222', 'usmankhan','2017-11-28');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (9, '4477999933335555', 'anudessh u', '2019-04-19');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (10, '4141525289897632', 'narendra modi','2021-09-09');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (11, '1144223355664478', 'johndoe', '2019-10-10');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (12, '1177000011112222', 'maryrose', '2020-08-25');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`, `exp_date`) VALUES (13, '4444888899992222', 'usmankhan','2017-11-28');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (14, '4477999933335555', 'anudessh u', '2019-04-19');
INSERT INTO `shoestore`.`hascarddetails` (`cust_Id`, `card_no`, `nameoncard`,`exp_date`) VALUES (15, '4141525289897632', 'narendra modi','2021-09-09');


#shoesareofcolor

INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c101', '101');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c102', '102');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c103', '103');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c104', '104');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c105', '105');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c106', '106');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c107', '107');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c108', '108');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c109', '109');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c110', '110');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c111', '111');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c112', '112');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c113', '113');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c114', '114');
INSERT INTO `shoestore`.`shoesareofcolor` (`color_Id`, `shoe_Id`) VALUES ('c115', '115');


#shoeshavesize

INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('7.0', '101');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('7.5', '102');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('8.0', '103');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('8.5', '104');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('9.0', '105');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('5.0', '106');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('5.5', '107');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('6.0', '108');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('6.5', '109');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('4.5', '110');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('3.0', '111');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('3.5', '112');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('4.0', '113');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('4.5', '114');
INSERT INTO `shoestore`.`shoeshavesize` (`size_Number`, `shoe_Id`) VALUES ('5.0', '115');



#shops

INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('101', 1);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('102', 2);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('103', 3);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('104', 4);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('105', 5);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('106', 1);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('107', 2);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('108', 3);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('109', 4);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('110', 5);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('111', 1);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('112', 2);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('113', 3);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('114', 4);
INSERT INTO `shoestore`.`shops` (`shoe_Id`, `cust_Id`) VALUES ('115', 5);


#shoesgoondeal

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('101', 's1');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('102', 's2');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('103', 's3');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('104', 's4');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('105', 's5');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('106', 's6');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('107', 's7');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('108', 's8');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('109', 's9');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('110', 's10');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('111', 's11');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('112', 's12');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('113', 's13');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('114', 's14');

INSERT INTO `shoestore`.`shoesgoondeal` (`shoe_Id`, `sale_Id`) VALUES ('115', 's15');


#contains
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('101', 'o101');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('105', 'o102');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('108', 'o103');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('109', 'o104');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('112', 'o105');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('101', 'o106');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('105', 'o107');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('108', 'o108');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('109', 'o109');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('112', 'o110');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('101', 'o111');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('105', 'o112');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('108', 'o113');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('109', 'o114');
INSERT INTO `shoestore`.`contains` (`shoe_Id`, `order_Id`) VALUES ('112', 'o115');

#admindefinesfaqcategory

INSERT INTO `admindefinesfaqcategory` (`category_id`, `category_name`,`admin_Id`) 
VALUES
('c001', 'Order status','pg05'),

('c002', 'Returns & exchanges','pg05'),

('c003', 'Product information','pg05'),

('c004', 'our Website','pg05'),

('c005', 'stores','pg05'),

('c006', 'category 1','pg05'),

('c007', 'category 2','pg05'),

('c008', 'category 3','pg05'),

('c009', 'category 4','pg05'),

('c010', 'category 5','pg05'),

('c011', 'category 6','pg05'),

('c012', 'category 7','pg05'),

('c013', 'category 8','pg05'),

('c014', 'category 9','pg05'),

('c015', 'category 10','pg05');



 # faqlist

INSERT INTO `faqlist` (`category_id`, `faqid`, `question`, `Answer`) 
VALUES
('c001', 'q001', 'How can I track my order?', 'Once you have submitted your order, you will receive an order confirmation by email to confirm that your order has been received. This email will contain your order number, you can tracke using that order iD'),

('c001', 'q002', 'How can I change/cancel my order? ', 'nfortunately, once an order has been shipped, it cannot be changed or cancelled. If you are not fully satisfied with your purchase, you will have the option of returning it.'),

('c002', 'q001', 'How can I return/exchange my order?', 'Please allow 1-2 business days for handling time. Once you receive a shipping confirmation email, your item (s) will be delivered depending on the shipping method you select. '),

('c003', 'q001', 'What are your size conversions? ', 'Our footwear is labeled with US sizes'),

('c003', 'q002', 'How can I locate styles available in my size? ', 'You can shop our full collection by size by using the SHOP BY SIZE filter on the webpage'),

('c004', 'q001', 'is it safe to shop on our site?', 'yes.. it is safe to shop on our site'),
('c005', 'q001', 'are there any stores available', 'no.. not yet started any physical stores');








#shoe_gender

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('MEN001', '101');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('MEN001', '102');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('MEN001', '103');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('MEN001', '104');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('MEN001', '105');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('WOMEN002', '106');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('WOMEN002', '107');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('WOMEN002', '108');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('WOMEN002', '109');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('KIDS003', '110');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('KIDS003', '111');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('KIDS003', '112');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('KIDS003', '113');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('UNISEX004', '114');

INSERT INTO `shoestore`.`shoe_gender` (`gender_id`, `shoe_id`) VALUES ('UNISEX004', '115');








