-- 1.

CREATE TABLE test
(
    Id        INT IDENTITY,
    Zawartosc INT
)
    GO

DECLARE
@a INT
SET @a = 1
WHILE @a < 100000
BEGIN
INSERT INTO test (Zawartosc)
VALUES (CONVERT(INT, RAND() * 100000)) SET @a = @a + 1
END
GO

-- Utworzono 99999 rekordów

-- 2.

SELECT *
FROM test
WHERE Zawartosc = 12345

-- Table scan, Cost – 0,276244

-- 3.

-- Index seek, Cost – 0,0076392

-- 4.

SELECT TerritoryDescription
FROM Territories
ORDER BY TerritoryDescription

-- Bez indeksu – Table scan, cost – 0,0151753
-- Z indeksem – Index Scan (Non-Clustered), cost – 0,0033403

-- 5.

SELECT CustomerId, ShipCountry
FROM Orders
WHERE ShipCountry = 'Austria'

-- Bez indeksu – Clustered Index Scan, cost – 0,0182691
-- Z indeksem – Index Seek (Non-Clustered), cost – 0,003326

-- 6.

SELECT *
FROM test
WHERE Zawartosc BETWEEN 10000 and 20000

-- Table scan, cost – 0,276244
-- Non-Clustered Indeks – db nie skorzystało, bez zmian
-- Clustered Index Scan, cost – 0,0320815

-- 7.

SELECT *
FROM test
ORDER BY Zawartosc

-- Bez indeksu, cost – 4,71888
-- Z indeksem, cost – 0,0296244

-- 8.

DROP TABLE test
DROP TABLE test2
CREATE TABLE test
(
    Id        INT IDENTITY,
    Zawartosc INT
)
CREATE TABLE test2
(
    Id        INT IDENTITY,
    Zawartosc VARCHAR(500)
)
    GO

DECLARE
@a INT
SET @a = 1
WHILE @a < 100000
BEGIN
INSERT INTO test (Zawartosc)
VALUES (CONVERT(INT, RAND() * 100000)) SET @a = @a + 1
END
GO

DECLARE
@a INT, @txt VARCHAR(500), @txt2 VARCHAR(10)
SET @a = 1
SET @txt2 = '1234567890'
SET @txt = ''
WHILE @a < 50
BEGIN
	SET
@txt = @txt + @txt2
	SET @a = @a + 1
END
SET
@a = 1
WHILE @a < 100000
BEGIN
INSERT INTO test2 (Zawartosc)
VALUES (CONVERT(VARCHAR, (CONVERT(INT, RAND() * 100000))) + @txt) SET @a = @a + 1
END
GO

-- Tabela test, depth indeksu: 2
-- Tabela test2, depth indeksu: 5

-- 9.

DROP TABLE test
DROP TABLE test2
CREATE TABLE test
(
    Id        INT PRIMARY KEY,
    Zawartosc VARCHAR(10)
)
CREATE TABLE test2
(
    Id        INT IDENTITY PRIMARY KEY,
    Zawartosc INT,
    IdTest    INT REFERENCES test
) GO

INSERT INTO test (Id, Zawartosc) VALUES (1, 'aaa')
INSERT INTO test (Id, Zawartosc) VALUES (2, 'bbb')
INSERT INTO test (Id, Zawartosc) VALUES (3, 'ccc')
INSERT INTO test (Id, Zawartosc) VALUES (4, 'ddd')
INSERT INTO test (Id, Zawartosc) VALUES (5, 'eee')

DECLARE
@a INT
SET @a = 1
WHILE @a < 100000
BEGIN
INSERT INTO test2 (Zawartosc, IdTest)
VALUES (CONVERT(INT, RAND() * 100000), CONVERT(INT, RAND() * 5) + 1) SET @a = @a + 1
END
GO

SELECT *
FROM test
         INNER JOIN test2 ON test2.IdTest = test.id

-- Bez indeksu, cost – 1,08926
-- Z indeksem niepogrupowanym – bez zmian
-- Z indeksem pogrupowanym, cost – 0,608106

-- 10.

-- Skrypt bez indeksu, czas – 22s
-- Skrypt z jednym indeksem, czas – 21s
-- Skrypt z wieloma indeksami, czas – 23s

-- 11.

DROP TABLE test
CREATE TABLE test
(
    Id        INT IDENTITY,
    Zawartosc INT
)
    GO

DECLARE
@a INT
SET @a = 1
WHILE @a < 100000
BEGIN
INSERT INTO test (Zawartosc)
VALUES (CONVERT(INT, RAND() * 100000)) SET @a = @a + 1
END
GO

-- Fillfactor 100, pages: 224, total fragmentation: 1,24%
-- Po wstawieniu, total fragmentation: 98,93%
-- Fillfactor 50, pages: 448, total fragmentation: 0,67 %
-- Po wstawieniu, total fragmentation: 65,67%
-- Przy mniejszym fillfactor tracimy więcej miejsca na sam indeks, ale dane po wstawieniu są mniej pofragmentowane.
