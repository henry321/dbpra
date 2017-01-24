--#BGBLK 100
--#SET ROWS_FETCH 0 ROWS_OUT 0 
(SELECT COUNT(Bestell_Nr) AS cnt_Nr, AVG(Preis) AS avg_p, SUM(Rabatt) AS sum_r, Lieferant AS L  
FROM Bestellposten 
GROUP BY Lieferant  
HAVING COUNT(Bestell_Nr) > 660 
ORDER BY cnt_Nr) A
JOIN
(SELECT Lieferant as L ,MIN(Artikel_Nr) AS min_art, AVG(Anzahl_Verfuegb) as avg_av, SUM(Lieferpreis) AS sum_l
FROM Liefert
GROUP BY Lieferant
ORDER BY avg_av) B  
ON A.L=B.L
--#EOBLK

CREATE TABLE Posten_Summary AS ( 
	SELECT COUNT(Bestell_Nr) AS cnt_Nr, AVG(Preis) AS avg_p, SUM(Rabatt) AS sum_r, Lieferant as Lieferant
	FROM Bestellposten
	GROUP BY Lieferant)
	DATA INITIALLY DEFERRED
	REFRESH DEFERRED
	ENABLE QUERY OPTIMIZATION; 
--#BGBLK 100
--#SET ROWS_FETCH 0 ROWS_OUT 0
SELECT COUNT(Bestell_Nr) AS C, AVG(Preis) AS A, SUM(Rabatt) AS R, Lieferant AS L  
FROM Bestellposten 
GROUP BY Lieferant  
HAVING COUNT(Bestell_Nr) > 660 
ORDER BY C;
--#EOBLK
