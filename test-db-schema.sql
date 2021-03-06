create database if not exists movstreamdb;

use movstreamdb;

drop table if exists `user`;
drop table if exists `persistent_logins`;
drop table if exists `subtitle`;
drop table if exists `movie`;
drop table if exists `genre`;
drop table if exists `season`;
drop table if exists `movie_type`;

create table `user`
(
`ID` int unsigned not null auto_increment,
`USERNAME` varchar(255) not null unique,
`PASSWORD` varchar(255) not null,
`UPDATE_VERSION` int not null default 0,
`USER_ROLE` varchar(255) not null,
primary key (`ID`)
)engine innodb default character set utf8;

create table `season`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
`DESCRIPTION` varchar(255) not null,
`UPDATE_VERSION` int not null default 0,
primary key (`ID`)
)engine innodb default character set utf8;

create table `genre`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
`UPDATE_VERSION` int not null default 0,
primary key (`ID`)
)engine innodb default character set utf8;

create table `movie_type`
(
`ID` int unsigned not null auto_increment,
`NAME` varchar(20) not null,
`UPDATE_VERSION` int not null default 0,
primary key (`ID`)
)engine innodb default character set utf8;

create table `movie`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
`DESCRIPTION` varchar(255),
`MOVIE_FILENAME` varchar(255) not null,
`PICTURE_FILENAME` varchar(255),
`GENRE_ID` int unsigned not null,
`SEASON_ID` int unsigned,
`MOVIE_TYPE_ID` int unsigned not null,
`UPDATE_VERSION` int not null default 0,
`DATE_CREATED` date not null,
primary key (`ID`),
foreign key (`GENRE_ID`) references `genre`(`ID`),
foreign key (`SEASON_ID`) references `season`(`ID`),
foreign key (`MOVIE_TYPE_ID`) references `movie_type`(`ID`)
)engine innodb default character set utf8;

create table `subtitle`
(
`ID` int unsigned not null auto_increment,
`FILENAME` varchar(255) not null,
`LANGUAGE` varchar(30) not null,
`SRC_LANG` varchar(4) not null,
`MOVIE_ID` int unsigned not null,
`UPDATE_VERSION` int not null default 0,
foreign key (`MOVIE_ID`) references `movie`(`ID`),
primary key (`ID`)
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
values ('superadmin', '560507b51f5cef80e257afc814c9c7967ac4fd097642543f9f10484c9976e163', 'ROLE_SUPERADMIN');
insert into `user` (`USERNAME`, `PASSWORD`, `USER_ROLE`)
values ('admin', 'e45676f504ce9787b3e53fbb831b917ccee65071083d5a144148456186c9c2ea', 'ROLE_ADMIN');
insert into `user` (`USERNAME`, `PASSWORD`, `USER_ROLE`)
values ('normal', 'db96c2abf3d4207be73c87a7c399dfdc4c180f2945325b4f5fb3a37ca3594d74', 'ROLE_NORMAL');

insert into `genre` (`TITLE`)
values ('Action');
insert into `genre` (`TITLE`)
values ('Comedy');
insert into `genre` (`TITLE`)
values ('Fantasy');

insert into `season` (`TITLE`, `DESCRIPTION`)
values ('24 Hours Season 1', 'Kimberly Bauer is kidnapped');
insert into `season` (`TITLE`, `DESCRIPTION`)
values ('24 Hours Season 2', 'Nuclear Bombs in Los Angeles');
insert into `season` (`TITLE`, `DESCRIPTION`)
values ('24 Hours Season 3', 'Season 3 with jack bauers 24 hours');

insert into `movie_type` (`NAME`)
values ('mp4');
insert into `movie_type` (`NAME`)
values ('webm');
insert into `movie_type` (`NAME`)
values ('ogv');
insert into `movie_type` (`NAME`)
values ('mkv');

insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('24 Season 1 - Episode 1', 'Follow Jack Bauer', '24-1-1', '24-1-1-pic', 1, 1, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('24 Season 1 - Episode 2', 'Follow Jack Bauer', '24-1-2', '24-1-2-pic', 1, 1, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('24 Season 1 - Episode 3', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 1, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('Harry Potter', 'Follow Jack Bauer', '24-1-1', '24-1-1-pic', 3, null, 2, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('24 Season 2 - Episode 1', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 2, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('24 Season 2 - Episode 2', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 2, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('24 Season 3 - Episode 1', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 3, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('Harry Potter 2', 'Harry has problems', '24-1-1', '24-1-1-pic', 3, null, 3, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('Mr. Beans Holiday', 'Bean is the best', '24-1-1', '24-1-1-pic', 2, null, 1, now());
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`, `MOVIE_TYPE_ID`, `DATE_CREATED`)
values ('007', 'Bond, James Bond', '24-1-1', '24-1-1-pic', 1, null, 1, now());

insert into `subtitle` (`FILENAME`, `LANGUAGE`, `SRC_LANG`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'english', 'en', 1);
insert into `subtitle` (`FILENAME`, `LANGUAGE`, `SRC_LANG`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'danish', 'da', 1);
insert into `subtitle` (`FILENAME`, `LANGUAGE`, `SRC_LANG`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'english', 'en', 9);
insert into `subtitle` (`FILENAME`, `LANGUAGE`, `SRC_LANG`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'english', 'en', 10);