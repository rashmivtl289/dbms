DELIMITER //
create procedure abc(IN vid varchar(10),IN vname varchar(10),IN age int(2),IN cid varchar(10),IN canid varchar(10))
begin
declare msg varchar(20);
if age>=18 then
insert into voter(vid,vname,age,cid,canid)values(vid,vname,age,cid,canid);
set msg="row inserted";
else
set msg="voter not eligible";
end if;
select msg;
end //
DELIMITER ;
