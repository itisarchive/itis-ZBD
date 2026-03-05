-- 1.

CREATE TABLE Osoba
(
    Id       INT,
    Nazwisko VARCHAR(50)
)


-- 2.

SET IMPLICIT_TRANSACTIONS ON;

SELECT *
FROM Osoba;

INSERT INTO Osoba
VALUES (1, 'Kowalski');

SELECT *
FROM Osoba;

COMMIT;

-- SELECT nie wykonuje się bez COMMIT w drugim oknie.

-- 3.

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- SELECT wykonał się i odczytał niezatwierdzony INSERT z drugiego okna.

-- 4.

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SELECT *
FROM Osoba;

INSERT INTO Osoba
VALUES (3, 'Iksiński');

-- SELECT założył blokadę, INSERT czeka na jej zwolnienie.

-- 5.

DELETE
FROM Osoba;
INSERT INTO Osoba
VALUES (1, 'Lenkiewicz');
INSERT INTO Osoba
VALUES (2, 'Kowalski');
INSERT INTO Osoba
VALUES (3, 'Iksinski');
COMMIT;

ALTER
DATABASE nazwa_bazy SET allow_snapshot_isolation ON;

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
SET IMPLICIT_TRANSACTIONS ON;

SELECT *
FROM Osoba;

UPDATE Osoba
SET Nazwisko = 'Nowak'
WHERE Id = 2;
COMMIT;

SELECT *
FROM Osoba;

UPDATE Osoba
SET Nazwisko = 'Iksinski'
WHERE Id = 2;

-- UPDATE nie wykonał się, transakcja została wycofana.

-- 6.

CREATE TABLE test
(
    Id        INT,
    Zawartosc INT
)
    GO

DECLARE
@a INT
SET @a = 1
WHILE @a &lt;
100000
BEGIN
INSERT INTO test (Zawartosc)
VALUES (CONVERT(INT, RAND() * 100000)) SET @a = @a + 1
END
GO

SET NOCOUNT ON
SET IMPLICIT_TRANSACTIONS ON
DECLARE
kurs SCROLL CURSOR FOR
SELECT Id, Zawartosc
FROM Test
DECLARE
@Id INT, @Zawartosc INT, @a INT, @licz INT
SET @licz = 0
OPEN kurs
WHILE 1=1
BEGIN
SET
@a = CONVERT(INT,RAND()*99999+1)
FETCH ABSOLUTE @a FROM kurs INTO @Id, @Zawartosc
IF @a % 2 = 0
BEGIN
UPDATE Test
SET Zawartosc = CONVERT(INT, RAND() * 100000)
WHERE Id = @a
END
ELSE
BEGIN
DELETE
FROM Test
WHERE Id = @a
    INSERT
INTO Test (Id, Zawartosc)
VALUES (@a, CONVERT (INT, RAND() *

    100000))
END
IF
@a % 10 = 0 COMMIT
SET @licz = @licz + 1
PRINT @licz
END
CLOSE kurs DEALLOCATE kurs

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET NOCOUNT ON
DECLARE
@licz INT, @tmp BIGINT
SET @licz = 0
WHILE 1=1
BEGIN
SELECT @tmp = SUM(CONVERT(BIGINT, Zawartosc))
FROM Test SET @licz = @licz + 1
PRINT @licz

END

-- Porównanie:
-- poziom P1 P2
-- bez 3600 8305
-- Read Commited 3200 1285
-- Read Uncommited 1747 4187
-- Serializable 3467 365
-- Snapshot 1632 2574