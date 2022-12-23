/*TASK 1*/
SELECT r.Name, STRING_AGG(CONCAT(sc.surname,' ', SUBSTRING(sc.name,1,1), '.'),', ') as scientists FROM Researches r
JOIN ScientistsResearch sr ON sr.Researchid= r.researchId
JOIN Scientists sc ON sc.ScientistId= sr.scientistId
GROUP BY r.Name

/*TASK 2*/
SELECT sc.Name, sc.Surname, Sc.gender, c.name FROM scientists sc
JOIN Countries c on sc.Country=c.CountryId
/*task3*/

SELECT p.Name as Project, COALESCE(a.name, 'NEMA GA') as Accelerator FROM projects p
LEFT JOIN acceleratorProjects ap on ap.projectId=p.projectId
LEFT JOIN accelerators a on a.acceleratorid=ap.acceleratorId
/*task4*/
SELECT p.Name FROM projects p
JOIN Researches r on r.projectid=p.projectId
WHERE (DATE_PART('year', r.ReleaseTime) BETWEEN 2015 AND 2017)

/*task5*/
SELECT c.Name as Country, COUNT(r.ResearchId) as Researches, MaX(r.NumberOfQuotes) as Most_popular FROM Countries c
JOIN Scientists s on s.COuntry = c.CountryId
JOIN ScientistsResearch sr on sr.ScientistId = s.scientistId
JOIN Researches r on r.Researchid = sr.ResearchId
GROUP BY c.name

/*task6*/
SELECT c.name, MIN(r.releaseTime), (SELECT rs.name FROM Researches rs where (rs.ReleaseTIme = MIN(r.ReleaseTime))) FROM Countries c
JOIN Scientists s on s.COuntry = c.CountryId
JOIN ScientistsResearch sr on sr.ScientistId = s.scientistId
JOIN Researches r on r.Researchid = sr.ResearchId
GROUP BY c.CountryID
ORDER BY MIN(r.releaseTIme)
 
/*task7*/
SELECT c.name, COunt(c.name) FROM Cities c
JOIN Hotels h on h.CityId=c.CityId
JOIN Scientists sc on sc.HotelId=h.HotelId
GROUP BY c.name
ORDER BY COUNT(c.name) DESC
/*task8*/
SELECT a.name, ROUND(Avg(r.numberofquotes), 5) as AvarageQuotes FROM Accelerators a
JOIN AcceleratorProjects ap on ap.acceleratorId = a.acceleratorId
JOIN Projects p on ap.projectid = p.projectId
JOIN Researches r on r.projectId = p.projectid
GROUP BY a.acceleratorId
/*task 9*
Zadatatk malo cudan, nmikada nece tocno se poklopit bas dvadeset znanstvenika svi istog spola istog desetljeca i istog fielda, nisam sigruan jeli se mislilo da napraimo ovu tablicu dvojeno ili nesto slicno ali nisan bio siguran po tekstu zadatka, zasad cu ostavit ovako*/
SELECT COUNT(sc.scientistid), sc.gender, sc.field, DATE_PART('decade', (sc.dateofbirth)) as decade from scientists sc/*, DATE_PART('decade', (sc.dateofbirth)) as decade, sc.Gender FROM Scientists sc*/
GROUP BY sc.gender, sc.field, decade
HAVING COUNT(sc.scientistId) > 20
ORDER BY sc.gender, sc.field DESC;
/*control queries*/
SELECT * FROM Cities
SELECT * FROM Countries
SelECT * FROM Hotels
SELECT sc.name FROM Scientists sc
WHERE sc.field='Matematika'
JOIN hotels h on h.hotelid=sc.hotelid
JOIN Cities c on c.CityId = h.CityId
ORDER BY c.name
SELECT * FROM scientists
SELECT * FROM RESEARCHES
SELECT * FROM Accelerators
SELECT * FROM acceleratorPROJECTS

ORDER BY ReleaseTIme