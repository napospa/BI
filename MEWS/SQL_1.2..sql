-- most online checkins are done in age groups between 25 and 55, by males and at the start of the week

SELECT AgeGroup, COUNT(AgeGroup) AS 'Total', 

        '|' as 'Gender:',
        
		COUNT(
		CASE 
			WHEN Gender = 1
            THEN 1
            ELSE NULL
		END
        ) AS 'Male',
        
		COUNT(
		CASE 
			WHEN Gender = 0
            THEN 1
            ELSE NULL
		END
        ) AS 'Female',
        
		COUNT(
		CASE 
			WHEN Gender = 2
            THEN 1
            ELSE NULL
		END
        ) AS 'Not Provided',
                
		'|' as 'Weekday:',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 0
            THEN 1
            ELSE NULL
		END
        ) AS 'MO',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 1
            THEN 1
            ELSE NULL
		END
        ) AS 'TU',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 2
            THEN 1
            ELSE NULL
		END
        ) AS 'WE',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 3
            THEN 1
            ELSE NULL
		END
        ) AS 'TH',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 4
            THEN 1
            ELSE NULL
		END
        ) AS 'FR',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 5
            THEN 1
            ELSE NULL
		END
        ) AS 'SA',
        
        COUNT(
		CASE 
			WHEN WEEKDAY(CreatedUTC) = 6
            THEN 1
            ELSE NULL
		END
        ) AS 'SU'
        
        
        
FROM reservation
WHERE IsOnlineCheckin = 1
GROUP BY AgeGroup WITH ROLLUP
ORDER BY Total