SELECT*FROM treningi
--Sprawdzenie jaki typ aktywności spalił najwięcej kalorii w jednym treningu i w jakim dystansie
SELECT typ_aktywnosci
		,kalorie
		,dystans
FROM treningi
ORDER BY kalorie DESC
LIMIT 3;

--Suma spalonych kalorii w danym typie aktywności
		
SELECT typ_aktywnosci
		,SUM(kalorie) AS suma_kalorii
FROM treningi
GROUP BY typ_aktywnosci;

--Całkowity dystans

SELECT typ_aktywnosci
		,SUM(dystans) AS dystans
FROM treningi
GROUP BY typ_aktywnosci;

--Dzień tygodnia w którym, najczęsciej były wykonywane ćwiczenia
SELECT dzie_tygodnia
		,COUNT(dzie_tygodnia) AS sum_treningow
FROM treningi
GROUP BY dzie_tygodnia
ORDER BY sum_treningow DESC;

--Ćwiczenie generujące maksymalne tętno

SELECT MAX(maksymalne_tetno) AS max_tetno
		,typ_aktywnosci
FROM treningi
GROUP BY typ_aktywnosci
ORDER BY max_tetno DESC;
-- Podział na poziomy aktywności ze względu na spalone kalorie
SELECT kalorie,
 (CASE 
  	WHEN kalorie <150 THEN 'tryb siedzący'
  	WHEN kalorie >=150 AND  kalorie <300 THEN 'lekka aktywność'
  	WHEN kalorie >=300 AND kalorie <600 THEN 'średnia aktywność'
  	ELSE 'wysoka aktywność'
  END) AS poziom_aktywnosci
FROM treningi
ORDER BY kalorie;