/* Lavet af Shazil, Jonas, Yordan, Magnus */

/* Opgave 1 */
/* 73 ms without index */
/* 70 ms with index */
select * from random
where randomValue = 4711;

/* Opgave 2 */
/* 127 ms without index */.
/* 127 ms with index */
create view RandomValueView as
select randomValue, count(*) as occurrences 
FROM random 
group by randomvalue;

select * from randomValueView
order by randomValue;

/* Opgave 3 */
/* 123 ms without index */
/* 137 ms with index */
select * from RandomValueView
order by occurrences;

/* Opgave 4 */
/* 130 ms without index */
/* 140 ms with index */
select * from randomValueView
order by occurrences desc;

/* Opgave 5 */
/* 97 ms without index */
/* 80 ms with index */
select top 1 * from randomValueView
order by occurrences desc
select top 1 * from randomValueView
order by occurrences

/* Create index */
create index randomIndex
on random (id, randomValue);