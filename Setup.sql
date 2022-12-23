CREATE TABLE Accelerators(
	AcceleratorId SERIAL PRIMARY KEY,		
	Name VarChar(30) NOT NULL

);
CREATE TABLE PROJECTS(
	ProjectId SERIAL PRIMARY KEY,
	Name VarCHar(30) NOT NULL
);
CREATE TABLE AcceleratorProjects(
	AccProjId Serial Primary Key,
	AcceleratorId INT REFERENCES Accelerators(AcceleratorId) ON DELETE CASCADE,
	ProjectId INT REFERENCES Projects(ProjectId) ON DELETE CASCADE	
);
CREATE TABLE Countries(
	CountryId SERIAL PRIMARY KEY,
	Name VarChar(30) NOT NULL,
	Population Int NOT NULL CHECK (Population>0),
	PPP decimal NOT NULL CHECK (PPP>0.00)
);
CREATE TABLE Cities(
	Cityid SERIAL PRIMARY KEY,
	Name VarChar(30) Not null,
	CountryId INT REFERENCES Countries(CountryId)
);

CREATE TABLE Hotels(
	HotelId SERIAL PRIMARY KEY,
	name VarChar(30) NOT NULL,
	CityId INT REFERENCES Cities(CityId),
	Capacity int NOT NULL CHECK (Capacity>0)
);

CREATE TABLE Researches(
	ResearchId SERIAL PRIMARY KEY,
	Name VarChar(75) NOt NULL,
	ProjectId INT REFERENCES Projects(ProjectId) ON DELETE CASCADE,
	NumberOfQuotes Int NOT NULL CHECK (NumberOfQuotes>0),
	ReleaseTime Timestamp NOT NULL CHECK (ReleaseTime<NOW())
);
CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	Name VarChar(20) NOT NULL,
	Surname VarChar(20) NOT NULL,
	DateOfBirth TimesTamp NOT NULL CHECK (NOW()-DateOfBirth>INTERVAL '18 years'),
	Gender VarChar NOT NULL,
	Field VarChar(20) NOT NULL,
	Country Int REFERENCES Countries(CountryId) ON DELETE CASCADE,
	HotelId Int REFERENCES Hotels(HotelId) ON DELETE CASCADE
);


CREATE TABLE ScientistsResearch(
	ScientistId int REFERENCES Scientists(ScientistId) ON DELETE CASCADE,
	ResearchId int REFERENCES Researches(ResearchId) ON DELETE CASCADE,
	PRIMARY KEY (ScientistId, ResearchId)
);

/*RESET
DROP TABLE ACCELERATORS CASCADE;
DROP TABLE PROJECTS CASCADE;
DROP TABLE HOTELS CASCADE;
DROP TABLE COUNTRIES CASCADE;
DROP TABLE RESEARCHES CASCADE;
DROP TABLE SCIENTISTS CASCADE;
DROP TABLE AcceleratorProjects CASCADE;
DROP TABLE SCIENTistsRESEARCH CASCADE;
DROP TABLE Cities CASCADE;
*/