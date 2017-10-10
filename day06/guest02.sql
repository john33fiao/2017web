-- guest02 테이블 생성
create table guest02(
	sabun number,
	name varchar2(30),
	nalja date,
	pay number
);
-- 제약 조건 설정
alter table guest02 add primary key(sabun);
-- 테스트 데이터
insert into guest02 values(1111,'test01','2000/01/01',1000);
insert into guest02 values(2222,'test02','2001/12/01',2000);
insert into guest02 values(3333,'test03','2003/03/03',3000);
insert into guest02 values(4444,'test04','2011/04/02',4000);
