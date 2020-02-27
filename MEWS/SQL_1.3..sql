-- Most profitable are males from 55 to 64, interesting is category 0-24, which has overall highest Total Spent but one of lowest Average Cost 

-- I guess best would be better to again pivot data as in previous cases, I just wanted to try something different
(SELECT 
	AgeGroup, ROUND(SUM(NightCost_Sum), 2) as 'Spent Total', ROUND(AVG(NightCost_Sum / OccupiedSpace_Sum), 2) as 'Average Cost per Space'
FROM reservation
WHERE OccupiedSpace_Sum <> 0
GROUP BY AgeGroup
ORDER BY AVG(NightCost_Sum / OccupiedSpace_Sum) DESC
LIMIT 100
)

UNION ALL	
SELECT '---', '---', '---'
UNION ALL
SELECT 'Gender:', '', ''
UNION ALL

(SELECT 
	REPLACE(REPLACE(REPLACE(Gender, 0, 'Female'), 1, 'Male'), 2, 'Not provided'), ROUND(SUM(NightCost_Sum), 2) as 'Spent Total', ROUND(AVG(NightCost_Sum / OccupiedSpace_Sum), 2) as 'Average Cost per Space'
FROM reservation
WHERE OccupiedSpace_Sum <> 0
GROUP BY Gender
ORDER BY AVG(NightCost_Sum / OccupiedSpace_Sum) DESC
LIMIT 100
)

UNION ALL	
SELECT '---', '---', '---'
UNION ALL
SELECT 'Is Online Checkin:', '', ''
UNION ALL

(SELECT 
	REPLACE(REPLACE(IsOnlineCheckin, 0, 'No'), 1, 'Yes'), ROUND(SUM(NightCost_Sum), 2) as 'Spent Total', ROUND(AVG(NightCost_Sum / OccupiedSpace_Sum), 2) as 'Average Cost per Space'
FROM reservation
WHERE OccupiedSpace_Sum <> 0
GROUP BY IsOnlineCheckin
ORDER BY AVG(NightCost_Sum / OccupiedSpace_Sum) DESC
LIMIT 100
)

UNION ALL	
SELECT '---', '---', '---'
UNION ALL
SELECT 'Nationality Code:', '', ''
UNION ALL

(SELECT 
	NationalityCode, ROUND(SUM(NightCost_Sum), 2) as 'Spent Total', ROUND(AVG(NightCost_Sum / OccupiedSpace_Sum), 2) as 'Average Cost per Space'
FROM reservation
WHERE OccupiedSpace_Sum <> 0
GROUP BY NationalityCode
ORDER BY AVG(NightCost_Sum / OccupiedSpace_Sum) DESC
LIMIT 100
)