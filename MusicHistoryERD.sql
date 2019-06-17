CREATE TABLE `Album`
(
  `Id` int PRIMARY KEY,
  `ArtistId` int,
  `GenreId` int,
  `Title` varchar(255),
  `ReleaseDate` varchar(255),
  `AlbumLength` int,
  `Label` varchar(255)
);

CREATE TABLE `Artist`
(
  `Id` int PRIMARY KEY,
  `ArtistName` varchar(255),
  `YearEstablished` varchar(255)
);

CREATE TABLE `Genre`
(
  `Id` int PRIMARY KEY,
  `Label` varchar(255)
);

CREATE TABLE `Song`
(
  `Id` int PRIMARY KEY,
  `Title` varchar(255),
  `SongLength` int,
  `GenreId` int,
  `ArtistId` int,
  `AlbumId` int
);

ALTER TABLE `Album` ADD FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`Id`);

ALTER TABLE `Album` ADD FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`Id`);

ALTER TABLE `Song` ADD FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`Id`);

ALTER TABLE `Song` ADD FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`Id`);

ALTER TABLE `Song` ADD FOREIGN KEY (`AlbumId`) REFERENCES `Album` (`Id`);
