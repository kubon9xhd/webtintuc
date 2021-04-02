use webbanhang;
insert into Role(code,name) values ('ADMIN','Quan tri he thong');
insert into Role(code,name) values ('USER','Nguoi dung');

insert into [User](username,password,fullname,role_id,status) values('admin','123456','admin',1,1);
insert into [User](username,password,fullname,role_id,status) values('nguyenvana','123456','Nguyen Van A',2,1);
insert into [User](username,password,fullname,role_id,status) values('nguyenvanb','123456','Nguyen Van B',2,1);