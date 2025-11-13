-- 1. Tạo cơ sở dữ liệu
create database qtkd2_session05;
-- 2. Sử dụng cơ sở dữ liệu để tạo các bảng
use qtkd2_session05;
-- 3. Tạo bảng product
-- primary key = not null + unique
create table product(
	product_id char(5) primary key,
    product_name varchar(150) not null unique,
    product_price float not null check(product_price>0),
    product_quantity int not null default(0),
    product_status bit
);
-- 4. Tạo bảng Order
create table orders(
	order_id int primary key auto_increment,
    order_created date,
    order_total_amount float not null check(order_total_amount>=0),
    order_status int not null
);
-- 5. Tạo bảng Order_Detail
create table order_detail(
	-- Khai báo cột order_id
	order_id int, 
    -- đặt order_id là khóa ngoại --> tham chiếu tới khóa chính của bảng orders
    foreign key(order_id) references orders(order_id),
    product_id char(5),
    foreign key(product_id) references product(product_id),
    primary key(order_id,product_id),
    product_price float not null,
    order_quantity int not null
);

/*
	ALTER: Chỉnh sửa cấu trúc của bảng
    Cú Pháp:
    ALTER TABLE [table_Name]
		ADD COLUMN [column_name datatype constraints]: thêm 1 cột
        MODIFY COLUMN [column_name datatype]: sửa kiểu dữ liệu của cột
        DROP COLUMN [column_name]: xóa 1 cột
        RENAME COLUMN [column_name] TO [new_column_name]: đổi tên cột
*/
-- 1. Thêm cột product_description có kiểu dữ liệu text, not null vào bảng product
alter table product
	add column product_description text not null;
-- 2. Sửa kiểu dữ liệu cột product_description thành varchar(200)
alter table product
	modify column product_description varchar(200);
-- 3. Sửa tên cột product_description thành descriptions
alter table product
	rename column product_description to descriptions; 
-- 4. Xóa cột descriptions trong bảng product
alter table product
	drop column descriptions;
Create table student(
	student_id int primary key auto_increment,
    student_name varchar(100) not null,
    student_age int not null check(student_age>=18),
    student_status bit default(1)
);
/*
	INSERT INTO [table_name](column1,column2,..., columnN)
    VALUES(value1,value2,...,valueN)
    Thêm 1 hoặc nhiều dữ liệu vào bảng
*/
-- 1. Thêm một sinh viên gồm tên sinh viên và tuổi
insert into Student(student_name,student_age)
values('Nguyễn Văn A',19);
insert into Student(student_name,student_age)
values('Nguyễn Văn B',20);
-- 2. Thêm 3 sinh viên vào bảng student với tên, tuổi, trạng thái
insert into student(student_name,student_age,student_status)
values ('Nguyễn Văn C',18,1),
('Nguyễn Văn D',22,0),
('Nguyễn Văn E',21,0);
-- 3. Thêm 1 sản phẩm đầy đủ thông tin vào bảng product
insert into product
values('P001','Vòng kim cương',10000,10,1);
/*
	UPDATE [table_name]
    SET column1 = value1,
		column2 = value2,
        .....
        columnN = valueN
	WHERE [condition]
    Cập nhật dữ liệu trong bảng
    Lưu ý: Khi ko sử dụng where thì cập nhật tất cả dữ liệu trên bảng
    Khi cập nhật phải dùng where để chỉ định rõ dữ liệu nào cần cập nhật
*/
-- 1. Cập nhật tất cả trạng thái sinh viên thành 0
SET SQL_SAFE_UPDATES = 0;
update student
set student_status = 1;
-- 2. Cập nhật tất cả những sinh viên có tuổi lớn hơn 20 có trạng thái =0
update Student
set student_status = 0
where student_age >20;
-- 3. Cập nhật tên thành Nguyễn Văn Chiến và trạng thái thành 0 của sv có mã là 3
update student
set student_name = 'Nguyễn Văn Chiến',
	student_status = 0
where student_id = 3;
/*
	DELETE FROM [table_name]
    WHERE [condition]
    Xóa dữ liệu trên bảng
    Lưu ý: nếu không dùng where thì sẽ xóa tất cả dữ liệu trên b
*/
-- 1. Xóa tất cả các sinh viên trong độ tuổi từ 18 đến 20
delete from student
where student_age between 18 and 20;

-- Truy vấn cơ bản
select * from student;


