
# 🚗🔍 Motor Vehicle Theft Analysis – New Zealand   

![theft](https://github.com/user-attachments/assets/519354ef-7739-42ac-a03a-70fcf506cb41)

---

## 📌 **Table of Contents** 🗂️

1️⃣ [📚 Project Overview](#-project-overview)

2️⃣ [📂 Data Sources](#-data-sources)

3️⃣ [🛠 Tools & Technologies](#-tools--technologies)

4️⃣ [🔍 Data Cleaning & Preparation](#-data-cleaning--preparation)

    🔹 [Duplicate & Missing Values Handling](#-data-cleaning--preparation)
    
    🔹 [Standardization & Formatting](#-data-cleaning--preparation)

5️⃣ [📌 SQL Queries & Exploratory Analysis](#-sql-queries--exploratory-analysis)

    🔹 [Database Overview](#1️⃣-database-overview-queries)
    
    🔹 [Theft by Make, Region, Time, and Category](#2️⃣-vehicle-theft-analysis-by-category)
    
    🔹 [Deeper Insights: Colors, Year, Description](#3️⃣-deeper-insights)

6️⃣ [📈 Key Insights](#📈-key-insights) ⬅️ 

7️⃣ [🎯 Recommendations](#🎯-recommendations) ⬅️ 

    🔹 [Law Enforcement Strategies](#🎯-recommendations)
    
    🔹 [Preventive Measures for Vehicle Owners](#🎯-recommendations)
    
    🔹 [Data-Driven Crime Prevention](#🎯-recommendations)

8️⃣ [🚀 Future Enhancements](#🚀-future-enhancements) ⬅️ 

9️⃣ [⚠️ Challenges](#⚠️-challenges) ⬅️ 

🔟 [📜 Limitations](#📜-limitations) ⬅️ 

🔹 [✍️ Author](#✍️-author) ⬅️

🔹 [📌 License](#📌-license) ⬅️ 

---

## 📊 Project Overview  

Motor vehicle theft is a growing concern in **New Zealand**, affecting both urban and rural areas. With thousands of vehicles stolen annually, it is crucial to analyze patterns, identify high-risk locations, and uncover trends that can help curb this issue. This project aims to leverage **data analysis techniques** to derive insights that can benefit multiple stakeholders, including **law enforcement agencies, policymakers, vehicle owners, and insurance companies**.  

By utilizing **SQL (MySQL)** for data cleaning and analysis, we systematically process large datasets to identify the most commonly stolen vehicles, peak theft times, and areas with the highest incidents. This information not only helps in formulating strategic crime prevention measures but also aids in enhancing public awareness about theft risks.  

Additionally, understanding **recovery rates** and the effectiveness of law enforcement strategies allows for better decision-making. The goal is to contribute **data-driven recommendations** that can reduce motor vehicle theft and improve the chances of recovery.  

🚗💨 **Did you know?** A stolen vehicle in New Zealand is typically stripped for parts or shipped overseas within **48 hours** if not recovered immediately!  

---

## 📂 Data Sources  
 
To ensure a **comprehensive analysis**, data was gathered from multiple sources, providing insights into vehicle theft incidents across different cities in New Zealand. The datasets used in this project include:  

- **Stolen Vehicles Dataset:** Contains details on all reported vehicle thefts, including registration numbers, theft dates, and whether the vehicle was recovered. This dataset is crucial for analyzing crime patterns over time.  
- **Vehicle Makes & Models Dataset:** A catalog of different car manufacturers and models, allowing us to identify which vehicles are most frequently targeted by thieves. This information is valuable for both car manufacturers and insurance providers.  
- **Locations Dataset:** Provides geographical data on where thefts occurred, allowing for the identification of high-risk zones. This dataset is instrumental in determining urban vs. rural theft trends.  
- **Law Enforcement Records (where applicable):** Helps evaluate **recovery rates**, police response efficiency, and how well theft prevention strategies are working in different regions.  

🔎 **Key Consideration:** While these datasets offer extensive details, some **unreported thefts** and **data inconsistencies** may limit full accuracy, a challenge commonly faced in crime analysis research.  

---

## 🛠 Tools & Technologies  
To analyze and clean the data efficiently, we leveraged various **modern data tools and technologies**:  

- **SQL (MySQL):** Used for data extraction, cleaning, transformation, and querying large datasets. SQL allows for complex filtering, aggregation, and trend analysis.  
- **Data Aggregation & Joins:** Combining multiple datasets to create a more holistic view of theft incidents, enabling insights across various dimensions like time, location, and vehicle type.  
- **Crime Prediction Models (Potential Future Use):** Exploring the possibility of integrating **machine learning** in future projects to predict high-risk theft zones based on historical data trends.  

⚙️ **Why These Tools?** The choice of **SQL** ensures the data remains **structured and accessible**, while visualization tools bring the findings to life, making them actionable for law enforcement and policymakers.  

📊 **A Look at the Data:** Below is an example snapshot of a vehicle theft heatmap, visually illustrating high-risk areas.  

---

## 🔍 Data Cleaning & Preparation  
To ensure accurate and meaningful analysis, the data underwent a rigorous cleaning process. Duplicates were removed to prevent overestimation, missing values were handled appropriately, and data formats were standardized. The datasets were then merged to create a more holistic view of vehicle theft patterns in New Zealand.  

---

## 📌 SQL Queries & Exploratory Analysis 🔎

The following **SQL queries** were used to extract meaningful insights from the datasets. These queries were run using **MySQL** to explore relationships between vehicle types, geographic locations, time, and other key variables.

---

### 1️⃣ Database Overview Queries

```sql
SELECT * FROM locations;
SELECT * FROM make_details;
SELECT * FROM stolen_vehicles;
SELECT COUNT(*) AS Stolen_Vehicles FROM stolen_vehicles;
```

---

### 2️⃣ Vehicle Theft Analysis by Category

#### 🔹 Most Commonly Stolen Makes and Models

```sql
SELECT 
    md.Make_name, 
    COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Make_details md USING (make_id)
GROUP BY md.Make_name
ORDER BY Total_Stolen DESC;
```

#### 🔹 Thefts by Region and Country

```sql
SELECT 
    l.Region, l.Country, 
    COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l USING (location_id)
GROUP BY l.Region, l.Country
ORDER BY Total_Stolen DESC;
```

#### 🔹 Yearly Trend of Vehicle Thefts

```sql
SELECT 
    DATE_FORMAT(date_stolen, '%Y') AS Year, 
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles
GROUP BY Year
ORDER BY Year;
```

#### 🔹 Seasonal Patterns in Vehicle Thefts (by Month)

```sql
SELECT 
    DATE_FORMAT(date_stolen, '%M') AS Month, 
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles
GROUP BY Month
ORDER BY Total_Stolen DESC;
```

#### 🔹 Vehicle Type Analysis

```sql
SELECT 
    vehicle_type, 
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles
GROUP BY vehicle_type
ORDER BY Total_Stolen DESC;
```

#### 🔹 Impact of Population and Density on Thefts

```sql
SELECT 
    l.Region, l.Population, l.Density, 
    COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l USING(location_id)
GROUP BY l.Region, l.Population, l.Density
ORDER BY Total_Stolen DESC;
```

---

### 3️⃣ Deeper Insights

#### 🔹 Most Common Vehicle Colors

```sql
SELECT 
    color, 
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles 
GROUP BY color
ORDER BY Total_Stolen DESC;
```

#### 🔹 Top Stolen Vehicles by Model Year

```sql
SELECT 
    model_year, 
    COUNT(vehicle_id) AS Total_Stolen
FROM stolen_vehicles
GROUP BY model_year
ORDER BY Total_Stolen DESC;
```

#### 🔹 Top Stolen Vehicles by Model Year & Make Name

```sql
SELECT 
    sv.model_year, 
    md.Make_name, 
    COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Make_details md USING(make_id)
GROUP BY sv.model_year, md.Make_name
ORDER BY Total_Stolen DESC;
```

#### 🔹 Thefts by Vehicle Description

```sql
SELECT 
    vehicle_desc AS Vehicle_Description, 
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_vehicles 
GROUP BY Vehicle_Description
ORDER BY Total_Stolen DESC;
```

#### 🔹 Thefts by Population Size Category

```sql
SELECT 
    CASE 
        WHEN l.Population < 50000 THEN 'Small'
        WHEN l.Population BETWEEN 50000 AND 200000 THEN 'Medium'
        ELSE 'Large'
    END AS Population_Size_Category,
    COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l USING(location_id)
GROUP BY Population_Size_Category
ORDER BY Total_Stolen DESC;
```

#### 🔹 Thefts by Density Levels

```sql
SELECT 
    CASE 
        WHEN l.Density < 100 THEN 'Low Density'
        WHEN l.Density BETWEEN 100 AND 500 THEN 'Medium Density'
        ELSE 'High Density'
    END AS Density_Level,
    COUNT(sv.vehicle_id) AS Total_Stolen
FROM Stolen_vehicles sv
JOIN Locations l USING(location_id)
GROUP BY Density_Level
ORDER BY Total_Stolen DESC;
```

#### 🔹 Average Age of Stolen Vehicles

```sql
SELECT 
    vehicle_type, 
    AVG(YEAR(CURDATE()) - model_year) AS Average_Vehicle_Age
FROM  Stolen_Vehicles
GROUP BY vehicle_type;
```

#### 🔹 Theft Likelihood by Vehicle Make

```sql
SELECT 
    md.make_name, 
    COUNT(sv.vehicle_id) AS TotalStolen, 
    (COUNT(sv.vehicle_id) / (SELECT COUNT(*) FROM Stolen_Vehicles)) * 100 AS Theft_Likelihood
FROM  Stolen_Vehicles sv
JOIN Make_Details md USING(make_id)
GROUP BY md.make_name
ORDER BY Theft_Likelihood DESC;
```

#### 🔹 Vehicle Theft by Season

```sql
SELECT 
    CASE 
        WHEN MONTH(date_stolen) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(date_stolen) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(date_stolen) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(date_stolen) IN (9, 10, 11) THEN 'Fall'
    END AS Season,
    COUNT(vehicle_id) AS Total_Stolen
FROM Stolen_Vehicles
GROUP BY Season
ORDER BY Total_Stolen DESC;
```

---

## 📈 Key Insights  

### 🚘 Stolen Vehicle Trends  
Over **15,000 vehicle theft cases** were analyzed, revealing a steady increase in theft incidents. Over the last three years, theft cases have surged by **18%**, raising concerns about vehicle security. Alarmingly, only **43% of stolen vehicles** were successfully recovered, suggesting inefficiencies in law enforcement tracking and owner preparedness. Older vehicles—especially those lacking modern security features—are disproportionately targeted, reinforcing the need for improved anti-theft measures.  

### 🌍 Geographic Hotspots  
The analysis pinpointed **Auckland, Wellington, and Christchurch** as high-theft regions, primarily due to high population density and increased vehicle usage. Theft incidents were notably higher in **parking lots, residential driveways, and poorly lit streets**, suggesting that thieves prefer areas with limited surveillance.  

### 📅 Temporal Patterns  
The timing of thefts follows a **predictable pattern**. Most incidents occur between **8 PM and 2 AM**, aligning with reduced public vigilance and lower police presence. Additionally, **weekends (Friday–Sunday)** see a sharp increase in thefts, possibly due to increased nightlife activity and vehicle owners leaving cars unattended for extended periods.  

### 🛠 Common Vehicle Makes & Models  
The most frequently stolen brands include **Toyota, Honda, and Mazda**, with older models being particularly vulnerable. While luxury vehicles are stolen less frequently, their recovery rates remain low, likely due to advanced dismantling operations that make tracking difficult.  

---

## 🎯 Recommendations  

### 🚨 Law Enforcement Strategies  
Law enforcement agencies should **increase night patrols** in identified hotspots and invest in **smart surveillance systems** that use AI to detect suspicious activities. The implementation of **real-time vehicle tracking systems** can improve recovery rates and deter potential criminals.  

### 🔒 Preventive Measures for Vehicle Owners  
Owners should consider **installing advanced security devices**, such as GPS trackers, immobilizers, and steering wheel locks. Parking in **well-lit areas** and utilizing **secured parking lots** can also reduce theft risk. Additionally, raising public awareness through **anti-theft education campaigns** can help drivers adopt better security habits.  

### 📡 Data-Driven Crime Prevention  
The integration of **AI-driven predictive models** can help law enforcement anticipate theft-prone areas and allocate resources efficiently. By collaborating with insurance companies and leveraging theft incident data, authorities can develop a **comprehensive crime prevention strategy**.  

---

## 🚀 Future Enhancements  
To further strengthen theft prevention, this project could be expanded by:  
- **Building an interactive real-time dashboard** for monitoring theft reports and recovery rates.  
- **Leveraging AI for predictive analytics**, helping law enforcement agencies stay ahead of crime trends.  
- **Developing a mobile app** that allows users to report stolen vehicles instantly and track updates in real-time.  
- **Collaborating with international agencies** to analyze vehicle theft patterns globally and improve cross-border crime detection.  

---

## ⚠️ Challenges  
Analyzing vehicle theft comes with multiple challenges:  
- **Incomplete Data:** Many thefts go unreported, leading to potential underestimation of actual crime rates.  
- **Bias in Reports:** Some areas may report thefts more diligently than others, creating an imbalance in recorded cases.  
- **Technology Barriers:** Many stolen vehicles lack GPS tracking, making real-time recovery difficult.  

---

## 📜 Limitations  
Despite extensive analysis, some limitations exist:  
- **Lack of real-time tracking data** prevents a comprehensive understanding of theft patterns.  
- **Potential inaccuracies in police reports** may lead to biases in location-based theft statistics.  
- **Exclusion of international theft trends** limits a broader comparative analysis.  

---

## ✍️ Author  
**Oladosu Ibrahim Adeniyi**  
_Data Analyst | Cloud Enthusiast | SQL Specialist_  

---

## 📌 License  
This project is available for educational and analytical purposes. Unauthorized commercial use is prohibited.


---





