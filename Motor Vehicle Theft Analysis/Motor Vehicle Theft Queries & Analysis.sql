                                        -- Analytical questions and SQL query ideas based on the Motor Vehicle Thefts Dataset
                                        
-- 1. What are the most commonly stolen makes and models of vehicles? (Vehicle Thefts by Make and Model)
-- 2. Which regions and countries have the highest number of vehicle thefts? (Vehicle Thefts by Region and Country)
-- 3. How have vehicle thefts trended over time? (Trend Analysis Over Time by Month and Year)
-- 4. Are there any seasonal patterns in vehicle thefts? (Seasonal Patterns in Vehicle Thefts)
-- 5. What types of vehicles are most commonly stolen? (Vehicle Type Analysis)
-- 6. Is there a correlation between the population/density of a region and the number of vehicle thefts? (Impact of Population and Density)
-- 7. What are the most common colors of stolen vehicles? (Color Analysis)
-- 8. What are the most stolen vehicles by model year? (Top Stolen Vehicles by Model Year)
-- 9. What are the most stolen vehicles by model year and its Make name? (Top Stolen Vehicles by Model Year & Make Name)
-- 10. Are certain vehicle descriptions (e.g., luxury, sports, economy) more prone to theft? (Correlation Between Vehicle Description and Theft)
-- 11. How do vehicle thefts vary by population size categories (small, medium, large regions)? (Vehicle Thefts by Population Size Categories)
-- 12. What is the average age of the vehicles that are stolen? (Average age of stolen vehicles)
-- 13. Relationship Between Vehicle Make and Theft Likelihood
-- 14. Vehicle Theft by Season

SELECT * 
	FROM locations;

SELECT * 
	FROM make_details;
    
SELECT * 
	FROM stolen_vehicles;
    
SELECT 
	COUNT(*) AS Stolen_Vehicles
FROM stolen_vehicles;

			-- 1. What are the most commonly stolen makes and models of vehicles? (Vehicle Thefts by Make and Model)
SELECT 
	md.Make_name, 
	COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Make_details md 
USING (make_id)
GROUP BY md.Make_name
ORDER BY Total_Stolen DESC;

			-- 2. Which regions and country have the highest number of vehicle thefts? (Vehicle Thefts by Region and Country)
SELECT 
	l.Region, l.Country, 
	COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l 
USING (location_id)
GROUP BY l.Region, l.Country
ORDER BY Total_Stolen DESC;

			-- 3. How have vehicle thefts trended over time? (Trend Analysis Over Time by Month and Year)
SELECT 
	DATE_FORMAT(date_stolen, '%Y') AS Year, 
	COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles
GROUP BY Year
ORDER BY Year;

			-- 4. Are there any seasonal patterns in vehicle thefts? (Seasonal Patterns in Vehicle Thefts)
SELECT 
	DATE_FORMAT(date_stolen, '%M') AS Month, 
	COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles
GROUP BY Month
ORDER BY Total_Stolen DESC;


			-- 5. What types of vehicles are most commonly stolen? (Vehicle Type Analysis)
SELECT 
	vehicle_type, 
	COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles
GROUP BY vehicle_type
ORDER BY Total_Stolen DESC;

			-- 6. Is there a correlation between the population/density of a region and the number of vehicle thefts? (Impact of Population and Density)
SELECT 
	l.Region, l.Population, l.Density, 
	COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l 
USING(location_id)
GROUP BY l.Region, l.Population, l.Density
ORDER BY Total_Stolen DESC;
    
			-- 7. What are the most common colors of stolen vehicles? (Color Analysis)
SELECT 
	color, 
	COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles 
GROUP BY color
ORDER BY Total_Stolen DESC;

			-- 8. What are the most stolen vehicles by model year? (Top Stolen Vehicles by Model Year)
SELECT 
	model_year, 
	COUNT(vehicle_id) AS Total_Stolen
FROM stolen_vehicles
GROUP BY model_year
ORDER BY Total_Stolen DESC;

			-- 9. What are the most stolen vehicles by model year and its Make name? (Top Stolen Vehicles by Model Year & Make Name)
SELECT 
	sv.model_year, 
    md.Make_name, 
	COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Make_details md 
USING(Make_id)
GROUP BY sv.model_year, md.Make_name
ORDER BY Total_Stolen DESC;
    
			-- 10.  Are certain vehicle descriptions (e.g., luxury, sports, economy) more prone to theft? (Correlation Between Vehicle Description and Theft)
SELECT 
	vehicle_desc AS Vehicle_Description, 
	COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles 
GROUP BY Vehicle_Description
ORDER BY Total_Stolen DESC;
    
			-- 11. How do vehicle thefts vary by population size categories (small, medium, large regions)? (Vehicle Thefts by Population Size Categories)
SELECT 
	CASE 
		WHEN l.Population < 50000 THEN 'Small'
		WHEN l.Population BETWEEN 50000 AND 200000 THEN 'Medium'
		ELSE 'Large'
	END AS Population_Size_Category,
	COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l 
USING(location_id)
GROUP BY Population_Size_Category
ORDER BY Total_Stolen DESC;

			-- 12. Is there a relationship between regional density levels and vehicle thefts? (Vehicle Thefts by Density Levels)
SELECT 
	CASE 
		WHEN l.Density < 100 THEN 'Low Density'
		WHEN l.Density BETWEEN 100 AND 500 THEN 'Medium Density'
		ELSE 'High Density'
	END AS Density_Level,
	COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l 
USING(location_id)
GROUP BY Density_Level
ORDER BY Total_Stolen DESC;

			-- 12. What is the average age of the vehicles that are stolen? (Average age of stolen vehicles)
SELECT 
    vehicle_type, 
    AVG(YEAR(CURDATE()) - model_year) AS Average_Vehicle_Age
FROM  Stolen_Vehicles
GROUP BY vehicle_type;

			-- 13. Relationship Between Vehicle Make and Theft Likelihood
SELECT 
    md.make_name, 
    COUNT(sv.vehicle_id) AS TotalStolen, 
    (COUNT(sv.vehicle_id) / (SELECT COUNT(*) FROM Stolen_Vehicles)) * 100 AS Theft_Likelihood
FROM  Stolen_Vehicles sv
JOIN Make_Details md 
USING(make_id)
GROUP BY md.make_name
ORDER BY Theft_Likelihood DESC;

			-- 14. Vehicle Theft by Season
SELECT 
    CASE 
        WHEN MONTH(DATE_FORMAT(date_stolen, '%m/%d/%y')) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(DATE_FORMAT(date_stolen, '%m/%d/%y')) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(DATE_FORMAT(date_stolen, '%m/%d/%y')) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(DATE_FORMAT(date_stolen, '%m/%d/%y')) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_Vehicles
GROUP BY Season
ORDER BY Total_Stolen DESC;



SELECT 
    CASE 
        WHEN DATE_FORMAT(date_stolen, '%m/%d/%y') IN (12, 1, 2) THEN 'Winter'
        WHEN DATE_FORMAT(date_stolen, '%m/%d/%y') IN (3, 4, 5) THEN 'Spring'
        WHEN DATE_FORMAT(date_stolen, '%m/%d/%y') IN (6, 7, 8) THEN 'Summer'
        WHEN DATE_FORMAT(date_stolen, '%m/%d/%y') IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_Vehicles
GROUP BY Season
ORDER BY Total_Stolen DESC;


















