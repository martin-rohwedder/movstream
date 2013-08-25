# User Guide #

This user guide contains information about how to install movstream on your server, and how to use the application when the installation has been completed. Before you can begin however, you need to obtain the application WAR file from my website.

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
    
    insert into `movie_type` (`NAME`)
    values ('mp4');
    insert into `movie_type` (`NAME`)
    values ('webm');
    insert into `movie_type` (`NAME`)
    values ('ogv');
    insert into `movie_type` ('NAME')
    values ('mkv');

This script will create the tables needed for the database, and insert one row to the 'user' table, and the move file extensions, which the player supports. The user row contains the superadmin user, and it has the password 'default'. You will be told to change the password on the first login, so don't change it at this point.

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

## 2 How to use the application ##

Movstream is designed to be easy to use, however it can be good to have read a little about, how to use the features before beginning to actually use them. This section will start out from the very basic of how to navigate in the application, to how to add your first movie, so lets begin.

### 2.1 Our first overview of the application ###

If this is the very first time you startup the application in a web browser, you should see a login page. during the installation, you have already created your superadmin user, so it should be ready to login. The credentials is

    username: superadmin
    password: default

Notice the password default is a standard password throughout the application. All new users will be provided with this password, which they later can change. When you log in, you will be prompted to change your password. This happens because the system can reckognise that the user is using the default password, and this is not recommended to use. You will therefore have to change the password using this dialog, and when you click ok, the password has been changed.

The first page you will encounter is the home page. This page holds a complete list of all movies registered in the system, in alphabetically order, 0-9 to Z. At the first use this page is rather empty, but when time goes, you'll begin add movies, and this page will automatically be populated with these movies.

In the top you should see a navigation bar. This navigation bar will have 5 different menu items. 'Home', 'Browse Genre', 'My User', 'Settings' and 'Log Out'. Since we have no movies or genres, lets fast skip the 'Home' and 'Browse Genre' menu items, and go to 'My User' instead. This menu item contains a page, where you have the opportunity to change your password once again. This i most usefull later if you're not sure that your password is safe enough.

The next menu item 'Settings' is where all the action for administrators will be found. It's in here you can see details about the application, add new moves, edit genres or seasons, add users and etc. More importantly for you as a superadmin, is the tab 'System Settings'. This tab is only accesable by a superadmin account, and no one else. If you open this page, you will have the following options.

* Change the application name, the default is movstream, but you can call it whatever you like.
* Change the system language. Notice that this language will force all other users to see the application in the choosen language.
* Local Directory. This is not editable from within the system. If you want to change the local directory, you have to stop the tomcat server, and change it in the system.properties file manually (Refer to section [1.4 Configure the Application for first use](https://github.com/martin-rohwedder/movstream/blob/master/docs/User_Guide.md#14-configure-the-application-for-first-use) in this guide).
* External Locations. You have the option to provide external location where your movie files are saved. If you provide more than one, you should seperate them by a comma. Notice that if you specify and external location called `http://www.example.com`, then you have to create two directories named `movies` and `images`, where you have to put movie files and images inside. To learn more about External locations, please refer to the [2.2 System Settings: Use External Locations](https://github.com/martin-rohwedder/movstream/blob/master/docs/User_Guide.md#22-system-settings-use-external-locations) section in his guide.

The next tab to be aware about is the 'Manage Movies' tab. In here you will find a button called 'Create New Movie', and it's here you have to provide information about the movie you want to add to the system. When movies are added to the system, you have the opportunity to edit or even delete movies from the system again.

'Manage Users' works the same way, though here you'll also have the opportunity to reset passwords for a specific user.

The 'Manage Genres' and 'Manage Seasons' tabs only allow you to edit or delete genres and seasons (with all their associated movies), but the creation of a genre or season, is done on the fly during a movie creation.

This was a guick overview of the application, and in following sections, we will be describing on how to add movies in detail, Managing of users and how to get your first movie functioning in the application.

### 2.2 System Settings: Use External Locations ###

In movstream you have the opportunity to use external locations, where you have you movie files. An external location could be another server which is accessible from a web browser. For instance you have another server which is accessible from the URL `http://mymovies.example.com`. In here you have your movies files. Though Movstream is dependent on a specific structure on external locations. All movies should be in a folder called `movies`, and all images/thumbnails should be in a folder called `images`. This means that a movie file should be accessable from a web browser when typing the URL `http://mymovies.example.com/movies/mymoviefile.mp4`, and likewise with a thumbnail picture associated with the movie, should be accessable from the URL `http://mymovies.example.com/images/myimage.jpg`.

Notice that subtitles can't be accessed through an external location. These subtitle files therefore have to be put in the local directory (specified on the system.properties file) on the web server. But don't worry. subtitles and movies can still be associated even though they don't are on the same server.

You can sepcify as many external locations as you like, all you have to do, is to separate them by a comma, eg. `http://mymovies.example.com, http://www.example.com`

### 2.3 Manage Movies: Add your first movie ###

Under the `Manage Movies` tab, you'll have the option to choose `Create New Movie` button. This button will start a create new movie flow.

When creating a new movie, you're actually not only beginning to create a new movie, but also a new genre, or a associate the movie to a new season. On the first step you'll have to provide information about the movie like it's title, description and which genre it's associated with. If no suitable genres can be found, you'll have to create a new genre which fits to the movie. This can be done by clicking the link `Create New Genre`.

The next step will ask you if the movie should be associated with a season. A season is only to be used when a movie is a splitted up in parts (for instance a triology). If you don't want to associate it with a season click the button `Skip This Part`. Else you have to find the correct season from the drop down box, or create a new season of no suitable season can be found.

The next step will ask for the movie filename and the image file name for the thumbnail image used with this movie. Please notice that you only need to provide the filename of the movie and image, not the path. The application will automatically search in your local directory or on your external locations for a movie with that specific filename, and likewise with the image file. You'll also need to be aware of that image filename you have to provide the file extension manually, though on the movie file you should select the file extension from the dropdown box.

In the next step you can provide subtitles to your movie, if there is any. You can add multiple subtitles to the movie, and this is done by clicking the button `Add Subtitle`. To add a subtitle, you have to provide the susbtitle filename, but not the file extension. Please notice that subtitles can only be loaded from the local directory (subtitles folder), and not from external locations. The Language text box provides the Label which is shown in the video player. You can for instance here write `Danish`, if the subtitle provide is in danish. The language code supports the video player with more information about the language of the subtitle. Language codes for danish is for instance `da`, but a complete list of language codes can be found [here](https://github.com/videojs/video.js/blob/master/docs/tracks.md#srclang)

The last step is a resume of your movie details. Look them over and if they are ok, you can click the button `Save Movie`, to save the movie in the database.

### 2.4 Manage Users ###

Under the `Manage Users` tab, you'll have the option to add a new user. Their is 3 types of user roles, but only 2 of them is active when creating a new user. The 3 roles are `superadmin`, `administrator`, `normal`. The superadmin is what the first user are in the system, and there is only supposed to be 1 superadmin in the entire system. The administrator role has all the same privileges as a superadmin except for modifying in the system settings. an administrator therefore has the opportunity to add movies or new users as well as the superadmin. lastly we have the normal role, which doesn't have access to the settings menu item. A normal user is a view only user, and this user only have privileges to view different movies inside the system.

To `Create a new User`, you have to provide the user with a unique username and a user role. Notice the username can't be changed after the creation, only the user role can be changed  later. When a user has been created, the password to the user will always be `default`. this is a standard password in the application, which secures that the user in their first login will be asked to change their password. Also notice that when you click the `reset password` button for a specific user, his or her password will always be resetted to `default`.
