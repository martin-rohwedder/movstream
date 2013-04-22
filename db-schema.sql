create database if not exists movstreamdb;

use movstreamdb;

drop table if exists `user`;
drop table if exists `persistent_logins`;
drop table if exists `subtitle`;
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

create table `movie`
(
`ID` int unsigned not null auto_increment,
`TITLE` varchar(64) not null,
`DESCRIPTION` varchar(255),
`MOVIE_FILENAME` varchar(255) not null,
`PICTURE_FILENAME` varchar(255),
`GENRE_ID` int unsigned not null,
`SEASON_ID` int unsigned,
`UPDATE_VERSION` int not null default 0,
primary key (`ID`),
foreign key (`GENRE_ID`) references `genre`(`ID`),
foreign key (`SEASON_ID`) references `season`(`ID`)
)engine innodb default character set utf8;

create table `subtitle`
(
`ID` int unsigned not null auto_increment,
`FILENAME` varchar(255) not null,
`LANGUAGE` varchar(30) not null,
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
values ('test', 'e9233bd61e14137a7e28f92c50ce279215e774a1772d1e9dad5f275b9cc8177c', 'ROLE_SUPERADMIN');

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

insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 1 - Episode 1', 'Follow Jack Bauer', '24-1-1', '24-1-1-pic', 1, 1);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 1 - Episode 2', 'Follow Jack Bauer', '24-1-2', '24-1-2-pic', 1, 1);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 1 - Episode 3', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 1);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('Harry Potter', 'Follow Jack Bauer', '24-1-1', '24-1-1-pic', 3, null);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 2 - Episode 1', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 2);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 2 - Episode 2', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 2);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('24 Season 3 - Episode 1', 'Follow Jack Bauer', '24-1-2', '24-1-3-pic', 1, 3);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('Harry Potter 2', 'Harry has problems', '24-1-1', '24-1-1-pic', 3, null);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('Mr. Beans Holiday', 'Bean is the best', '24-1-1', '24-1-1-pic', 2, null);
insert into `movie` (`TITLE`, `DESCRIPTION`, `MOVIE_FILENAME`, `PICTURE_FILENAME`, `GENRE_ID`, `SEASON_ID`)
values ('007', 'Bond, James Bond', '24-1-1', '24-1-1-pic', 1, null);

insert into `subtitle` (`FILENAME`, `LANGUAGE`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'english', 1);
insert into `subtitle` (`FILENAME`, `LANGUAGE`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'danish', 1);
insert into `subtitle` (`FILENAME`, `LANGUAGE`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'english', 9);
insert into `subtitle` (`FILENAME`, `LANGUAGE`, `MOVIE_ID`)
values ('beansubtitle.vtt', 'english', 10);
