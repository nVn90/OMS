Create Database OMS
Use OMS
Create table Admin_Login_Table(Admin_name Varchar(50),Password Varchar(50),Login_time Varchar(50),Logout_time Varchar(50))
select*from Admin_Login_Table
insert into Admin_Login_Table values('Naveen','123456')
Create table Customer_Login_Table(Cname Varchar(50),Cpassword Varchar(50),Login_time Varchar(50),Logout_time Varchar(50))
select*from Customer_Login_Table
Create table Customer_Details_Table(Cid int,CName Varchar(50),Password Varchar(50),Cage int,CGender Varchar(50))
Create table Product_Details_Table(Product_ID int,Product_Name Varchar(50),Product_Model_No Varchar(20),Product_Company Varchar(20),Product_Image_URL Varchar(100),Product_Price Varchar(50))
Create table Cart_Details_Table(Cart_ID int,Product_ID int,Cid int)
Create table Bill_Details(Bill_ID int,Cid int,Product_ID int,Bill_Date Varchar(50),Bill_Total int)
