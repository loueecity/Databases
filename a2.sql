
   
CREATE TABLE MoSpo_HallOfFame 
( hoFdriverId INT UNSIGNED NOT NULL,
  hoFYear YEAR CHECK ((hoFYear >=1901 AND hoFYear <=2155) OR hoFYear=0000),
  hoFSeries VARCHAR(9) NOT NULL CHECK(hoFSeries='BritishGT' OR hoFSeries='Formula1' OR hoFSeries='FormulaE' OR hoFSeries='SuperGT'),
  hoFImage VARCHAR(200),
  hoFWins INT UNSIGNED DEFAULT '0' CHECK(hoFWins >= 0 AND hoFWins <=99),
  hoFBestRaceName VARCHAR(100),
  hoFBestRaceDate DATE,
  PRIMARY KEY(hoFdriverId, hoFYear),
  CONSTRAINT hoFdriverId_fk FOREIGN KEY (hoFdriverId) REFERENCES MoSpo_Driver(driverId) ON DELETE CASCADE,
  CONSTRAINT hoFrace_fk FOREIGN KEY (hoFBestRaceName,hoFBestRaceDate) REFERENCES MoSpo_Race(raceName,raceDate) ON DELETE SET NULL
  );
   

 
-- @@02

ALTER TABLE MoSpo_Driver
ADD driverWeight DEC(3,1);


-- @@03
UPDATE MoSpo_RacingTeam
SET teamPostCode = 'HP135PN'
WHERE teamName ='Beechdean Motorsport';

-- @@04
DELETE FROM MoSpo_Driver WHERE UPPER(driverLastname) LIKE 'Senna' OR UPPER(driverFirstname) LIKE 'Ayrton';

-- @@05
SELECT COUNT(teamName) AS 'numberTeams' FROM MoSpo_RacingTeam;


-- @@06
SELECT driverId AS driverId, CONCAT (LEFT(driverFirstname, 1) ,  ' ' , driverLastname) AS driverName, driverDOB
FROM MoSpo_Driver WHERE LEFT(driverFirstname,1) = LEFT(driverLastname,1);


-- @@07
SELECT driverTeam AS teamName, COUNT(*) AS numberOfDriver FROM MoSpo_Driver 
GROUP BY driverTeam HAVING numberOfDriver > 1;


-- @@08
SELECT raceName, raceDate FROM MoSpo_RACE

