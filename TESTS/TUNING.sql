-- 1.

-- Wykonane operacje:
-- Usunięcie istniejącego indeksu z tabeli Sales.SalesOrderDetail
DROP INDEX IX_SalesOrderDetail_UnitPrice ON Sales.SalesOrderDetail;
-- Założenie indeksu pogrupowanego w tabeli Sales.SalesOrderDetail na kolumnie UnitPrice
CREATE CLUSTERED INDEX IX_SalesOrderDetail_UnitPrice ON Sales.SalesOrderDetail(UnitPrice);

-- Kosz przed: 10,4892
-- Koszt po: 1,15359

-- 2.

-- Wykonane operacje:
-- Założono indeks bitmapowy w tabeli VEHICLE na kolumnie vsize.
CREATE BITMAP INDEX for_vsize ON VEHICLE(vsize);

-- Koszt przed: 5
-- Koszt po: 3

-- 3.

-- SQL po optymalizacji:
SELECT ProductId, AVG(Quantity) FROM [Order Details]
WHERE ProductId > 45
GROUP BY ProductID

-- 4.

-- SELECT zwraca 1
