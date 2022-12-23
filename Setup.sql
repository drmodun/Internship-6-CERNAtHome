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
	Population Int NOT NULL,
	PPP decimal NOT NULL
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
	Capacity int NOT NULL
);

CREATE TABLE Researches(
	ResearchId SERIAL PRIMARY KEY,
	Name VarChar(75) NOt NULL,
	ProjectId INT REFERENCES Projects(ProjectId) ON DELETE CASCADE,
	NumberOfQuotes Int NOT NULL,
	ReleaseTime Timestamp NOT NULL
);
CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	Name VarChar(20) NOT NULL,
	Surname VarChar(20) NOT NULL,
	DateOfBirth Date NOT NULL,
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

/*ALTER TABLE Scientists
//ADD CONSTRAINT DateCheck CHECK (DateOfBirth-INTERVAL '18 years'>INTERVAL '0 seconds');
*//*RESET
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