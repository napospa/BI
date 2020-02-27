-- Most popular choice is by far Fully Flexible option, there is just one exception in every customer segment:
		-- Age: - 100+ customers prefer 'Early 21/60' days, but sample and differences are too small for conclusions
        -- Gender: Females highly prefer 'Early 60'
        -- Country: Country not provided has higher 'Early 60' (those must Females by majority)
SELECT A.RateName, COUNT(A.RateName) AS 'Total',
	'|' as 'Age:',
	-- Age part
	COUNT(
		CASE 
			WHEN B.AgeGroup = 0
            THEN 1
            ELSE NULL
		END
        ) AS '0',
        
	COUNT(
		CASE 
			WHEN B.AgeGroup = 25
            THEN 1
            ELSE NULL
		END
        ) AS '25',   
        
	COUNT(
		CASE 
			WHEN B.AgeGroup = 35
            THEN 1
            ELSE NULL
		END
        ) AS '35',
        
	COUNT(
		CASE 
			WHEN B.AgeGroup = 45
            THEN 1
            ELSE NULL
		END
        ) AS '45',
        
	COUNT(
		CASE 
			WHEN B.AgeGroup = 55
            THEN 1
            ELSE NULL
		END
        ) AS '55',
        
	COUNT(
		CASE 
			WHEN B.AgeGroup = 65
            THEN 1
            ELSE NULL
		END
        ) AS '65',
        
	COUNT(
		CASE 
			WHEN B.AgeGroup = 100
            THEN 1
            ELSE NULL
		END
        ) AS '100',
              
	-- Gender part
	'|' as 'Gender:',
            
	COUNT(
		CASE 
			WHEN B.Gender = 0
            THEN 1
            ELSE NULL
		END
        ) AS 'Female',
        
	COUNT(
		CASE 
			WHEN B.Gender = 1
            THEN 1
            ELSE NULL
		END
        ) AS 'Male',

        
	COUNT(
		CASE 
			WHEN B.Gender = 2
            THEN 1
            ELSE NULL
		END
        ) AS 'Non-binary/didn''t tell?',
               
    -- Country part, syntax is ugly because I put it together it in excel    
    -- Also I guess there might be some way how to get TOP 5 countries dynamicaly but I'm not that far (yet), in Power BI it is dynamic
    
        '|' as 'Country:',
    	COUNT(CASE WHEN B.NationalityCode = 'US'THEN 1 ELSE NULL END) AS 'US',
		COUNT(CASE WHEN B.NationalityCode = 'GB'THEN 1 ELSE NULL END) AS 'GB',
		COUNT(CASE WHEN B.NationalityCode = 'DE'THEN 1 ELSE NULL END) AS 'DE',        
		COUNT(CASE WHEN B.NationalityCode = 'SK'THEN 1 ELSE NULL END) AS 'SK',
		COUNT(CASE WHEN B.NationalityCode = 'C'THEN 1 ELSE NULL END) AS 'C',
        COUNT(CASE WHEN B.NationalityCode = 'RU'THEN 1 ELSE NULL END) AS 'RU',
        COUNT(CASE WHEN B.NationalityCode NOT IN ('US', 'GB', 'DE', 'SK', 'C', 'RU') THEN 1 ELSE NULL END) AS 'Others',
		COUNT(CASE WHEN B.NationalityCode IS NULL THEN 1 ELSE NULL END) AS 'Country not provided'     
        
FROM rate A
JOIN reservation B ON A.RateID = B.RateID
GROUP BY A.RateName WITH ROLLUP
ORDER BY Total