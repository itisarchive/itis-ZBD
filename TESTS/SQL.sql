-- 1.
UPDATE Registration
SET Price = Price * 1.1
WHERE RegistrationDate > '2025-01-20';

-- 2.
SELECT FName, LName, Name, Price
FROM Attendee
         INNER JOIN Registration ON Attendee.IdAttendee = Registration.IdAttendee
         INNER JOIN Session S on Registration.IdSession = S.IdSession
WHERE Price > (SELECT AVG(Price)
               FROM Registration
               WHERE Registration.IdAttendee = Attendee.IdAttendee);

-- 3.
SELECT COUNT(1)
FROM Attendee
WHERE Birthdate IS NULL;

-- 4.
SELECT Name, StartTime, EndTime
FROM Session
         INNER JOIN Registration ON Session.IdSession = Registration.IdSession
GROUP BY Name, StartTime, EndTime
HAVING AVG(Registration.Price) > (SELECT AVG(Price) FROM Registration);

-- 5.
SELECT FName, LName, Name, Price
FROM Attendee
         INNER JOIN Registration ON Attendee.IdAttendee = Registration.IdAttendee
         INNER JOIN Session on Registration.IdSession = Session.IdSession
WHERE Registration.RegistrationDate >= '2025-02-15'
ORDER BY Registration.RegistrationDate;

-- 6.
SELECT FName, LName, COUNT(Session.IdSession) AS SessionCount
FROM Speaker
         LEFT JOIN Session ON Speaker.IdSpeaker = Session.IdSpeaker
WHERE FName LIKE '%b'
   OR FName LIKE '%c'
GROUP BY FName, LName
ORDER BY SessionCount DESC;

-- 7.
SELECT Name
FROM Session
         LEFT JOIN Registration ON Session.IdSession = Registration.IdSession
WHERE Registration.IdAttendee IS NULL
  AND EndTime < '2025-01-10';

-- 8.
SELECT FName, LName, Name, AVG(Price) AS AvgPrice
FROM Speaker
         INNER JOIN Session ON Speaker.IdSpeaker = Session.IdSpeaker
         INNER JOIN Registration ON Session.IdSession = Registration.IdSession
GROUP BY Speaker.IdSpeaker, FName, LName, Name
HAVING AVG(Price) >= 10
   AND AVG(Price) = (SELECT MAX(AvgPriceSub)
                     FROM (SELECT AVG(InnerRegistration.Price) AS AvgPriceSub
                           FROM Session InnerSession
                                    INNER JOIN Registration InnerRegistration
                                               ON InnerSession.IdSession = InnerRegistration.IdSession
                           WHERE InnerSession.IdSpeaker = Speaker.IdSpeaker
                           GROUP BY InnerSession.Name) AS SubQuery);

-- 9.
SELECT FName, LName, COUNT(Registration.IdSession) AS SessionCount
FROM Attendee
         INNER JOIN Registration ON Attendee.IdAttendee = Registration.IdAttendee
GROUP BY FName, LName
HAVING COUNT(Registration.IdSession) >= 10
ORDER BY SessionCount;

-- 10.
SELECT FName, LName
FROM Attendee
WHERE NOT EXISTS (SELECT 1
                  FROM Registration
                  WHERE Registration.IdAttendee = Attendee.IdAttendee)
ORDER BY LName, FName;
