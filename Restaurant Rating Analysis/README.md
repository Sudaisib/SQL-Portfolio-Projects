

---

# 🍽️📊 Restaurant Rating Analysis – Global Insights

![rating](https://github.com/user-attachments/assets/e1fc478e-c09b-45e3-80f2-f4fcb3089961)

---


## 📌 **Table of Contents** 🗂️

1️⃣ [📚 Project Overview](#-project-overview)

2️⃣ [📂 Data Sources](#-data-sources)

3️⃣ [🛠 Tools & Technologies](#-tools--technologies)

4️⃣ [🔍 Data Cleaning & Preparation](#-data-cleaning--preparation)

5️⃣ [📌 SQL Queries & Exploratory Analysis](#-sql-queries--exploratory-analysis)

    🔹 [Restaurant Analysis](#1️⃣-database-overview-queries)
    
    🔹 [Customer Demographics](#2️⃣-analysis-by-category)
    
    🔹 [Rating Analysis](#3️⃣-deeper-insights)

6️⃣ [📈 Key Insights](#📈-key-insights)

  🌟 [Restaurant Analysis Summary](#🍽️-restaurant-analysis-summary)
  
  🌟 [Customer Demographics Analysis Summary](#📊-customer-demographics-analysis-summary)
  
  🌟 [Rating Analysis Summary](#🌟-rating-analysis-summary)  

7️⃣ [🎯 Recommendations](#🎯-recommendations)

8️⃣ [🚀 Future Enhancements](#🚀-future-enhancements)

9️⃣ [⚠️ Challenges](#⚠️-challenges)

🔟 [📜 Limitations](#📜-limitations)

🔹 [✍️ Author](#✍️-author)

🔹 [📌 License](#📌-license)


---

## 📊 Project Overview

In today’s digital age, **online restaurant ratings and reviews** significantly influence customer decisions. This project analyzes a global restaurant dataset to understand factors affecting restaurant popularity, customer satisfaction, and service delivery efficiency.

By leveraging **SQL** for data manipulation and **visualization tools** for storytelling, this project uncovers patterns in customer ratings across countries, price ranges, cuisine types, and services offered (like online delivery or table booking).

The insights generated can guide **restaurant owners**, **food delivery platforms**, and **policymakers** to enhance customer satisfaction, improve business offerings, and understand regional preferences.

🍴 **Fun Fact:** A 1-star increase in Yelp rating can lead to a **5–9% increase** in revenue for independent restaurants!

---

## 📂 Data Sources

This project combines various datasets to create a rich overview of the restaurant industry:

* **Restaurant Master Dataset:** Includes name, location (country/city), cuisine, rating, number of votes, and pricing level.
* **Rating Metrics Dataset:** Provides detailed insights into average ratings, total votes, and whether restaurants offer delivery or booking options.
* **Country Code Mapping:** Links numerical country codes to country names for better geographical analysis.
* **Cuisine Category Dataset (where available):** Allows for deeper analysis by food type (e.g., Italian, Chinese, Fast Food).

🔎 **Note:** Some reviews may be outdated or inconsistent due to user bias or incomplete data entries.

---

## 🛠 Tools & Technologies

To ensure robust and efficient analysis, the following tools and techniques were employed:

* **SQL (MySQL/PostgreSQL):** For data wrangling, aggregation, and relational joins.
* **Data Cleaning Techniques:** To eliminate duplicates, standardize formats, and manage missing entries.

⚙️ **Why These Tools?** SQL provides structured and repeatable queries, while visualization tools make insights accessible and actionable.

---

## 🔍 Data Cleaning & Preparation

* **Data Acquisition**: Imported restaurant ratings and related datasets into an SQL database from a public source for structured analysis.

* **Data Cleaning**: Used SQL to remove duplicates, handle missing values, and standardize formats across all tables.

* **Information Extraction**: Queried key details such as average ratings, review counts, cuisine types, and locations.

* **Advanced SQL Analysis**: Applied joins, subqueries, and window functions to identify patterns and consumer behavior.

* **Metric Exploration**: Analyzed restaurant performance, consumer preferences, and rating trends.

* **Recommendations for Improvement**: Provided data-driven suggestions to enhance restaurant operations and customer experience.

---

## ✅ Recommended Analysis

1. What can you learn from the highest-rated restaurants?
2. Do consumer preferences affect restaurant ratings?
3. What are the consumer demographics?
4. Is there any demographic or preference bias in the ratings?
5. Are there demand & supply gaps in certain locations or cuisines?
6. Which cuisine types are most frequently reviewed?
7. Which locations have the most active consumers?
8. What is the average number of reviews per consumer?
9. How often do consumers return to the same restaurant?
10. Which restaurants have the most consistent ratings over time?
11. What characteristics define top-performing restaurants (e.g., price, cuisine, service)?
12. Are there underperforming restaurants in high-demand areas?
13. How do rating patterns vary by location or age group?

---

## 📌 SQL Queries & Exploratory Analysis 🔎

## Restaurant Analysis

### 1. Total restaurants in each state

```sql
SELECT   state,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1
ORDER BY 2 DESC
```	

**Result Set** :

state | total_restaurants | 
--|--|
San Luis Potosi |	84 |
Tamaulipas	 |23 |
Morelos |	23 |


---

	
### 2. Total restaurants in each city

```sql
SELECT   city,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

city | total_restaurants | 
--|--|
San Luis Potosi |	84 |
Ciudad Victoria |	23 |
Cuernavaca |	21 |
Jiutepec |	2 |


---

### 3. Restaurants COUNT by alcohol service 

```sql
SELECT   alcohol_service,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

alcohol_service | total_restaurants |
--|--|
None |	87 |
Wine & Beer |	34 |
Full Bar |	9 |


---

### 4. Restaurants Count by Smoking Allowed

```sql
SELECT   smoking_allowed,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

smoking_allowed | total_restaurants | 
--|--|
No |	95 |
Smoking Section |	24 |
Yes |	9 |
Bar Only |	2 |


---

### 5. Alcohol & Smoking analysis

```sql
SELECT   alcohol_service,
         smoking_allowed,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1, 2
ORDER BY 3 DESC
```

**Result Set** :


alcohol_service | smoking_allowed | total_restaurants |
--|--|--|
None |	No |	73 |
Wine & Beer |	No |	19 |
Wine & Beer |	Smoking Section |	11 |
None |	Smoking Section |	8 |
None |	Yes |	6 |
Full Bar |	Smoking Section |	5 |
Full Bar |	No |	3 |
Wine & Beer |	Yes |	2 |
Wine & Beer |	Bar Only |	2 |
Full Bar |	Yes |	1 |

---


### 6. Restaurants COUNT by Price

```sql
SELECT   price,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

price | total_restaurants |
--|--|
Medium |	60 |
Low |	45 |
High |	25 |


---

### 7. Restaurants COUNT by packing

```sql
SELECT   parking,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurants
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

parking | total_restaurants |
--|--|
None |	65 |
Yes |	46 |
Public |	16 |
Valet |	3 |



---


### 8. Count of Restaurants by cuisines

```sql
SELECT   cuisine,
	     COUNT(restaurant_id) as total_restaurants
FROM 	 restaurant_cuisines
GROUP BY 1
ORDER BY 2 DESC	
LIMIT    5;			  
```	

cuisine | total_restaurants |
--|--|
Mexican |	28 |
Bar |	13 |
Cafeteria |	9 |
Fast Food |	8 |
Brewery |	6 |



---
	
### 9. Preferred cuisines of each customer

```sql
SELECT   name as restaurant_name,
	     COUNT(cuisine) as total_cuisines,
	     GROUP_CONCAT(cuisine, ',') as cuisines
FROM 	 restaurant_cuisines as a JOIN restaurants as b USING(restaurant_id)
GROUP BY 1
ORDER BY 2 DESC;
```	

**Result Set** :

*displaying only first 5 entries for convenience*

restaurant_name | total_cuisines | cuisines |
--|--|--|
La Fontana Pizza Restaurante And Cafe |	3 |	Pizzeria,,Fast Food,,Cafeteria, |
Log Yin |	3 |	Mexican,,Mediterranean,,Burgers, |
KFC |	2 |	Game,,American, |
Chaires |	2 |	Bakery,,Cafeteria, |
Luna Cafe |	2 |	Cafeteria,,Bar, |



---

### 10. Restaurant Price-Analysis for each cuisine

```sql
SELECT   cuisine,
	     SUM(CASE WHEN price = 'High' THEN 1 ELSE 0 END) as High,
         SUM(CASE WHEN price = 'Medium' THEN 1 ELSE 0 END) as Medium,
	     SUM(CASE WHEN price = 'Low' THEN 1 ELSE 0 END) as Low
FROM 	 restaurant_cuisines as a JOIN restaurants as b USING(restaurant_id)
GROUP BY 1
ORDER BY 1
```

**Result Set** :

cuisine | High | Medium | Low |
--|--|--|--|
American |	0 |	1 |	4 |
Armenian |	0 |	0 |	1 |
Bakery |	0 |	1 |	0 |
Bar |	5 |	4 |	4 |
Breakfast |	0 |	1 |	0 |
Brewery |	4 |	1 |	1 |
Burgers |	0 |	2 |	3 |
Cafeteria |	1 |	5 |	3 |
Chinese |	1 |	2 |	0 |
Coffee Shop |	0 |	1 |	0 |
Contemporary |	1 |	1 |	0 |
Family |	0 |	1 |	1 |
Fast Food |	1 |	5 |	2 |
Game |	0 |	0 |	1 |
International |	2 |	1 |	1 |
Italian |	1 |	2 |	1 |
Japanese |	1 |	4 |	0 |
Mediterranean |	0 |	0 |	1 |
Mexican |	1 |	14 |	13 |
Pizzeria |	1 |	4 |	0 |
Regional |	0 |	0 |	1 |
Seafood |	1 |	3 |	1 |
Vietnamese |	0 |	1 |	0 |

---


### 11. Finding out COUNT of each cuisine in each state

```sql
SELECT   cuisine,
	     SUM(CASE WHEN state = 'Morelos' THEN 1 ELSE 0 END) as Morelos,
	     SUM(CASE WHEN state = 'San Luis Potosi' THEN 1 ELSE 0 END) as San_Luis_Potosi,
	     SUM(CASE WHEN state = 'Tamaulipas' THEN 1 ELSE 0 END) as Tamaulipas
FROM 	 restaurant_cuisines as a JOIN restaurants as b USING(restaurant_id)
GROUP BY 1
ORDER BY 1
```

**Result Set** :


cuisine | Morelos | San_Luis_Potosi | Tamaulipas |
--|--|--|--|
American |	1 |	4 |	0 |
Armenian |	0 |	0 |	1 |
Bakery |	0 |	1 |	0 |
Bar |	2 |	11 |	0 |
Breakfast |	0 |	1 |	0 |
Brewery |	1 |	5 |	0 |
Burgers |	1 |	4 |	0 |
Cafeteria |	1 |	8 |	0 |
Chinese |	0 |	3 |	0 |
Coffee Shop |	0 |	1 |	0 |
Contemporary |	0 |	2 |	0 |
Family |	2 |	0 |	0 |
Fast Food |	1 |	5 |	2 |
Game |	0 |	1 |	0 |
International |	1 |	3 |	0 |
Italian |	1 |	2 |	1 |
Japanese |	2 |	3 |	0 |
Mediterranean |	1 |	0 |	0 |
Mexican |	3 |	12 |	13 |
Pizzeria |	0 |	4 |	1 |
Regional |	0 |	0 |	1 |
Seafood |	0 |	5 |	0 |
Vietnamese |	1 |	0 |	0 |

---

## Customer Demographics Analysis

### 1. Total Customers in each state

```sql
SELECT   state,
	     COUNT(consumer_id) as total_customers
FROM 	 customer_details
GROUP BY 1
ORDER BY 2 DESC
```	

**Result Set** :

state | total_customers | 
--|--|
Tamaulipas |	25 |
San Luis Potosi |	86 |
Morelos |	27 |



---

	
### 2. Total Customers in each city

```sql
SELECT   city,
	     COUNT(consumer_id) as total_customers
FROM 	 customer_details
GROUP BY 1
ORDER BY 2 DESC;	
```

**Result Set** :

city | total_customers |
--|--|
San Luis Potosi |	86 |
Ciudad Victoria |	25 |
Cuernavaca |	22 |
Jiutepec |	5 |



---

### 3. Budget level of customers

```sql
SELECT   budget,
	     COUNT(consumer_id) as total_customers
FROM 	 customer_details
WHERE 	 budget is not null
GROUP BY 1
```

**Result Set** :

budget | total_customers |
--|--|
| Medium |	91 |
| Low |	35 |
|    | 7 |
| High |	5 |



---

### 4. Total Smokers by Occupation

```sql
SELECT   occupation,
	     COUNT(consumer_id) as smokers
FROM 	 customer_details
WHERE 	 smoker = 'Yes'
GROUP BY 1
```

**Result Set** :

occupation | smokers | 
--|--|
Student |	23 |
Employed |	3 |



---

### 5. Drinking level of students

```sql
SELECT   drink_level,
	 	 COUNT(consumer_id) as student_count
FROM 	 customer_details
WHERE 	 occupation = 'Student' and occupation is not null
GROUP BY 1
```

**Result Set** :

drink_level | student_count |
--|--|
Abstemious |	35 |
Social Drinker |	35 |
Casual Drinker |	43 |


---


### 6. Transportation methods of customers

```sql
SELECT   transportation_method,
	 	 COUNT(consumer_id) as total_customers
FROM 	 customer_details
WHERE 	 transportation_method is not null	
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

transportation_method | total_customers |
--|--|
|Public |	82 |
|Car |	35 |
|On Foot |	14 |
|	| 7 |



---

### 7. Adding Age Bucket Column 

```sql
ALTER TABLE customer_details 
ADD COLUMN  age_bucket Varchar(50)
```


---


### 8. Updating the Age Bucket column with case when condition

```sql
UPDATE customer_details
SET age_bucket = 
		 CASE WHEN age > 60 then '61 and Above'
		      WHEN age > 40 then '41 - 60'	
		      WHEN age > 25 then '26 - 40'
		      WHEN age >= 18 then '18 - 25'
		    END
WHERE age_bucket is null					  
```	


---
	
### 9. Total customers in each age bucket

```sql
SELECT   age_bucket,
	     COUNT(consumer_id) as total_customers 
FROM 	 customer_details
GROUP BY 1
ORDER BY 1
```	

**Result Set** :

age_bucket | total_customers |
--|--|
18 - 25 |	110 |
26 - 40 |	16 |
41 - 60 |	3 |
61 and Above |	9 |



---

### 10. Total customers COUNT & smokers COUNT in each age percent 

```sql
SELECT   age_bucket,
	     COUNT(consumer_id) as total,
	     COUNT(CASE WHEN smoker = 'Yes' THEN consumer_id END) as smokers_count
FROM 	 customer_details
GROUP BY 1
ORDER BY 1
```

**Result Set** :

age_bucket | total | smokers_count | 
--|--|--|
18 - 25 |	110 |	21 |
26 - 40 |	16 |	2 |
41 - 60 |	3 |	2 |
61 and Above |	9 |	1 |


---

### 11. Top 10 preferred cuisines

```sql
SELECT   preferred_cuisine,
	 	 COUNT(consumer_id) AS total_customers
FROM 	 customer_preference	
GROUP BY 1
ORDER BY 2 DESC
LIMIT    10
```

**Result Set** :

preferred_cuisine | total_customers | 
--|--|
Mexican |	97 |
American |	11 |
Pizzeria |	9 |
Cafeteria |	9 |
Coffee Shop |	8 |
Family |	8 |
Italian |	7 |
Japanese |	7 |
Chinese |	6 |
Hot Dogs |	6 |


---

### 12. Preferred cuisines of each customer

```sql
SELECT   consumer_id,
		 COUNT(preferred_cuisine) AS total_cuisines,
	     STRING_AGG(preferred_cuisine, ',') as cuisines
FROM 	 customer_preference
GROUP BY 1
ORDER BY 2 DESC
```

**Result Set** :

*only displaying first 5 records for convenience*

consumer_id | total_cuisines | cuisines |
--|--|--|
U1135 |	103 |	Organic,,Steaks,,Middle Eastern,,Mediterranean,,British,,Austrian,,Israeli,,Doughnuts,,Pizzeria,,Seafood,,Fast Food,,Moroccan,,Hot Dogs,,Russian,,Malaysian,,Burgers,,Fusion,,Korean,,Japanese,,Vegetarian,,Turkish,,Peruvian,,Juice,,Tapas,,Eclectic,,African... |
U1108 |	18 |	Coffee Shop,,Sushi,,Latin American,,Deli,,Mexican,,Hot Dogs,,American,,Fast Food,,Burgers,,Asian,,Pizzeria,,Chinese,,Ice Cream,,Cafeteria,,Japanese,,Game,,Family,,Seafood, |
U1101 |	15 |	Chinese,,Italian,,Doughnuts,,Afghan,,Mexican,,Burgers,,Latin American,,Contemporary,,Coffee Shop,,Family,,Cafeteria,,Bar,,Australian,,Hot Dogs,,Diner, |
U1016 |	14 |	Coffee Shop,,Contemporary,,Regional,,Fusion,,Japanese,,Portuguese,,American,,Indian,,Eastern European,,Lebanese,,Moroccan,,Barbecue,,Polynesian,,Polish, |
U1060 |	13 |	Burgers,,Cafeteria,,Pizzeria,,Juice,,American,,Tex Mex,,Spanish,,Mexican,,Fast Food,,Coffee Shop,,Soup,,Hot Dogs,,Italian, |



---

### 13. Customer Budget analysis for each cuisine


```sql
SELECT   b.preferred_cuisine,
		 SUM(CASE WHEN a.budget = 'High' Then 1 Else 0 END) AS High,
		 SUM(CASE WHEN a.budget = 'Medium' Then 1 Else 0 END) AS Medium,
		 SUM(CASE WHEN a.budget = 'Low' Then 1 Else 0 END) AS Low
FROM 	 customer_details a JOIN customer_preference b USING(customer_id)
GROUP BY 1
ORDER BY 1
```

---

### 14. Finding out number of preferred cuisine in each state

```sql
SELECT   a.state,
	     COUNT(b.preferred_cuisine) AS count
FROM 	 customer_details a JOIN customer_preference b USING(consumer_id)
GROUP BY 1
ORDER BY 2 DESC;
```

**Result Set** :

state | count | 
--|--|
San Luis Potosi |	254 |
Tamaulipas |	41 |
Morelos |	35 |

---

## Rating Analysis

### 1. Ratings given by customer for restaurants

```sql
SELECT   b.consumer_id,
	     a.name,
	     b.overall_rating,
	     b.food_rating,
	     b.service_rating
FROM     restaurants as a JOIN customer_ratings as b USING(restaurant_id)
ORDER BY b.restaurant_id;
```	

**Result Set** :

*displaying only first 5 entries*

consumer_id | name | overall_rating | food_rating | service_rating |
--|--|--|--|--|
U1082 |	Pollo Frito Buenos Aires |	0 |	0 |	0 |
U1070 |	Pollo Frito Buenos Aires |	1 |	1 |	1 |
U1043 |	Carnitas Mata |	1 |	1 |	1 |
U1028 |	Carnitas Mata |	2 |	2 |	2 |
U1123 |	Carnitas Mata |	1 |	2 |	1 |


---

	
### 2.  Average ratings of each restaurant including its cuisine type

```sql
SELECT   a.name,
	     ROUND(AVG(b.overall_rating),2)as overall_Rating,
	     ROUND(AVG(b.food_rating),2)as food_rating,
	     ROUND(AVG(b.service_rating),2)as service_rating,
	     c.cuisine
FROM     restaurants as a JOIN customer_ratings as b USING(restaurant_id) 
				          JOIN restaurant_cuisines AS c USING(restaurant_id)
GROUP BY 1, 5
ORDER BY 1;
```

**Result Set** :

*displaying only first 5 entries*


name | overall_rating | food_rating | service_rating | cuisine |
--|--|--|--|--|
Abondance Restaurante Bar |	0.50 |	0.50 |	0.75 |	Bar |
Cabana Huasteca |	1.46 |	1.46 |	1.31 |	Mexican |
Cafe Chaires |	1.00 |	1.00 |	0.93 |	Cafeteria |
Cafe Punta Del Cielo |	1.83 |	1.50 |	1.83 |	Cafeteria |
Cafeteria Cenidet |	1.00 |	1.17 |	1.00 |	Cafeteria |


---

### 3. Creating new columns for sentiment analysis

```sql
ALTER TABLE customer_ratings ADD COLUMN overall_senti Varchar(50);
ALTER TABLE customer_ratings ADD COLUMN food_senti Varchar(50);
ALTER TABLE customer_ratings ADD COLUMN service_senti Varchar(50);
```

---

### 4. Updating the new columns with the sentiments 

```sql
UPDATE customer_ratings
SET overall_sentiment = 
		CASE WHEN overall_rating = 0 then 'Negative'
			 WHEN overall_rating = 1 then 'Neutral'	
			 WHEN overall_rating = 2 then 'Positive'
		  END
WHERE overall_sentiment is null;
```

```sql
UPDATE customer_ratings
SET food_sentiment = 
		CASE WHEN food_rating = 0 then 'Negative'
		     WHEN food_rating = 1 then 'Neutral'	
		     WHEN food_rating = 2 then 'Positive'
		  END
WHERE food_sentiment is null;
```

```sql
UPDATE customer_ratings
SET service_sentiment = 
		CASE WHEN service_rating = 0 then 'Negative'
			 WHEN service_rating = 1 then 'Neutral'	
			 WHEN service_rating = 2 then 'Positive'
		  END
WHERE service_sentiment is null;
```

```sql
SELECT * 
FROM   customer_ratings
```


**Result Set** :

*displaying sample 3 entries*

consumer_id | restaurant_id | overall_rating | food_rating | service_rating | overall_sentiment | food_sentiment | service_sentiment |
--|--|--|--|--|--|--|--|
U1077 |	135085 |	2 |	2 |	2 |	Positive |	Positive |	Positive |
U1077 |	135038 |	2 |	2 |	1 |	Positive |	Positive |	Neutral |
U1077 |	132825 |	2 |	2 |	2 |	Positive |	Positive |	Positive |



---

### 5. Conduct a sentimental analysis of total count of customers

```sql
CREATE VIEW overall AS
	SELECT   overall_sentiment, COUNT(consumer_id) AS total_customers
	FROM     customer_ratings
	GROUP BY 1;


CREATE VIEW food AS 
	SELECT   food_sentiment,
			 count(consumer_id) as total_customers
	FROM 	 customer_ratings
	GROUP BY 1;


CREATE VIEW service AS 
	SELECT   service_sentiment,
			 count(consumer_id) as total_customers
	FROM 	 customer_ratings
	GROUP BY 1;
```

```sql
SELECT a.overall_sentiment as sentiment,
	   a.total_customers as overall_Rating,
	   b.total_customers as food_Rating,
	   c.total_customers as service_Rating
FROM   overall as a JOIN food as b ON a.overall_sentiment = b.food_sentiment
					JOIN service as c ON a.overall_sentiment = c.service_sentiment
```


**Result Set** :

sentiment | overall_rating | food_rating | service_rating |
--|--|--|--|
Positive |	486 |	516 |	420 |
Neutral |	421 |	379 |	426 |
Negative |	254 |	266 |	315 |


---


### 6. List of Customers visiting local or outside restaurants

```sql
SELECT a.consumer_id,
	   b.city as customer_city,
	   c.name,
	   c.city as restaurant_city,
	   a.overall_sentiment,
	   a.food_sentiment,
	   a.service_sentiment,
	   CASE WHEN b.city = c.city THEN 'Local' ELSE 'Outside' END as location_preference
FROM   customer_ratings as a JOIN customer_details as b USING(consumer_id)
							 JOIN restaurants as c USING(restaurant_id);
```

**Result Set** :

*displaying first 3 entries*

consumer_id | customer_city | name | restaurant_city | overall_sentiment | food_sentiment | service_sentiment | location_preference |
--|--|--|--|--|--|--|--|
U1003 |	San Luis Potosi |	Koye Sushi |	San Luis Potosi |	Positive |	Positive |	Positive |	Local |
U1003 |	San Luis Potosi |	Los Toneles |	San Luis Potosi |	Positive |	Neutral |	Positive |	Local |
U1003 |	San Luis Potosi |	La Estrella De Dimas |	San Luis Potosi |	Positive |	Positive |	Neutral |	Local |

---

### 7. Count of customers visiting local and outside restaurants

```sql
SELECT location_preference,
	   COUNT(*) as total_customers,
	   COUNT(DISTINCT id) as distinct_customers
FROM 	(    
	SELECT a.consumer_id as id,
		   b.city as customer_city,
		   c.name,
		   c.city as restaurant_city,
		   a.overall_sentiment,
		   a.food_sentiment,
		   a.service_sentiment,
		   CASE WHEN b.city = c.city THEN 'Local' ELSE 'Outside' END as Location_preference
	FROM   customer_ratings as a JOIN customer_details as b USING(consumer_id)
		  						 JOIN restaurants as c USING(restaurant_id)
		) as cte
GROUP BY 1				
```

**Result Set** :

location_preference | total_customers | distinct_customers |
--|--|--|
Local |	1073 |	131 |
Outside |	88 |	14 |


---


### 8. Trend of customers visiting outside restaurants

```sql
SELECT customer_id,
	   customer_city,
	   restaurant_city,
	   concat_ws(' - ',customer_city , restaurant_city) as direction,
	   restaurant_name		
FROM 	( 
	SELECT a.consumer_id as customer_id,
		   b.city as customer_city,
		   c.name as restaurant_name,
		   c.city as restaurant_city,
	       a.overall_sentiment,
	       a.food_sentiment,
	       a.service_sentiment,
	  	   CASE WHEN b.city = c.city THEN 'Local' ELSE 'Outside' END as location_preference
	FROM   customer_ratings as a JOIN customer_details as b USING(consumer_id)
								 JOIN restaurants as c USING(restaurant_id)
		) as cte
WHERE  location_preference = 'Outside'		  
```	


**Result Set** :

*displaying first 3 entries*

customer_id | customer_city | restaurant_city | direction | restaurant_name |
--|--|--|--|--|
U1004 |	Cuernavaca |	San Luis Potosi |	Cuernavaca - San Luis Potosi |	Tacos Los Volcanes |
U1004 |	Cuernavaca |	San Luis Potosi |	Cuernavaca - San Luis Potosi |	Emilianos |
U1004 |	Cuernavaca |	San Luis Potosi |	Cuernavaca - San Luis Potosi |	La Parroquia |


---
	
### 9. Count of direction trend from above query

```sql
SELECT direction,
	   COUNT(customer_id) as total_customers

FROM  (  
	SELECT customer_id,
		   customer_city,
		   restaurant_city,
		   concat_ws(' - ',customer_city , restaurant_city) as direction,
		   restaurant_name
		
	FROM  (  
		SELECT a.consumer_id as customer_id,
			   b.city as customer_city,
			   c.name as restaurant_name,
			   c.city as restaurant_city,
			   a.overall_sentiment,
			   a.food_sentiment,
			   a.service_sentiment,
			   CASE WHEN  b.city = c.city THEN 'Local' ELSE 'Outside' END as Location_preference
		FROM   customer_ratings as a JOIN customer_details as b USING(consumer_id)
									 JOIN restaurants as c USING(restaurant_id)
									 
			) as cte
	WHERE  Location_preference = 'Outside' ) cte2
GROUP BY 1;
```	

**Result Set** :

direction | total_customers | 
--|--|
Cuernavaca - San Luis Potosi |	26 |
Ciudad Victoria - San Luis Potosi |	19 |
Cuernavaca - Jiutepec |	8 |
Jiutepec - San Luis Potosi |	19 |
Jiutepec - Cuernavaca |	16 |



---

### 10. Cuisine preferences vs cuisine consumed

```sql
SELECT  a.consumer_id,
	    GROUP_CONCAT(b.preferred_cuisine,',') as customer_preferences,
	    d.name,
		c.cuisine as restaurant_cuisine
FROM    customer_ratings as a JOIN customer_preference as b USING(consumer_id)
							  JOIN restaurant_cuisines as c USING(restaurant_id)
							  JOIN restaurants as d USING(restaurant_id)
GROUP BY 1, 3, 4
```

**Result Set** :

*displaying first 3 entries*

consumer_id | customer_preferences | name | restaurant_cuisine |
--|--|--|--|
U1001 |	American, |	El Rincon De San Francisco |	Mexican |
U1001 |	American, |	Puesto De Tacos |	Mexican |
U1001 |	American, |	Restaurant De Mariscos De Picon |	Seafood |


---


### 11. Best restaurants for each cuisines by different ratings

```sql
CREATE VIEW average_analysis as 
	SELECT   a.name,
			 ROUND(AVG(b.overall_rating), 2) as overall_Rating,
			 ROUND(AVG(b.food_rating), 2) as food_rating,
			 ROUND(AVG(b.service_rating), 2) as service_rating,
			 c.cuisine
	FROM     restaurants as a JOIN customer_ratings as b USING(restaurant_id)
							  JOIN restaurant_cuisines AS c USING(restaurant_id)
	GROUP BY 1, 5
	ORDER BY 5;

	
CREATE VIEW best  as 
	SELECT cuisine,
		   first_value(name) OVER(partition by cuisine ORDER BY overall_rating desc) as best_overall,
		   first_value(name) OVER(partition by cuisine ORDER BY food_rating desc) as best_for_food,
		   first_value(name) OVER(partition by cuisine ORDER BY service_rating desc) as best_for_service
	FROM   average_analysis;
```

```sql
SELECT   *
FROM     best
GROUP BY cuisine, best_overall, best_for_food, best_for_service
ORDER BY cuisine
```

**Result Set** :

*displaying first 5 entries*

cuisine | best_overall | best_for_food | best_for_service |
--|--|--|--|
American |	Tacos Los Volcanes |	Tacos Los Volcanes |	Tacos Los Volcanes |
Armenian	Little Pizza Emilio Portes Gil |	Little Pizza Emilio Portes Gil |	Little Pizza Emilio Portes Gil |
Bakery |	Chaires |	Chaires |	Chaires |
Bar |	Restaurant Bar Hacienda Los Martinez |	Restaurante Bar El Gallinero |	La Cantina |
Breakfast |	La Parroquia |	La Parroquia |	La Parroquia |


---


### 12. Worst restaurants for each cuisines by different ratings

```sql
CREATE VIEW count_cuisines as 
	SELECT   cuisine,
			 COUNT(cuisine)	as count
	FROM     average_analysis
	GROUP BY 1;

		
CREATE VIEW worst as 
	SELECT cuisine,
		   first_value(name) OVER(PARTITION BY cuisine ORDER BY overall_rating) as worst_overall,
		   first_value(name) OVER(PARTITION BY cuisine ORDER BY food_rating) as worst_for_food,
		   first_value(name) OVER(PARTITION BY cuisine ORDER BY service_rating) as worst_for_service	
	FROM    ( 	
			SELECT   a.name,
				     ROUND(AVG(a.overall_rating), 2)as overall_Rating,
				     ROUND(AVG(a.food_rating), 2)as food_rating,
				     ROUND(AVG(a.service_rating), 2)as service_rating,
				     a.cuisine,
				     cc.count
			FROM     average_analysis as a JOIN count_cuisines as cc USING(cuisine)
			WHERE    cc.count > 1	
			GROUP BY 1, 5, 6
			ORDER BY 5
		) as least;
```

```sql
SELECT   *
FROM     worst
GROUP BY cuisine, worst_overall, worst_for_food, worst_for_service
ORDER BY cuisine
```

**Result Set** :

*displaying first 5 entries*

cuisine | worst_overall | worst_for_food | worst_for_service |
--|--|--|--|
American |	Pizzeria Julios |	Vips |	Vips |
Bar |	Abondance Restaurante Bar |	Abondance Restaurante Bar |	Abondance Restaurante Bar |
Brewery |	Restaurant And Bar And Clothesline Carlos N Charlies |	Restaurante La Cantina |	Restaurante La Cantina |
Burgers |	Tortas Y Hamburguesas El Gordo |	McDonalds Parque Tangamanga |	Tortas Y Hamburguesas El Gordo |
Cafeteria |	Hamburguesas Saul |	Hamburguesas Saul |	Hamburguesas Saul |


---


### 13. Total customers with highest ratings in all different criteria


```sql
SELECT COUNT(consumer_id) as total_customers
FROM   customer_ratings
WHERE  overall_rating = 2 and food_rating = 2 and service_rating = 2;
```

**Result Set** :

total_customers |
--|
293 |

---

## **📊 Key Insights**

### 🍽️ Restaurant Analysis Summary

📍 **1. Restaurant Distribution Is Heavily Concentrated in San Luis Potosi**
San Luis Potosi dominates with **84 restaurants**, far outpacing Tamaulipas and Morelos, each with only **23**. This indicates a significant geographical skew in restaurant availability.

🏙️ **2. Urban Concentration in San Luis Potosi**
The city of **San Luis Potosi** alone accounts for **84 restaurants**, highlighting it as a central urban hub, while cities like Jiutepec are underserved, with just **2 restaurants**.

🍷 **3. Majority of Restaurants Do Not Serve Alcohol**
A significant **60% (87 restaurants)** do not serve alcohol, while only a small fraction offer **Full Bar** services (**9 restaurants**), suggesting a conservative approach or regulatory limitations.

🚭 **4. Smoking Is Mostly Prohibited**
A large majority (**95 restaurants**) do not allow smoking, although **24** offer smoking sections, which may indicate a customer preference for smoke-free environments.

🍷🚬 **5. Alcohol-Service and Smoking Policies Align with Health Trends**
Most restaurants with **no alcohol** also prohibit smoking (**73 restaurants**), reinforcing a possible focus on family-friendly or health-conscious dining environments.

💰 **6. Mid-Priced Restaurants Dominate**
**Medium-priced** restaurants are the most common (**60 restaurants**), followed by **Low-priced** (**45**) and fewer **High-end** (**25**) establishments, pointing to affordability-driven market demand.

🚗 **7. Parking Availability Is a Challenge**
Over **65 restaurants** have no parking provision, which may affect customer convenience and accessibility, particularly in urban centers.

🌮 **8. Mexican Cuisine Leads the Market**
**Mexican cuisine** is the most popular offering (**28 restaurants**), followed by **Bar**, **Cafeteria**, and **Fast Food**, indicating strong local culinary demand.

🍕 **9. Some Restaurants Offer Diverse Cuisine Options**
Restaurants like *La Fontana Pizza* and *Log Yin* offer **3 or more cuisines**, suggesting a strategy of appealing to diverse customer preferences under one roof.

💵 **10. High-End Cuisines Concentrated in Select Types**
Cuisines such as **Bar**, **Brewery**, **International**, and **Seafood** have the highest counts of **High-priced** offerings, whereas cuisines like **Armenian**, **Game**, and **Coffee Shop** lack high-end options.

🌎 **11. Mexican Cuisine Is Consistently Popular Across All States**
Mexican cuisine shows balanced demand across **Morelos (3)**, **San Luis Potosi (12)**, and **Tamaulipas (13)**, indicating its universal appeal.

---

### 📊 Customer Demographics Analysis Summary

👥 **1. San Luis Potosi Has the Highest Customer Concentration**
With **86 customers**, San Luis Potosi leads in customer count, indicating a significant customer base concentration in this state.

🏙️ **2. Major Urban Center: San Luis Potosi City**
The city of **San Luis Potosi** alone accounts for **86 customers**, dominating the city-wise distribution and highlighting it as a central urban hub.

💰 **3. Most Customers Are Medium Budget Spenders**
**91 customers** fall under the **medium** budget category, suggesting affordability is key in dining preferences.

🚬 **4. Students Are the Predominant Smokers**
Out of all occupations, **students account for 23 smokers**, which significantly outweighs other professions like employed individuals.

🍷 **5. Students Have Varied Drinking Habits**
Student drinking preferences are spread across **Abstemious (35)**, **Social Drinkers (35)**, and **Casual Drinkers (43)**, indicating diverse social behavior.

🚗 **6. Public Transport Is the Most Common Mode**
**82 customers** rely on **public transportation**, which reflects both urban commuting habits and accessibility to dining locations.

🎂 **7. Young Adults Dominate the Age Demographic**
The **18 - 25 age group** accounts for **110 customers**, showing strong engagement from younger demographics.

🚬🎂 **8. Young Adults Have the Highest Smoking Count**
The **18 - 25 age bucket** also leads with **21 smokers**, indicating a potential health trend among youth.

🌮 **9. Mexican Cuisine Is the Clear Favorite**
**Mexican cuisine** tops preference charts with **97 customers**, showcasing strong local culinary loyalty.

🍽️ **10. Diverse Taste Among Some Customers**
Some customers prefer a broad range of cuisines, with individuals like **U1135** choosing over **100 different cuisines**, showing openness to diverse food experiences.

🍽️💸 **11. Medium-Budget Diners Drive Cuisine Demand**
Across most cuisines, **medium-budget** customers are dominant, reflecting their strong market presence.

🗺️ **12. San Luis Potosi Leads in Cuisine Preferences Too**
With **254 cuisine preferences**, San Luis Potosi not only leads in customer numbers but also in food variety demand.

---

### 🌟 Rating Analysis Summary

1. 🧍‍♂️ **Majority of customers give low ratings**:
   From the sample shown, most customers provided ratings between 0 and 2 across overall, food, and service aspects—indicating general dissatisfaction or average experiences.

2. 📉 **Low average ratings across restaurants**:
   Many restaurants have an average rating between **0.5 and 1.8**, suggesting a need for quality improvement in food and service delivery.

3. 🧠 **Sentiment analysis reveals polarity**:
   Most reviews translate into **Neutral** and **Positive** sentiments, but a noticeable portion also reflects **Negative** sentiment—especially for **service**.

4. 🍽️ **Food scores slightly better than service**:
   Food sentiment has more **Positive** responses (516) than **service** (420), highlighting better performance in food preparation than service experience.

5. 🏠 **Customers prefer local dining**:
   Out of all visits, **92.4%** were to local restaurants, showing strong locality preference.

6. 🧭 **Outside visits are low but directional patterns exist**:
   Most common travel routes for dining outside are from **Cuernavaca to San Luis Potosi** and **Ciudad Victoria to San Luis Potosi**.


---

## 🎯 Recommendations

### 🍽️ Restaurant Analysis Summary

📌 **1. Expand Restaurant Presence Beyond San Luis Potosi**
Encourage investment in restaurant development in **underrepresented states** like Morelos and Tamaulipas to promote regional balance and tap into untapped markets.

🏙️ **2. Focus on Developing Smaller Cities**
Cities like **Jiutepec** and **Cuernavaca** offer growth opportunities for restaurant expansion given their currently low restaurant counts.

🍽️ **3. Diversify Alcohol Options with Caution**
Consider carefully increasing **Wine & Beer** offerings in select restaurants to attract customers looking for casual alcohol options, but align this with cultural and legal norms.

🚭 **4. Continue Promoting Smoke-Free Dining**
Given the overwhelming preference for **non-smoking environments**, continue to emphasize smoke-free dining spaces, while providing designated smoking sections if necessary.

💼 **5. Add Value with Mid-Tier Pricing Strategies**
Given the dominance of **Medium** and **Low-priced** restaurants, future developments should focus on **value-for-money offerings** while carefully integrating **premium menus** in high-demand urban areas.

🚗 **6. Improve Parking Infrastructure**
Incentivize the inclusion of **public or private parking options** in restaurant development plans to improve accessibility, especially in car-dependent locations.

🌮 **7. Leverage Mexican Cuisine as a Core Offering**
Double down on **Mexican cuisine offerings**, possibly with **fusion concepts** (e.g., Mexican-Fast Food or Mexican-Brewery) to diversify appeal without straying from market preferences.

🍳 **8. Encourage Multi-Cuisine Restaurants**
Promote the creation of **multi-cuisine restaurants** to cater to diverse tastes and maximize customer retention in highly competitive areas.

💰 **9. Use Cuisine-Type to Guide Price Strategy**
Restaurants offering **Bar**, **Brewery**, or **Seafood** should explore **premium pricing strategies**, while **Burgers** and **Fast Food** should stay focused on affordability and volume.

📈 **10. Replicate Successful Cuisine Models Across States**
Consider replicating the **successful cuisine distribution of San Luis Potosi**—like Cafeteria and Bar concepts—in **Tamaulipas and Morelos** to bring balanced culinary options across the region.

---

### 📊 Customer Demographics Analysis Summary

📌 **1. Strengthen Engagement in San Luis Potosi**
Given its large customer and cuisine preference base, further marketing, loyalty programs, or service enhancements should be concentrated here.

🏙️ **2. Explore Expansion in Secondary Cities**
Cities like **Cuernavaca** and **Jiutepec** offer potential for customer growth despite their current smaller size—ideal for targeted promotions.

💸 **3. Target Medium-Budget Consumers**
Promotions and offerings should align with **medium-budget customers**, as they represent the majority of the audience.

🎯 **4. Design Student-Centric Campaigns**
With **students being major smokers and drinkers**, create tailored messaging and wellness initiatives targeting this segment.

🚇 **5. Improve Accessibility Through Transit-Oriented Locations**
As **public transport** is the leading mode of commute, restaurants near bus stops or train stations will be more successful.

🌮 **6. Continue Promoting Mexican Cuisine While Encouraging Diversity**
While Mexican cuisine is dominant, promote fusion dishes and underrepresented cuisines like **Japanese** or **Malaysian** to attract adventurous eaters.

📊 **7. Launch Health Awareness Initiatives for Youth**
Given the high smoking rate in the **18 - 25** bracket, health-conscious campaigns, or menu options could resonate with younger demographics.

🌍 **8. Promote Multi-Cuisine Experiences**
Highlight customers like **U1135** in campaigns to show how one person can explore diverse food categories, fostering curiosity and inclusiveness.

---

### 🌟 Rating Analysis Summary

1. 👨‍🍳 **Improve service quality**:
   Since service received the lowest ratings and sentiments, restaurant owners should train staff on **customer service etiquette** and **responsiveness**.

2. 🍜 **Enhance food consistency**:
   While food ratings are slightly better, consistency should be improved. Encourage **chef standardization** and **quality checks**.

3. 📢 **Introduce feedback mechanisms**:
   Implement **real-time feedback tools** or surveys post-meal to identify pain points and address them immediately.

4. 🎯 **Focus marketing on local areas**:
   With high local dining trends, restaurants should **target neighborhood promotions**, **loyalty programs**, and **localized digital ads**.

5. 🚗 **Analyze reasons for outside visits**:
   Understand **why customers travel to other cities** for meals and **benchmark against those restaurants** to improve competitiveness.

6. 🔍 **Monitor sentiment trends periodically**:
   Set up a **dashboard** that tracks changes in sentiment monthly to proactively catch downward trends and act early.

7. 📊 **Leverage analytics for personalization**:
   Use past preferences and sentiments to create **personalized dining experiences**, **menus**, or **recommendations** for each customer.

---

## ⚠️ Challenges

* Inconsistent **rating scales** across countries.
* Some restaurants have **no votes or incomplete data**.
* Bias in reviews may affect insights.

---

## 📜 Limitations

* Dataset may not reflect **current market dynamics**.
* Reviews may be subject to **personal bias** or **fake ratings**.
* Limited data for certain regions may reduce generalizability.

---

## ✍️ Author

**Oladosu Ibrahim Adeniyi**
📧 [oladosuibrahim@gmail.com](mailto:oladosuibrahim@gmail.com) | 🌐 [Hashnode](https://sudais.hashnode.dev/) | 🧑‍💼 [LinkedIn](https://linkedin.com/in/oladosuibrahim)

---

## 📌 License

This project is licensed under the **MIT License**. Feel free to use and adapt for educational and research purposes.

---




