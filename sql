mysql> create database VP21MC033_college;

show databases;

use VP21MC033_college;

create table branch(branchid varchar(20) primary key not null,branchname varchar(20) not null,hod varchar(20) not null);

desc branch;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| branchid   | varchar(20) | NO   | PRI | NULL    |       |
| branchname | varchar(20) | NO   |     | NULL    |       |
| hod        | varchar(20) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

create table student(usn varchar(10) primary key not null,name varchar(20) not null,address varchar(50) not null,branchid varchar(20),foreign key(branchid) references branch(branchid),sem varchar(5) not null);

desc student;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| usn      | varchar(10) | NO   | PRI | NULL    |       |
| name     | varchar(20) | NO   |     | NULL    |       |
| address  | varchar(50) | NO   |     | NULL    |       |
| branchid | varchar(20) | YES  | MUL | NULL    |       |
| sem      | varchar(5)  | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

create table author(authorid varchar(20) primary key not null,authorname varchar(20) not null,country varchar(20) not null,age int(10));

mysql> desc author;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| authorid   | varchar(20) | NO   | PRI | NULL    |       |
| authorname | varchar(20) | NO   |     | NULL    |       |
| country    | varchar(20) | NO   |     | NULL    |       |
| age        | int         | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

create table book(bookid varchar(20) primary key not null, bookname varchar(10) not null, authorid varchar(20), foreign key(authorid) references author(authorid), publisher varchar(20) not null, branchid varchar(20), foreign key(branchid) references branch(branchid));

mysql> desc book;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| bookid    | varchar(20) | NO   | PRI | NULL    |       |
| bookname  | varchar(10) | NO   |     | NULL    |       |
| authorid  | varchar(20) | YES  | MUL | NULL    |       |
| publisher | varchar(20) | NO   |     | NULL    |       |
| branchid  | varchar(20) | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

create table borrow(usn varchar(20),foreign key(usn)references student(usn),
    -> bookid varchar(20),foreign key (bookid) references book(bookid),
    -> borrowdate date);

desc borrow;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| usn        | varchar(20) | YES  | MUL | NULL    |       |
| bookid     | varchar(20) | YES  | MUL | NULL    |       |
| borrowdate | date        | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)


mysql> insert into branch values("b1","mca","Dr.Vandana B.S");
Query OK, 1 row affected (0.00 sec)

mysql> insert into branch values("b2","mba","Iyer");
Query OK, 1 row affected (0.00 sec)

mysql> insert into branch values("b2","cs","Prof.Krishnamohan");
ERROR 1062 (23000): Duplicate entry 'b2' for key 'branch.PRIMARY'
mysql> insert into branch values("b3","cs","Prof.Krishnamohan");
Query OK, 1 row affected (0.01 sec)

mysql> insert into branch values("b4","Mech","Dr.Manujesh");
Query OK, 1 row affected (0.01 sec)

mysql> insert into branch values("b5","Civil","Dr.Anand");
Query OK, 1 row affected (0.01 sec)

mysql> select * from branch;
+----------+------------+-------------------+
| branchid | branchname | hod               |
+----------+------------+-------------------+
| b1       | mca        | Dr.Vandana B.S    |
| b2       | mba        | Iyer              |
| b3       | cs         | Prof.Krishnamohan |
| b4       | Mech       | Dr.Manujesh       |
| b5       | Civil      | Dr.Anand          |
+----------+------------+-------------------+

insert into student values("4VP21MCO30","Puneeth","Vittal","b1",2);
mysql> insert into student values("4VP21MCO31","Rakshith","Puttur","b3",5);
Query OK, 1 row affected (0.00 sec)

mysql> insert into student values("4VP21MCO33","Rashmi V","Puttur","b5",1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values("4VP21MCO45","Shruthi","Kumbra","b2",4);
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values("4VP21MCO14","Geetha","Vittal","b4",3);
Query OK, 1 row affected (0.00 sec)

mysql> select * from student;
+------------+----------+---------+----------+-----+
| usn        | name     | address | branchid | sem |
+------------+----------+---------+----------+-----+
| 4VP21MCO14 | Geetha   | Vittal  | b4       | 3   |
| 4VP21MCO30 | Puneeth  | Vittal  | b1       | 2   |
| 4VP21MCO31 | Rakshith | Puttur  | b3       | 5   |
| 4VP21MCO33 | Rashmi V | Puttur  | b5       | 1   |
| 4VP21MCO45 | Shruthi  | Kumbra  | b2       | 4   |
+------------+----------+---------+----------+-----+
5 rows in set (0.00 sec)


insert into author values("A1","Rames Elmasri","Arlinhton",51);
mysql> insert into author values("A2","Baidyanath Mishra","India",52);
mysql> insert into author values("A3","Elis Horowits","US",41);
mysql> insert into author values("A4","Yunus","Japan",34);
Query OK, 1 row affected (0.01 sec)

mysql> insert into author values("A5","Deepak Kehamani","India",39);
Query OK, 1 row affected (0.00 sec)


mysql> select * from author;
+----------+-------------------+-----------+------+
| authorid | authorname        | country   | age  |
+----------+-------------------+-----------+------+
| A1       | Rames Elmasri     | Arlinhton |   51 |
| A2       | Baidyanath Mishra | India     |   52 |
| A3       | Elis Horowits     | US        |   41 |
| A4       | Yunus             | Japan     |   34 |
| A5       | Deepak Kehamani   | India     |   39 |
+----------+-------------------+-----------+------+

mysql> insert into book values("Bk1","DBMS","A1","pearson","b1");
mysql> insert into book values("Bk2","Rearch methology","A2","Pearson","b2");
Query OK, 1 row affected (0.00 sec)

mysql> insert into book values("Bk3","Data structure","A3","MC Graw Hill","b3");
Query OK, 1 row affected (0.01 sec)

mysql> insert into book values("Bk4","Thermo Dynamics","A3","Taylor","b4");
Query OK, 1 row affected (0.00 sec)

mysql> insert into book values("Bk5","Algorithm","A4","MC Graw Hill","b5");
Query OK, 1 row affected (0.01 sec)

mysql> select * from book;
+--------+------------------+----------+--------------+----------+
| bookid | bookname         | authorid | publisher    | branchid |
+--------+------------------+----------+--------------+----------+
| Bk1    | DBMS             | A1       | pearson      | b1       |
| Bk2    | Rearch methology | A2       | Pearson      | b2       |
| Bk3    | Data structure   | A3       | MC Graw Hill | b3       |
| Bk4    | Thermo Dynamics  | A3       | Taylor       | b4       |
| Bk5    | Algorithm        | A4       | MC Graw Hill | b5       |
+--------+------------------+----------+--------------+----------+
5 rows in set (0.00 sec)

mysql> select * from borrow;
+------------+--------+------------+
| usn        | bookid | borrowdate |
+------------+--------+------------+
| 4VP21MCO30 | BK1    | 2022-08-22 |
| 4VP21MCO33 | BK2    | 2021-07-14 |
| 4VP21MCO45 | BK1    | 2021-07-09 |
| 4VP21MCO45 | BK1    | 2019-05-30 |
| 4VP21MCO14 | BK3    | 2020-03-01 |
| 4VP21MCO31 | BK2    | 2020-03-01 |
+------------+--------+------------+
6 rows in set (0.00 sec)

1)i.List the details of Students who are all studying in 2nd sem MCA.
mysql> select * from student where sem="2" and branchid=(select branchid from branch where branchname="mca");
+------------+---------+---------+----------+-----+
| usn        | name    | address | branchid | sem |
+------------+---------+---------+----------+-----+
| 4VP21MCO30 | Puneeth | Vittal  | b1       | 2   |
+------------+---------+---------+----------+-----+

ii.List the students who are not borrowed any books.
mysql> select name from student where usn not in(select usn from borrow);
+------+
| name |
+------+
| Guru |
+------+

vii.Display the Book names in descending order of their names.
mysql> select bookname from book order by bookname desc;
+------------------+
| bookname         |
+------------------+
| Thermo Dynamics  |
| Rearch methology |
| DBMS             |
| Data structure   |
| Algorithm        |
+------------------+














