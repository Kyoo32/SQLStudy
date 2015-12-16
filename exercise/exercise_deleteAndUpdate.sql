//1

create table book like book_old;
insert into book select * from book_old;
select * from book;

SET SQL_SAFE_UPDATES = 0;
select * from book where title = "연금술사";
delete from book where title = "연금술사";
select * from book where title = "연금술사";

//2
select * from book where publisher like '에이콘%' and author like '폴 부처%';
delete from book where publisher like '에이콘%' and author like '폴 부처%';

select * from book where publisher like '에이콘%' and author like '폴 부처%';

//3
select *from book where publisher like '을유문화사' and title = "이기적 유전자"; 
delete from book where publisher like '을유문화사' and title = "이기적 유전자";

desc book;
alter table book add constraint  unique key(ISBN);
	->Error Code: 1062. Duplicate entry ~ 
select *from book where ISBN = 9788934933151;
delete from book where id = 71;
insert into book (title, author , publisher,year , ISBN, cost)  values('이기적 유전자', '리처드 도킨스', '을유문화사' , 2010, "9788932471631", 18000);
select *from book where publisher like '을유문화사' and title = "이기적 유전자";
insert into book (title, author , publisher,year , ISBN, cost)  values('이기적 유전자', '리처드 도킨스', '을유문화사' , 2010, "9788932471631", 18000);
	->Error

//4
select * from book where cost <=1000;
delete from book where cost <=1000;
load data local infile 'users/katekyuwon/desktop/toWon2.csv' into table book fields terminated by ',' enclosed by '"' ignore 1 lines;
select * from book where cost <=1000;
select * from book;

//5
select * from book where author = "마이클 샌델";
update book set title='Justice' where author = "마이클 샌델";
select * from book where author = "마이클 샌델";

//6
select * from book where publisher like '인사이트%' and author = '줄리스틸'; 
update book set title = '아름다운 시각화를 위하여' where publisher like '인사이트%' and author = '줄리스틸';
select * from book where publisher like '인사이트%' and author = '줄리스틸'; 

//7
select * from book;
select * from book where cost > 20000;
update book set cost = cost* 1.1 where cost > 20000;
select * from book where cost > 20000;

select * from book where cost <= 20000 and cost > 10000;
update book set cost = cost * 1.2 where cost <= 20000 and cost > 10000;
select * from book where cost <= 20000 and cost > 10000;

select * from book where cost <= 10000;
update book set cost = cost * 1.3 where cost <= 10000;
