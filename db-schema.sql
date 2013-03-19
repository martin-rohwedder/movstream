create database if not exists movstreamdb;

use movstreamdb;

drop table if exists `user`;
drop table if exists `persistent_logins`;
drop table if exists `movie`;
drop table if exists `genre`;
drop table if exists `season`;

create table `user`
(
`ID` int unsigned not null auto_increment,
`USERNAME` varchar(255) not null,
`PASSWORD` varchar(255) not null,
`UPDATE_VERSION` int not null default 0,
`USER_ROLE` varchar(255) not null,
primary key (`ID`)
)engine innodb default character set utf8;

create table `season`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
primary key (`ID`)
)engine innodb default character set utf8;

create table `genre`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
primary key (`ID`)
)engine innodb default character set utf8;

create table `movie`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
`DESCRIPTION` varchar(255),
`MOVIE_FILENAME` varchar(255) not null,
`SUBTITLE_FILENAME` varchar(255),
`PICTURE_FILENAME` varchar(255),
`GENRE_ID` int unsigned not null,
`SEASON_ID` int unsigned,
primary key (`ID`),
foreign key (`GENRE_ID`) references `genre`(`ID`),
foreign key (`SEASON_ID`) references `season`(`ID`)
)engine innodb default character set utf8;

create table `persistent_logins`
(
  `USERNAME` varchar(64) not null,
  `SERIES` varchar(64) not null default '',
  `TOKEN` varchar(64) not null,
  `LAST_USED` timestamp not null,
  primary key (`SERIES`)
)engine innodb default character set utf8;

insert into `user` (`USERNAME`, `PASSWORD`, `USER_ROLE`)
values ('test', 'e9233bd61e14137a7e28f92c50ce279215e774a1772d1e9dad5f275b9cc8177c', 'ROLE_SUPERADMIN');

insert into `genre` (`TITLE`)
values ('Action');
insert into `genre` (`TITLE`)
values ('Comedy');
insert into `genre` (`TITLE`)
values ('Fantasy');

insert into `season` (`TITLE`)
values ('24 Hours Season 1');
insert into `season` (`TITLE`)
values ('24 Hours Season 2');
insert into `season` (`TITLE`)
values ('24 Hours Season 3');

insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `SUBTITLE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 1 - Episode 1', 'Follow Jack Bauer', '24-1-1', '24-1-1-sub', '24-1-1-pic', 1, 1);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `SUBTITLE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 1 - Episode 2', 'Follow Jack Bauer', '24-1-2', '24-1-2-sub', '24-1-2-pic', 1, 1);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `SUBTITLE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 1 - Episode 3', 'Follow Jack Bauer', '24-1-2', '24-1-3-sub', '24-1-3-pic', 1, 1);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `SUBTITLE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('Harry Potter', 'Follow Jack Bauer', '24-1-1', '24-1-1-sub', '24-1-1-pic', 3, null);