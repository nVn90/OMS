Create Database OMS
Use OMS
Create table Admin_Login_Table(Admin_Id int primary key identity(1,1),Admin_name Varchar(50),Admin_password varchar(50))
drop table Admin_Login_Table
select*from Admin_Login_Table
insert into Admin_Login_Table values('Naveen','123456')
Create table Customer_Login_Table(Cust_Cname Varchar(50),Cpassword Varchar(50),Login_time Varchar(50),Logout_time Varchar(50))
select*from Customer_Login_Table
Create table Customer_Details_Table(Cid int,CName Varchar(50),cPassword Varchar(50),Cage int,CGender Varchar(50),ccontact_no varchar(50),cdob varchar(50))
Create table Product_Details_Table(Product_ID int PRIMARY KEY IDENTITY(1,1),Product_Name Varchar(50),Product_Model_No Varchar(20),Product_Company Varchar(20),Product_Image_URL Varchar(100),Product_Price Varchar(50))
Create table Cart_Details_Table(Cart_ID int,Product_ID int,quantity int,totalprice int,Cid int)
Create table Bill_Details(Bill_ID int,Cid int,Product_ID int,Bill_Date Varchar(50),Bill_Total int)
DROP TABLE Product_Details_Table
