# SQL

Welcome to my SQL portfolio! This code repository contains examples of SQL I've written. Feel free to take a look and reach out if you have any questions: europium62@gmail.com


-- Example query (PostgreSQL)

SELECT people.show_id, people.director, titles.title, titles.type
FROM "CharlotteChaze/BreakIntoTech"."netflix_people" people
LEFT JOIN "CharlotteChaze/BreakIntoTech"."netflix_titles_info" titles
ON people.show_id = titles.show_id; 

SELECT COUNT(*) 
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type = 'Movie';

SELECT MAX(date(date_added))
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info";

SELECT type
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
ORDER BY type ASC;

SELECT director 
FROM "CharlotteChaze/BreakIntoTech"."netflix_people" people
LEFT JOIN "CharlotteChaze/BreakIntoTech"."netflix_titles_info" titles
ON people.show_id = titles.show_id
WHERE title,title = 'Bright Star';

SELECT title, release_year
FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info"
WHERE type='Movie'
ORDER BY release_year ASC
LIMIT 2;
