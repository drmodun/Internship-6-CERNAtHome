/*TASK 1*/
SELECT r.Name, STRING_AGG(CONCAT(sc.surname,' ', SUBSTRING(sc.name,1,1), '.'),', ') as scientists FROM Researches r
JOIN ScientistsResearch sr ON sr.Researchid= r.researchId
JOIN Scientists sc ON sc.ScientistId= sr.scientistId
GROUP BY r.Name

/*TASK 2*/
SELECT sc.Name, sc.Surname, Sc.gender, c.name FROM scientists sc
JOIN Countries c on sc.Country=c.CountryId

/*task4*/
SELECT p.Name FROM projects p
JOIN Researches r on r.projectid=p.projectId
WHERE (DATE_PART('year', r.ReleaseTime) BETWEEN 2015 AND 2017)

/*task5*/
SELECT c.Name as Country, COUNT(r.ResearchId) as Researches, MaX(r.NumberOfQuotes) as Most_popular FROM Countries c
JOIN Scientists s on s.COuntry = c.CountryId
JOIN ScientistsResearch sr on sr.ScientistId = sr.scientistId
JOIN Researches r on r.Researchid = sr.ResearchId
GROUP BY c.name

/*task6*/
SELECT c.name, r.name FROM Countries c
JOIN Scientists s on s.COuntry = c.CountryId
JOIN ScientistsResearch sr on sr.ScientistId = sr.scientistId
JOIN Researches r on r.Researchid = sr.ResearchId
ORDER BY r.releaseTime
LIMIT(1)
/*task7*/
SELECT c.name, COunt(c.name) FROM Cities c
JOIN Hotels h on h.CityId=c.CityId
JOIN Scientists sc on sc.HotelId=h.HotelId
GROUP BY c.name
ORDER BY COUNT(c.name) DESC
/*task8*/
SELECT a.name, Avg(r.numberofquotes) as AvarageQuotes FROM Accelerators a
JOIN AcceleratorProjects ap on ap.acceleratorId = a.acceleratorId
JOIN Projects p on p.projectid = p.projectId
JOIN Researches r on r.projectId = p.projectid
GROUP BY a.name

/*task9*/
SELECT COUNT(sc.scientistid), sc.field, DATE_PART('decade', (sc.dateofbirth)) as decade, sc.Gender FROM Scientists sc
GROUP BY sc.field, decade, sc.gender
HAVING COUNT(sc.scientistId) > 20
ORDER BY decade DESC;
/*control queries*/
SELECT * FROM Cities
SELECT * FROM Countries
SelECT * FROM Hotels
SELECT c.name, sc.name FROM Scientists sc
JOIN hotels h on h.hotelid=sc.hotelid
JOIN Cities c on c.CityId = h.CityId
ORDER BY c.name
SELECT * FROM scientists
