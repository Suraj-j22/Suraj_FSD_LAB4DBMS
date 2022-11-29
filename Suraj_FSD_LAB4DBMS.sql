Drop database if exists ecommerce;
Create database ecommerce;
Use ecommerce;
Drop table if exists supplier;
Create table supplier (supp_id int primary key,
				Supp_Name varchar(50) not null,
				Supp_city varchar(50) not null,
				Supp_phone varchar(50) not null);
Drop table if exists customer;
Create table customer (cus_id int primary key,
				Cus_name varchar(20) not null,
				Cus_phone varchar(10) not null,
				Cus_city varchar(30) not null,
				Cus_gender char);
Drop table if exists category;
Create table category (cat_id int primary key,
				Cat_name varchar(20) not null);
Drop table if exists product;
Create table product (pro_id int primary key,
				Pro_name varchar(20) not null default "Dummy",
				Pro_desc varchar(60),
				Cat_id int not null,
					Foreign key (cat_id) references category (cat_id) );
Drop table if exists supplier_pricing;
Create table supplier_pricing ( pricing_id int primary key,
					Pro_id int not null,
					Supp_id int not null,
					Supp_price int default 0,
						Foreign key (Pro_id) references product (pro_id),
						Foreign key (supp_id) references supplier (supp_id) );
Drop table if exists `order`; /* use backtick symbol if using keyword as name */
Create table `order`( ord_id int primary key,
				Ord_amount int not null,
				Ord_date date not null,
				Cus_id int not null,
				Pricing_id int not null,
					Foreign key(cus_id) references customer(cus_id),
					Foreign key (Pricing_id) references supplier_pricing(pricing_id) );
Drop table if exists rating;
Create table rating (rat_id int primary key,
			Ord_id int not null,
			Rat_ratstars int not null,
				Foreign key(ord_id) references `order`(ord_id) );
                
Insert into supplier values(1, "Rajesh Retails","Delhi",1234567890);
Insert into supplier values(2, "Appario Ltd.","Mumbai", 2589631470);
Insert into supplier values(3, "Knome products","Banglore", 9785462315);
Insert into supplier values(4, "Bansal Retails","Kochi", 8975463285);
Insert into supplier values(5, "Mittal Ltd.","Lucknow", 7898456532);
Select * from supplier;

Insert into customer values(1,"AAKASH",9999999999,"DELHI",'M');
Insert into customer values(2,"AMAN", 9785463215,"NOIDA",'M');
Insert into customer values(3,"NEHA", 9999999999,"MUMBAI",'F');
Insert into customer values(4,"MEGHA", 9994562399,"KOLKATA",'F');
Insert into customer values(5,"PULKIT", 7895999999,"LUCKNOW",'M');
Select * from customer;

Insert into category values(1,"BOOKS");
Insert into category values(2,"GAMES");
Insert into category values(3,"GROCERIES");
Insert into category values(4,"ELECTRONICS");
Insert into category values(5,"CLOTHES");
Select * from category;

Insert into product values (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
Insert into product values (2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
Insert into product values (3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
Insert into product values (4,"OATS","Highly Nutritious from Nestle",3);
Insert into product values (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
Insert into product values (6,"MILK","1L Toned MIlk",3);
Insert into product values (7,"Boat Earphones","1.5Meter long Dolby Atmos",4);
Insert into product values (8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
Insert into product values (9,"Project IGI","compatible with windows 7 and above",2);
Insert into product values (10,"Hoodie","Black GUCCI for 13 yrs and above",5);
Insert into product values (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
Insert into product values (12,"Train Your Brain","By Shireen Stephen",1);
Select * from product;

Insert into supplier_pricing values(1,1,2,1500);
Insert into supplier_pricing values(2,3,5,30000);
Insert into supplier_pricing values(3,5,1,3000);
Insert into supplier_pricing values(4,2,3,2500);
Insert into supplier_pricing values(5,4,1,1000);
Insert into supplier_pricing values(6,12,2,780);
Insert into supplier_pricing values(7,12,4,789);
Insert into supplier_pricing values(8,3,1,31000);
Insert into supplier_pricing values(9,1,5,1450);
Insert into supplier_pricing values(10,4,2,999);
Insert into supplier_pricing values(11,7,3,549);
Insert into supplier_pricing values(12,7,4,529);
Insert into supplier_pricing values(13,6,2,105);
Insert into supplier_pricing values(14,6,1,99);
Insert into supplier_pricing values(15,2,5,2999);
Insert into supplier_pricing values(16,5,2,2999);
Select * from supplier_pricing;

Insert into `order` values (101,1500,"2021-10-06",2,1);
Insert into `order` values (102,1000,"2021-10-12",3,5);
Insert into `order` values (103,30000,"2021-09-16",5,2);
Insert into `order` values (104,1500,"2021-10-05",1,1);
Insert into `order` values (105,3000,"2021-08-16",4,3);
Insert into `order` values (106,1450,"2021-08-18",1,9);
Insert into `order` values (107,789,"2021-09-01",3,7);
Insert into `order` values (108,780,"2021-09-07",5,6);
Insert into `order` values (109,3000,"2021-00-10",5,3);
Insert into `order` values (110,2500,"2021-09-10",2,4);
Insert into `order` values (111,1000,"2021-09-15",4,5);
Insert into `order` values (112,789,"2021-09-16",4,7);
Insert into `order` values (113,31000,"2021-09-16",1,8);
Insert into `order` values (114,1000,"2021-09-16",3,5);
Insert into `order` values (115,3000,"2021-09-16",5,3);
Insert into `order` values (116,99,"2021-09-17",2,14);
Select * from `order`;

Insert into rating values (1,101,4);
Insert into rating values (2,102,3);
Insert into rating values (3,103,1);
Insert into rating values (4,104,2);
Insert into rating values (5,105,4);
Insert into rating values (6,106,3);
Insert into rating values (7,107,4);
Insert into rating values (8,108,4);
Insert into rating values (9,109,3);
Insert into rating values (10,110,5);
Insert into rating values (11,111,3);
Insert into rating values (12,112,4);
Insert into rating values (13,113,2);
Insert into rating values (14,114,1);
Insert into rating values (15,115,1);
Insert into rating values (16,116,0);
Select * from rating;

select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from 
	(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
    (select `order`.*, customer.cus_gender, customer.cus_name from `order` 
    inner join customer where `order`.cus_id=customer.cus_id having `order`.ord_amount>=3000) 
    as t1 group by t1.cus_id) as t2 group by t2.cus_gender;
    
select product.pro_name, `order`.* from `order`, supplier_pricing, product 
where `order`.cus_id=2 and 
`order`.pricing_id=supplier_pricing.pricing_id and 
supplier_pricing.pro_id=product.pro_id;

select supplier.* from supplier where supplier.supp_id 
in (select supp_id from supplier_pricing group by supp_id having count(supp_id)>1) 
group by supplier.supp_id;

select category.cat_id,category.cat_name, 
min(t3.min_price) as Min_Price from category 
inner join (select product.cat_id, product.pro_name, t2.* from product 
inner join (select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id) 
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

select product.pro_id,product.pro_name from `order` 
inner join supplier_pricing on supplier_pricing.pricing_id=`order`.pricing_id 
inner join product on product.pro_id=supplier_pricing.pro_id 
where `order`.ord_date>"2021-10-05";

select customer.cus_name,customer.cus_gender from customer 
where customer.cus_name like 'A%' or customer.cus_name like '%A';

select report.supp_id,report.supp_name,report.Average,
CASE
WHEN report.Average =5 THEN 'Excellent Service'
WHEN report.Average >4 THEN 'Good Service'
WHEN report.Average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
