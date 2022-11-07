/* drop procedure if exists pro1;

delimiter $

create procedure pro1()
begin
   select "Hello World 123456" as "Message Window";
end $
delimiter ;

---------------------

drop procedure if exists pro2;
delimiter $
create procedure pro2()
begin
  declare x int default -1;
  declare y int;
  declare z int;
  set y := 100;
  
  set @z1 := 2000;
  
  select x, y, z, @z1;
end $
delimiter ;

---------------------


drop procedure if exists pro3;
delimiter $
create procedure pro3(in x int, in y int, out z int)
begin
	set z := x + y;
end $
delimiter ;

--------------------- 



DROP PROCEDURE IF EXISTS pro4;
delimiter $$
CREATE PROCEDURE pro4(in para1 int)
begin
  select empno, ename, job, deptno from emp where deptno = para1;
end $$
delimiter  ;




mysql> call pro5(101)




DROP PROCEDURE IF EXISTS pro5;
delimiter $$
CREATE PROCEDURE pro5(in para1 int)
begin
	declare flag bool default false;
	
	select distinct true into flag from emp where deptno = para1;
	
	if flag THEN
		 select empno, ename, job, deptno from emp where deptno = para1;
	ELSE
		select "Record not found" as R1;
	end if;
end $$
delimiter  ;

mysql> call pro6(60,'abc','baroda', 'xyz', '01-01-2022');




DROP PROCEDURE IF EXISTS pro6;
delimiter $$
CREATE PROCEDURE pro6(p1 int, p2 varchar(20), p3 varchar(20), p4 varchar(20), p5 varchar(20))
begin
	declare exit handler for 1062 SELECT "duplicate deptno number";
	declare exit handler for 1146 SELECT "Table not present";
	
		if p1 between 1 and 99 THEN
			insert into dept3333 values(p1, p2, p3, p4, p5);
			select "Record inserted " R1;
		ELSE
			select "Invalid deptno number" R1;
		end if;
end $$
delimiter  ;




DROP PROCEDURE IF EXISTS pro7;
delimiter $$
CREATE PROCEDURE pro7(in p1 int)
begin
	declare flag bool default false;
	
	select true into flag from dept where deptno = p1;
	
	if flag THEN
		delete from dept where deptno = p1;
		select "Record deleted" R1;
	ELSE
		select "Record not found" R2;
	end if;
	
end $$
delimiter ;




DROP PROCEDURE IF EXISTS pro8;
delimiter $$
CREATE PROCEDURE pro8(in p1 varchar(20))
begin
	declare x int;
	
	select deptno into x from dept where dname = p1;
	
	if x is not null THEN
		select ename, deptno from emp where deptno = x;
	ELSE
		call display(" Record not found");
	end if;
	
	
end $$
delimiter ;

DROP PROCEDURE IF EXISTS display;
delimiter $$
CREATE PROCEDURE display(in p1 varchar(1000))
begin
		select p1 as R1;
end $$
delimiter ;




DROP PROCEDURE IF EXISTS pro9;
delimiter $$
CREATE PROCEDURE pro9()
begin
	declare x int default 0;
		
		lbl:LOOP
		set x := x + 1;
			
			if x > 10 THEN
				leave lbl;
			end if;
			select x;
		end loop lbl;
end $$



DROP PROCEDURE IF EXISTS pro10;
delimiter $$
CREATE PROCEDURE pro10(p1 varchar(10))
begin
	declare x int default 1;
	
	lbl:LOOP
				
			if x > LENGTH(p1) THEN
				leave lbl;
			end if;
			select substr(p1,x ,1);
			set x := x + 1;
	
	end loop lbl;
end $$
delimiter ;

delimiter ;



DROP PROCEDURE IF EXISTS pro11;
delimiter $$
CREATE PROCEDURE pro11()
begin
	create table abc(c1 int primary key, c2 varchar(10));
end $$
delimiter ;



DROP PROCEDURE IF EXISTS pro12;
delimiter $$
CREATE PROCEDURE pro12(p1 varchar(10))
begin
	
	if (select deptno from dept where dname=p1) THEN
		select * from dept where dname = p1;
	ELSE
		select "record not found";
	
	end if;
end $$
delimiter ;

DROP PROCEDURE IF EXISTS pro13;
delimiter $$
CREATE PROCEDURE pro13()
begin
	
	SET @x := "select * from dept";
	prepare stat from @x;
	execute stat;
end $$
delimiter ;


DROP PROCEDURE IF EXISTS pro14;
delimiter $$
CREATE PROCEDURE pro14(tname varchar(64), colList varchar(6000))
begin
		SET @a := concat("create table ", tname, "(", colList, ")" );
		prepare abc from @a;
		execute abc;
		
end $$
delimiter ;


DROP PROCEDURE IF EXISTS pro15;
delimiter $$
CREATE PROCEDURE pro15(tname varchar(64), colList varchar(6000))
begin
		SET @a := concat("select ", colList, " from " , tname );
		select @a;
		prepare stat from @a;
		execute stat;
end $$
delimiter ;


drop function if exists f1;
delimiter $
create function f1() returns varchar(20)
BEGIN
	return "hello world";
end $
delimiter ;






drop function if exists f3;
delimiter $
create function f3() returns int
BEGIN
	declare x int;
	select max(deptno) + 1 into x from dept;
	return x;
end $
delimiter ;
*/





drop function if exists f2;
delimiter $
create function f2(p1 int, p2 int) returns int
BEGIN
	return (ifnull(p1,0) + ifnull(p2,0));
end $
delimiter ;


























































































