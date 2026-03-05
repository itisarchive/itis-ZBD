-- 1.

CREATE TABLE test
(
    Id       INTEGER,
    Wartosc  INTEGER,
    Wartosc2 INTEGER
);

DECLARE
licz INTEGER;
  wartosc
INTEGER;
  wartosc2
INTEGER;
BEGIN
FOR licz IN 1..100000
  LOOP
SELECT ROUND(dbms_random.value(1, 100000), 0)
INTO wartosc
FROM dual;
SELECT ROUND(dbms_random.value(1, 10), 0)
INTO wartosc2
FROM dual;
INSERT INTO test (Id, Wartosc, Wartosc2)
VALUES (licz, wartosc, wartosc2);
END LOOP;
END;

-- Utworzono tabelę

-- 2.

SELECT *
FROM test
WHERE wartosc = 12345;

CREATE INDEX nazwa ON tabela (kolumna);

-- koszt przed: 103
-- koszt po: 1

-- 3.

-- koszt przed: 103
-- koszt po: 103 (nie użył indeksu)

-- 4.

CREATE
BITMAP INDEX nazwa ON tabela (kolumna);

-- mocno selektywna, koszt przed: 103
-- mocno selektywna, koszt po: 1
-- słabo selektywna, koszt przed: 103
-- słabo selektywna, koszt po: 103 (nie użył indeksu)

-- 5.

SELECT *
FROM test
WHERE wartosc = 12345
   OR wartosc2 = 5;

-- koszt przed: 103
-- koszt po: 103 (nie użył indeksu)

-- 6.

SELECT *
FROM test
WHERE wartosc2 + id = 1234;

CREATE INDEX t ON test (wartosc2 + id);

-- koszt przed: 103
-- koszt po: 5

-- 7.

SELECT *
FROM test
WHERE id BETWEEN 10000 AND 30000;

CREATE TABLE test
(
    Id       INTEGER PRIMARY KEY,
    Wartosc  INTEGER,
    Wartosc2 INTEGER
) ORGANIZATION INDEX;

-- koszt bez indeksu: 103
-- koszt z domyślnym indeksem: 96
-- koszt w tabeli index-organized: 3

-- 8.

CREATE
CLUSTER testowy (IdDzial INTEGER);
CREATE INDEX t ON CLUSTER testowy;
CREATE TABLE dzial
(
    IdDzial INTEGER PRIMARY KEY,
    Nazwa   VARCHAR2(10)
) CLUSTER testowy(IdDzial);
CREATE TABLE pracownik
(
    IdPracownik INTEGER PRIMARY KEY,
    Nazwisko    VARCHAR2(20),
    IdDzial     INTEGER REFERENCES dzial
) CLUSTER testowy(IdDzial);

INSERT INTO dzial (IdDzial, Nazwa)
VALUES (1, 'Dzial 1');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (2, 'Dzial 2');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (3, 'Dzial 3');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (4, 'Dzial 4');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (5, 'Dzial 5');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (6, 'Dzial 6');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (7, 'Dzial 7');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (8, 'Dzial 8');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (9, 'Dzial 9');
INSERT INTO dzial (IdDzial, Nazwa)
VALUES (10, 'Dzial 10');

DECLARE
licz INTEGER;
  wartosc
INTEGER;
BEGIN
FOR licz IN 1..150000
  LOOP
SELECT ROUND(dbms_random.value(1, 10), 0)
INTO wartosc
FROM dual;
INSERT INTO pracownik (IdPracownik, Nazwisko, iddzial)
VALUES (licz, 'Nazwisko ' || licz, wartosc);
END LOOP;
END;

SELECT *
FROM Pracownik
         INNER JOIN Dzial ON Pracownik.IdDzial = Dzial.IdDzial
WHERE Dzial.IdDzial = 7;

-- koszt z klastrem: 2
-- koszt bez klastra: 172

-- 9.

CREATE
MATERIALIZED VIEW pm
BUILD IMMEDIATE
REFRESH COMPLETE
ON COMMIT
WITH PRIMARY KEY
AS
SELECT Dzial.Nazwa, COUNT(*)
FROM Dzial
         INNER JOIN Pracownik ON Pracownik.IdDzial = Dzial.IdDzial
GROUP BY Dzial.Nazwa
ORDER BY 2

-- koszt z perspektywy zmaterializowanej: 3
-- koszt bezpośrednio z selecta: 183

-- 10.

SELECT *
FROM Pracownik
WHERE IdDzial IN (1, 2, 3);

CREATE TABLE dzial
(
    IdDzial INTEGER PRIMARY KEY,
    Nazwa   VARCHAR2(10)
);
CREATE TABLE pracownik
(
    IdPracownik INTEGER PRIMARY KEY,
    Nazwisko    VARCHAR2(20),
    IdDzial     INTEGER REFERENCES dzial
) PARTITION BY LIST (IdDzial) (
  PARTITION p1 VALUES (1, 2, 3) TABLESPACE studenci,
  PARTITION p2 VALUES (4, 5, 6) TABLESPACE studenci,
  PARTITION p3 VALUES (7, 8, 9, 10) TABLESPACE studenci
);

-- koszt przed partycjonowaniem: 171
-- koszt po partycjonowaniu: 175

-- 11.

DROP
...
PURGE RECYCLEBIN;
