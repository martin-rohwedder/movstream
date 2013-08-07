# User Guide #

## 1 Installation ##

To get started using this application, you have to follow a few simple steps, but before we do that you need to have your server environment setup correctly

### 1.1 Prepare your server ###

First of all you need a server installation. This application can be used on both a Linux or Windows environment. When you have your server installation completed, you need to have the following software installed.

* [Java JRE 1.7](http://www.oracle.com/index.html) (The application has been tested with Java 1.7 Update 25)
* [MySQL Database Server 5.6](http://dev.mysql.com/)
* [Tomcat](http://tomcat.apache.org/) (The application has been tested with Tomcat 7.0.34)

When you have this software installed and up running, you can begin creating the tables needed for the Movstream database.

### 1.2 Setup the database ###

Create a new MySQL database with an optional name, and here after you can execute this script to the database.

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
    values ('superadmin', 'dd36de2d67eb892eb38744489c8f6efe215523b88fd8671a5b91f9711d5821c9', 'ROLE_SUPERADMIN');

This script will create the tables needed for the database, and insert one row to the 'user' table. This row contains the superadmin user, and it has the password 'default'. You will be told to change the password on the first login, so don't change it at this point.

### 1.3 Add a Tomcat host ###

When you have the database ready, we can begin add a host to our Tomcat installation. Browse to you Tomcat installation, and create a new folder. You can call it what ever you want, but in this documentation we will call it 'movstream-webapp'.

Navigate to the 'conf' folder inside the Tomcat Installation folder, and open up the server.xml file. Between the `<Engine></Engine>` you ahve to add a new `<Host></Host>`, with the following aatributes.

    <Host name="www.example.com" appBase="movstream-webbapp" unpackWARs="true" autoDeploy="true"></Host>

It is also advicable to add an `<Alias></Alias>` providing access to the host without using the www in the beginning.

    <Host name="www.example.com" appBase="movstream-webbapp" unpackWARs="true" autoDeploy="true">
        <Alias>example.com</Alias>
    </Host>

Save the file, and restart Tomcat. When the restart has occured, go to your 'movstream-webapp' folder, and in this folder you have to drag and drop the movstream.WAR file.

This will auto deploy the web application to this folder, and put all the files inside a folder called movstream. Stop Tomcat, and rename the movstream folder to 'ROOT', but don't start Tomcat again yet.

### 1.4 Configure the Application for first use ###

We now need to configure the application for first use, this means setting up some basic configuration like database settings, and a local location of where to store different movie file assets.

Let us first setup the database information. To do this, you have to open up the database.properties file in a text editor. The database.properties file can be found in the location `{Tomcat Installation}/{Webapp Folder}/ROOT/WEB-INF/classes/configuration/`. Inside this file you'll find 4 key/value pairs, which is used to connect to your MySQL database.

    database.driverClassName=com.mysql.jdbc.Driver
    database.url=jdbc:mysql://hostname:port/dbname
    database.username=
    database.password=

Notice that the first key/Value pair is already filled out. Don't change the value in this, since it's holding a reference on which Driver class it has to use, for the database connection.

The next key/value pair is 'partly' filled out, since it is using some default placeholders, like hostname, port and dbname. This is the database url, and is telling the application on which host the database is on, which port number it has access to the host through, and what the database is called. Normally if the database is on the same server as the Movstream Web Application, you have to use the hostname `localhost`. The default port number for MySQL is port `3306`, but if you have choosen another during installation, you have to provide this port instead. lastly you have to provide the database name of the movstream database, you have created earlier in MySQL. A database url could therefore look like this

    jdbc:mysql://localhost:3306/movstream_database

The last two key/value pairs hasn't been filled out with a value. Here you have to provide a valid username and password for a user which has access to your movstream database. When you have modified the database.properties file, save and close it.

Now we need to modify the system.properties file, to specify local directory of where our application can find different movie files like movie thumbnails, subtitle files and movie files. Notice that even if you have your movie files on another server, you still have to provide a local directory, since the application is using this directory to find subtitles.

So open up the system.properties file and find the key/value pair named

    system.default.localDirectory=

If you're on a Windows Server, you have to manually escape backslashes when providing the local directory. For isntance, if I want to have my files to be at the location `C:\movstreamfiles\`, then I have to provide the value like this

    system.default.localDirectory=C:\\movstreamfiles\\

Don't bother adding an external location at this point, since this is doable inside the application. The only thing we have to modify manually in the system.properties file is the local directory. If you haven't created the folder movstreamfiles at the C drive, then don't bother either, since the Movstream application will ceate the folder structure for you autoamtically during startup.

Now Start up Tomcat, and the installation is done.