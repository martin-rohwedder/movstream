create database if not exists movstreamdb;

use movstreamdb;

drop table if exists user;
drop table if exists persistent_logins;

create table `user`
(
`ID` int unsigned not null auto_increment,
`USERNAME` varchar(255) not null,
`PASSWORD` varchar(255) not null,
`UPDATE_VERSION` int not null default 0,
`USER_ROLE` varchar(255) not null,
primary key (`ID`)
);

create table `persistent_logins`
(
  `USERNAME` varchar(64) not null,
  `SERIES` varchar(64) not null default '',
  `TOKEN` varchar(64) not null,
  `LAST_USED` timestamp not null,
  primary key (`SERIES`)
);

insert into user (USERNAME, PASSWORD, USER_ROLE)
values ('test', 'e9233bd61e14137a7e28f92c50ce279215e774a1772d1e9dad5f275b9cc8177c', 'ROLE_SUPERADMIN');