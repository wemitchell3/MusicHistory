SELECT * FROM Song;
SELECT
    Id,
    Title,
    SongLength
-- FROM Song WHERE Id = 3;
FROM Song 
WHERE Title LIKE 'Gimme%' 
AND SongLength < 150
FROM Song WHERE Title = N'Gimme Gimme Gimme';

SELECT
    s.Id,
    s.Title,
    s.SongLength
FROM Song s
WHERE s.SongLength < 150
AND s.SongLength > 50;

SELECT * FROM Genre;

SELECT
    s.Id,
    s.Title,
    s.SongLength,
    s.GenreId,
    g.Id,
    g.Label
FROM Song s
JOIN Genre g ON s.GenreId = g.Id;
-- WHERE g.Id = 9;

SELECT * From Artist;

INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Jisie David', 1988);

SELECT * FROM Song WHERE Id = 18;
> 664

UPDATE Song
SET SongLength = 515
WHERE Id = 18;

SELECT * FROM Song WHERE Id = 18; 
> 515

DELETE FROM Song WHERE ArtistId = 3;

SELECT * FROM Artist 
WHERE YearEstablished < 1990 
OR YearEstablished = 2006;

SELECT * FROM Artist 
ORDER BY YearEstablished ASC;

SELECT 
    Title,
    SongLength
FROM Song
ORDER BY SongLength DESC;

SELECT 
    s.Title AS SongTitle,
    s.SongLength,
    a.Title AS AlbumTitle,
    ar.ArtistName
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
JOIN Artist ar ON s.ArtistId =ar.Id
ORDER BY s.SongLength DESC;

SELECT 
    COUNT(s.Title) AS 'Number of songs on the album',
    a.Title AS AlbumTitle
FROM Song s
JOIN Album a ON s.AlbumId = a.Id
GROUP BY a.Title
ORDER BY AlbumTitle DESC;

SELECT ar.ArtistName,
COUNT(al.Title) AS 'Number of Albums'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
GROUP BY ar.ArtistName;

SELECT 
    ar.ArtistName,
COUNT(al.Title) AS 'Number of albums by artist'
FROM Artist ar
JOIN Album al ON ar.Id = al.ArtistId
GROUP BY ar.ArtistName;




-- Start of practice

-- Question #1

SELECT * FROM Genre;

-- Question #2

SELECT * FROM Artist
ORDER BY ArtistName;

INSERT INTO Artist (ArtistName, YearEstablished) 
VALUES ('Metallica', 1981);

-- Question #3

SELECT * FROM Album
ORDER BY Title;

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
VALUES ('And Justice For All', '08/25/1988', 3924, 'Elektra', 28, 5);

DELETE FROM Album WHERE Id = 23;

-- Question #4

SELECT * FROM Song
ORDER BY Title;

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('One', 447,'01/10/1989', 5, 28, 24);

-- Question #5

SELECT 
    Album.Title AS 'Album Title', 
    Song.Title AS 'Song Title',
    Artist.ArtistName AS 'Artist Title'
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.Id
LEFT JOIN Artist ON Album.ArtistId = Artist.Id
WHERE Album.Id = 24;

-- Question #6

SELECT
    Album.Title AS 'Album Title',
    COUNT(Song.Title) AS 'Number of Songs Per Album'
FROM Song
JOIN Album ON Song.AlbumId = Album.Id
-- WHERE Album.Id = 24
GROUP BY Album.Title
ORDER BY [Album Title];

-- Question #7

SELECT 
    Artist.ArtistName AS 'Artist Title',
    COUNT(Song.Title) AS 'Number of Songs per Artist'
FROM Song
JOIN Artist ON Song.ArtistId = Artist.Id
GROUP BY Artist.ArtistName
ORDER BY [Artist Title];

-- Question #8

SELECT 
    Genre.Label AS 'Genre Type',
    COUNT(Song.Title) AS 'Number of Songs Per Genre'
FROM Song
JOIN Genre ON Song.GenreId = Genre.Id
GROUP BY Genre.Label
ORDER BY [Genre Type]; 

-- Question #9

SELECT 
    Title,
    AlbumLength
FROM Album
WHERE AlbumLength = (
    SELECT MAX(AlbumLength)
    FROM Album);

-- Question #10

SELECT 
    Title,
    SongLength
FROM Song
WHERE SongLength = (
    SELECT MAX(SongLength)
    FROM SONG);

-- Question #11

SELECT 
    Song.Title AS 'Song Title',
    Song.SongLength,
    Album.Title AS 'Album Title'
FROM Song
JOIN Album ON Song.AlbumId = Album.Id
WHERE SongLength = (
    SELECT MAX(SongLength)
    FROM Song);

