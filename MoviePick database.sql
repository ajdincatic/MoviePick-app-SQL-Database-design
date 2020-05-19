create database MoviePick

use MoviePick
go


create table UserType
(
	Id int identity(1,1) primary key,
	[Type] nvarchar(50) not null
)

create table [User]
(
	Id int identity(1,1) primary key,
	FirstName nvarchar(50) null,
	LastName nvarchar(50) null,
	Username nvarchar(50) not null,
	Email nvarchar(50) not null,
	Phone nvarchar(50) not null,
	PasswordHash nvarchar(500) not null,
	PasswordSalt nvarchar(500) not null,
	UserTypeId int foreign key references UserType(Id) not null,
)

create table Genre
(
	Id int identity(1,1) primary key,
	GenreName nvarchar(50) not null
)

create table [Role]
(
	Id int identity(1,1) primary key,
	RoleName nvarchar(50) not null
)

create table ProductionCompany
(
	Id int identity(1,1) primary key,
	ProductionCompanyName nvarchar(50) not null
)

create table Person
(
	Id int identity(1,1) primary key,
	Photo varbinary(max) null,
	Biography nvarchar(500) not null,
	FirstName nvarchar(100) not null,
	LastName nvarchar(100) not null,
	Gender char(1) not null,
	DateOfBirth date not null,
	PlaceOfBirth nvarchar(50) not null,
)

create table MovieAndTVShow
(
	Id int identity(1,1) primary key,
	Title nvarchar(100) not null,
	[Description] nvarchar(1000) not null,
	[Language] nvarchar(50) not null,
	RunningTime nvarchar(10) not null,
	ReleaseDate date not null,
	Budget float,
	Poster varbinary(max) null,
	NumberOfRatings int not null,
	Finished bit,
	ProductionCompanyId int foreign key references ProductionCompany(Id) not null,
)

create table TVShowSeason
(
	Id int identity(1,1) primary key,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id) not null,
	Finished bit,
)


create table TVShowSeasonEpisode
(
	Id int identity(1,1) primary key,
	TVShowSeasonId int foreign key references TVShowSeason(Id) not null,
	EpisodeName nvarchar(50) not null,
	AirDate date not null
)

create table Comment
(
	Id int identity(1,1) primary key,
	AppUserId int foreign key references [User](Id) not null,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id) not null,
	DateTimeOfComment datetime not null,
	Content nvarchar(500) not null,
)

create table News
(
	Id int identity(1,1) primary key,
	AuthorId int foreign key references [User](Id) not null,
	DateTimeOfNews datetime not null,
	CoverPhoto varbinary(max) null,
	Content nvarchar(1000) not null,
	Title nvarchar(100) not null,
)

create table Quote
(
	Id int identity(1,1) primary key,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id) not null,
	QuoteText nvarchar(1000) not null,
)

create table Rating
(
	Id int identity(1,1) primary key,
	AppUserId int foreign key references [User](Id)  not null,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id) not null,
	RatingValue int not null,
)

create table MovieAndTVShowGenre
(
	Id int identity(1,1) primary key,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id)  not null,
	GenreId int foreign key references Genre(Id)  not null,
)

create table MovieAndTVShowNews
(
	Id int identity(1,1) primary key,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id) null,
	NewsId int foreign key references News(Id),
)

create table MovieAndTVShowPerson
(
	Id int identity(1,1) primary key,
	MovieAndTVShowId int foreign key references MovieAndTVShow(Id) not null,
	PersonId int foreign key references Person(Id) not null,
	RoleId int foreign key references Role(Id) not null,
	NameInMovie nvarchar(50) null
)
