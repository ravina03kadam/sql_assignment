create database MovieTeaters_db;
use MovieTeaters_db;
CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 select * from MovieTheaters;
 select * from Movies;
 -- 4.1 Select the title of all movies.
   select title from movies;
   
-- 4.2 Show all the distinct ratings in the database.
select distinct rating from movies;

-- 4.3  Show all unrated movies.
select * from movies where rating is null;

-- 4.4 Select all movie theaters that are not currently showing a movie.
select * from MovieTheaters where movie is null;

-- 4.5 Select all data from all movie theaters 
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
		select  MovieTheaters .* ,title from  MovieTheaters  join movies 
        on MovieTheaters.movie=movies.code ;
       --  select * from  MovieTheaters  join movies 
--         on MovieTheaters.movie=movies.code ;

-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
		select * from  MovieTheaters  join movies 
        on MovieTheaters.movie=movies.code 
        where movie is not null;
        
-- 4.7 Show the titles of movies not currently being shown in any theaters.
select m.title,t.movie from movies m join  MovieTheaters t
on t.movie=m.code 
where m.code!=t.movie;
SELECT Movies.Title
  FROM MovieTheaters RIGHT JOIN Movies
  ON MovieTheaters.Movie = Movies.Code
  WHERE MovieTheaters.Movie IS NULL;

-- 4.8 Add the unrated movie "One, Two, Three".
INSERT INTO Movies(Title,Rating) VALUES("One, Two, Three",NULL);

-- 4.9 Set the rating of all unrated movies to "G".
update movies set rating ='G' 
where rating is null;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
 delete from MovieTheaters where movie= (select code from movies where rating ='NC-17'); 
delete from MovieTheaters where movie in (select code from movies where rating ='NC-17');