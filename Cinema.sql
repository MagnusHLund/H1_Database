/* CREATE TABLES */

Create table Viewers (
Viewers_ID int not null primary key,
Cinema_hall_ID int not null, /* Foreign key */
Total_viewers int not null
);

create table Cinema_halls (
Cinema_hall_ID int not null primary key,
Cinema_ID int not null, /* Foreign key */
Seats int not null
);

Create table Cinema_halls_film (
Cinema_hall_film_ID int not null primary key,
Cinema_hall_ID  int not null, /* Foreign key */
Film_ID int not null /* Foreign key */
);

create table Films (
Film_ID int not null primary key,
Tickets_ID int not null, /* Foreign key */
Title varchar(50) not null,
Cinema_hall_ID int not null,
Release_date date not null,
Genre varchar(50) not null, 
Film_length int not null
);

create table Directors (
Director_ID int not null primary key,
Film_ID int not null, /* Foreign key */
Director_name varchar(50) not null
);

create table Film_Director (
Film_Director_ID int not null primary key,
Film_ID int not null, /* Foreign key */
Director_ID int not null /* Foreign key */
);

create table Actors (
Actor_ID int not null primary key,
Actor_name varchar(50) not null,
);

create table Film_actor(
Film_actor_ID int not null primary key,
Film_ID int not null, /* Foreign key */
Actor_ID int not null /* Foreign key */
);

create table Cinemas (
Cinema_ID int not null primary key,
Cinema_name varchar(50) not null,
Cinema_address varchar(50) not null, 
Total_cinema_halls int not null
);

Create table Participants (
Participant_ID int not null primary key,
Ticket_ID int not null, /* Foreign key */
participant_name varchar(50) not null,
Email varchar(50) not null
);

create table Tickets(
Ticket_ID int not null primary key,
Cinema_ID int not null, /* Foreign key */
price int not null
);

create table Cinema_ticket (
Cinema_Tickets_ID int not null primary key,
Cinema_ID int not null, /* Foreign key */
Ticket_ID int not null /* Foreign key */
);

/* INPUT DATA INTO TABLES */

insert into Viewers (Cinema_hall_ID, Total_viewers, Viewers_ID)
values (1, 650, 1),
(2, 375, 2), 
(3, 950, 3),
(4, 700, 4), 
(4, 800, 5);

insert into Cinema_halls(Cinema_hall_ID, Cinema_ID, Seats)
values (1, 3, 200),
(2, 1, 150), 
(3, 4, 150), 
(4, 3, 250),
(5, 2, 300);

insert into Cinema_halls_film (Cinema_hall_ID, Film_ID, Cinema_hall_film_ID)
values (1, 1, 1), 
(2, 3, 2), 
(3, 2, 3), 
(3, 4, 4), 
(5, 5, 5);

insert into films (film_ID, title, Cinema_hall_ID, Release_date, Genre, Film_length, Tickets_ID)
values (1, 'Return of the ooga booga', 1, '2023-08-23', 'horror', 123, 56),
(2, 'Yordan attacks', 2, '2005-01-19', 'horror', 110, 23),
(3, 'Jonas the handsome', 4, '2004-11-06', 'drama', 69, 54),
(4, 'Shazil the terrorist', 3, '2004-01-23', 'comedy', 90, 29),
(5, 'Magnus and the beast', 5, '2004-08-14', 'horror', 100, 75);

insert into Cinemas(Cinema_ID, Cinema_name, Cinema_address, total_cinema_halls)
values (1, 'Panorama', 'Nattergalevej 3 4200', 5),
(2, 'Movie house', 'Valmuemarken 3 4200', 4),
(3, 'ZBC', 'Ahorn alle 3-5', 7),
(4,	'MikkelsBio', 'Mikkelgade 69 6900', 3),
(5, 'KrisMovies', 'Krisgade 43 1242', 4)

insert into Directors (Film_ID, director_id, director_name)
values (1, 1, 'Mikkel'),
(2, 2, 'Yordan'),
(3, 3, 'Jonas'),
(4, 4, 'Shazil'),
(5, 5, 'Magnus');

insert into film_director(Film_director_ID, film_id, Director_ID)
values (1, 1, 1), 
(2, 2, 2), 
(3, 3, 3), 
(4, 4, 4), 
(5, 5, 5);

insert into Actors(Actor_ID, Actor_name)
values (1, 'Robert De Niro'), 
(2, 'Jack Nicholson'), 
(3, 'Marlon Brando'), 
(4, 'Denzel Washington'), 
(5, 'Katharine Hepburn');

insert into film_actor(film_ID, actor_id, film_actor_id)
values (1, 2, 1), 
(2, 4, 2), 
(3, 5, 3), 
(4, 2, 4), 
(4, 1, 5),
(5, 3, 6);

insert into participants(Ticket_ID, participant_id, Participant_name, email)
values (56, 1, 'Lucas', 'LucasWithGlasses@gmail.com'),
(23, 2, 'Emre', ' EmreLikesFaxeKondi@hotmail.com'),
(54, 3, 'Robert', 'RobertTattoo@outlook.com'),
(29, 4, 'Rune', 'RuneTheGreat@zbc.dk'),
(75, 5, 'Rasmus', 'RasmusGreatSmile@yahoo.com');

insert into Tickets(Ticket_ID, Cinema_id, price)
values (56, 1, 100),
(23, 2, 110),
(54, 3, 100),
(29, 4, 200),
(75, 5, 150)

insert into Cinema_ticket(Cinema_id, ticket_id, Cinema_tickets_id)
values (1, 56, 1),
(2, 23, 2), 
(3, 54, 3),
(4, 29, 4),
(5, 75, 5);

/* Give foreign key and reference */

ALTER TABLE Viewers ADD FOREIGN KEY(Cinema_hall_ID) REFERENCES Cinema_halls (Cinema_hall_ID);
ALTER TABLE Cinema_halls ADD FOREIGN KEY(Cinema_ID) REFERENCES Cinemas (Cinema_ID);
ALTER TABLE Cinema_halls_film ADD FOREIGN KEY(Cinema_hall_ID) REFERENCES Cinema_halls (Cinema_hall_ID);
ALTER TABLE Cinema_halls_film ADD FOREIGN KEY(Cinema_hall_ID) REFERENCES Films (Film_ID);
ALTER TABLE Film_Director ADD FOREIGN KEY(Film_ID) REFERENCES Films (Film_ID);
ALTER TABLE Film_Director ADD FOREIGN KEY(Director_ID) REFERENCES Directors (Director_ID);
ALTER TABLE Directors ADD FOREIGN KEY(Film_ID) REFERENCES Films (Film_ID);
ALTER TABLE Film_actor ADD FOREIGN KEY(Film_ID) REFERENCES Films (Film_ID);
ALTER TABLE Film_actor ADD FOREIGN KEY(Actor_ID) REFERENCES Actors (Actor_ID);
ALTER TABLE Tickets ADD FOREIGN KEY(Cinema_ID) REFERENCES Cinemas (Cinema_ID);
ALTER TABLE Participants ADD FOREIGN KEY(Ticket_ID) REFERENCES Tickets (Ticket_ID);
ALTER TABLE Cinema_ticket ADD FOREIGN KEY(Cinema_tickets_ID) REFERENCES Cinemas (Cinema_ID); 
ALTER TABLE Cinema_ticket ADD FOREIGN KEY(Ticket_ID) REFERENCES Tickets (Ticket_ID);		
ALTER TABLE Films ADD FOREIGN KEY(Tickets_ID) REFERENCES Tickets (Ticket_ID);