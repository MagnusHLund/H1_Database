create database InfluencerDB;

create table Influencers (
influencerID int not null primary key,
influencerName varchar(40) not null,
age tinyint not null,
instagramFollowers int not null
);

create table SocialMediaPlatforms (
platformID int not null primary key,
app varchar(40) not null,
averageUserAge FLOAT not null,
totalUsers int not null
);

create table Brands (
brandID int not null primary key,
brandName varchar(40) not null,
category varchar(40) not null, 
);

create table Collaborations(
collabID int not null,
influencerID int foreign key references Influencers(influencerID), 
brandID int foreign key references Brands(brandID), 
platformID int foreign key references SocialMediaPlatforms(platformID),
duration int not null,
payment FLOAT not null
);

insert into Influencers(influencerID, influencerName, age, instagramFollowers)
values (1, 'Anna', 24, 50000),
(2, 'Bent', 22, 20000),
(3, 'Caroline', 26, 80000),
(4, 'David', 28, 45000),
(5, 'Ella', 30, 70000),
(6, 'Frank', 27, 32000),
(7, 'Grace', 29, 92000),
(8, 'Henry', 31, 48000);

insert into SocialMediaPlatforms(platformID, app, averageUserAge, totalUsers)
values (1, 'Instagram', 24.5, 1000000),
(2, 'TikTok', 18.5, 2000000),
(3, 'Youtube', 28.5, 1500000),
(4, 'Snapchat', 20.0, 80000),
(5, 'X', 27.5, 50000),
(6, 'Facebook', 32.5, 2000000),
(7, 'Pinterest', 29.0, 600000),
(8, 'Linkedin', 34.0, 400000);

insert into Brands(brandID, brandName, category)
values (1, 'FashionCo', 'fashion'),
(2, 'BeautyBliss', 'beauty'),
(3, 'TechTron', 'technology'),
(4, 'GlamGlow', 'beauty'),
(5, 'SportSpot', 'sports'),
(6, 'EcoEssentials', 'lifestyle'),
(7, 'TrendTech', 'technology'),
(8, 'MystiqueMakeup', 'beauty');

insert into Collaborations(collabID, influencerID, brandID, platformID, duration, payment)
values (1, 1, 1, 1, 30, 5000.00),
(2, 2, 3, 2, 10, 3000.50),
(3, 3, 2, 3, 20, 7500.00),
(4, 4, 4, 4, 15, 2500.00),
(5, 1, 2, 1, 25, 6000.25),
(6, 3, 1, 2, 40, 6500.75),
(7, 5, 5, 5, 45, 5300.00),
(8, 6, 6, 6, 20, 3500.25),
(9, 7, 7, 7, 15, 4700.50),
(10, 8, 8, 8, 25, 2900.00),
(11, 5, 7, 1, 30, 5100.75),
(12, 6, 5, 2, 40, 4400.00),
(13, 7, 6, 3, 35, 6500.25),
(14, 8, 7, 4, 20, 7000.50);

/* Opgave 1 */
select influencerName from Influencers;

/* Opgave 2 */
select app from SocialMediaPlatforms;

/* Opgave 3 */
select influencerName from Influencers where age > 25;

/* Opgave 4 */
select brandName from Brands where category = 'beauty';

/* Opgave 5 */
select Count(instagramFollowers) from Influencers
where instagramFollowers > 50000;

/* Opgave 6 */
select app from SocialMediaPlatforms
order by averageUserAge desc
offset 0 rows fetch next 1 rows only;

/* Opgave 7 */
select influencerName from Influencers
LEFT JOIN Collaborations 
on Influencers.influencerID = Collaborations.influencerID
where brandID = 1;

/* Opgave 8 */
select app from SocialMediaPlatforms
where totalUsers > 1000000;

/* Opgave 9 */
select influencerName from Influencers
where age > 25 and age <= 30

/* Opgave 10 */
select distinct brandName from Brands
LEFT JOIN Collaborations 
on Brands.brandID = Collaborations.brandID
where platformID != 4;

/* Opgave 11 */
select brandName from Brands
left join Collaborations
on Brands.brandID = Collaborations.brandID
order by duration desc
offset 0 rows fetch next 1 rows only;

/* Opgave 12 */
select influencerName, count(*) Sponsorships from Influencers
left join Collaborations
on Influencers.influencerID = Collaborations.influencerID
group by influencerName 
having count (*) > 0

/* Opgave 13 */
select brandName from Brands
left join Collaborations 