#uploaded csv file into the database through python 

#created a separate database named olympic..
#uploaded the csv attributes to the table with respective variables..

create database olympic;
use olympic;

#checking the total_entries of the file is uploaded or not 
select count(*)from olympix_new;

#upload is success with same  no.of entries are entrerd..
select* from olympix_new;
desc olympix_new;
#------------------------------>table1<--------------------------------------------

create table country(
country_id int not null auto_increment,
country varchar(25) not null,
primary key(country_id)
);

insert into country(country)
select country from olympix_new;

select*from country;

#-------------------------------->Table 2<---------------------------------------

create table sports(
sports_id int primary key not null auto_increment,
sports varchar(25) not null ,
year year not null,
gold_medal int not null,
silver_medal int not null,
brone_medal int not null
);


insert into sports(sports,year,gold_medal,silver_medal,brone_medal)
select sports,year,gold_medal,silver_medal,brone_medal from olympix_new;


select *from sports;
#------------------------------------>Table 3<---------------------------------------
create table participates(
participates_id int primary key not null auto_increment,
name varchar(50) ,
age int );


insert into participates(name,age)
select name,age from olympix_new;
select *from participates;
#----------------------------------------------->tables are created as per 3nf

#TASKS

#find the average no.of.medals won by each country 
select  country,avg(total_medal) from olympix_new group by country;

#display countries,no.of.gold_medals won by each country in decreasing order
select country,count(gold_medal) from olympix_new group by country order by count(gold_medal) desc;

#display the list of people and the total_medals they have won in decresing order grouped by country 
select name,age,country,total_medal from olympix_new group by country order by total_medal desc; 

#display the list of people and the total_medals  according to their age..
select name,country,total_medal,age from olympix_new order by age desc;

#which country won max of medals in cumulative
select country , max(total_medal),max(gold_medal),
max(silver_medal),max(brone_medal) from olympix_new group by country;



