CREATE TABLE appleStore_description_combined AS
(
SELECT * FROM appleStore_description1
UNION ALL
SELECT * FROM appleStore_description2
UNION ALL
SELECT * FROM appleStore_description2
UNION ALL
SELECT * FROM appleStore_description3
UNION ALL
SELECT * FROM appleStore_description4 
);

--Exploratori Data analysis

-- check the number of the unique apps in both tablesAppleStrore

SELECT COUNT(DISTINCT id) As UniqueAppIDs
FROM AppleStore;

SELECT count(DISTINCT id) AS UniqueAppIDs
FROM appleStore_description_combined;

--Checkforany missing VALUES in key fields
SELECT count(*) AS MissingValues
FROM AppleStore
WHERE track_name IS NULL OR user_rating IS NULL OR prime_genre IS NULL ;

SELECT count(*) AS MisingValues 
FROM appleStore_description_combined
WHERE app_desc IS NULL;

-- FINDOUT NUMBERS OF APPS PER GENER

SELECT prime_genre, count(*) AS NumApps
FROM AppleStore
GROUP BY prime_genre
ORDER BY NumApps DESC;

--get an overview od teh apps ratings
SELECT min(user_rating) AS Minrating,
	   max(user_rating) AS Maxrating,
	   avg(user_rating) As  AVGRating
FROM AppleStore;

