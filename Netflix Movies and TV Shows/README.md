---

# 📺 Netflix Movies and TV Shows Data Analysis using SQL

![Netflix Logo](https://github.com/najirh/netflix_sql_project/blob/main/logo.png)

## 1️⃣ 📚 Project Overview

This project focuses on analyzing Netflix’s catalog of movies and TV shows using SQL. By exploring this dataset, we aim to uncover meaningful insights related to content type, distribution, ratings, durations, countries, genres, and more. This analysis can inform content strategy, business decisions, and viewer engagement tactics.

---

## 2️⃣ 📂 Data Source

The dataset used for this analysis was sourced from Kaggle:

🔗 [Netflix Movies and TV Shows Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

---

## 3️⃣ 🛠 Tools & Technologies

* **SQL** (MySQL)
* **Kaggle Dataset**
* **Data Cleaning Techniques**

---

## 4️⃣ 🔍 Data Cleaning & Preparation

While the dataset is relatively structured, some cleaning and preprocessing steps were considered:

* 🔹 **Handling Missing Values**: Ensured fields like `director`, `casts`, and `country` were handled appropriately.
* 🔹 **Standardization & Formatting**:

  * Converted `date_added` to proper `DATE` format.
  * Split multiple entries in `country`, `casts`, and `listed_in` using `STRING_TO_ARRAY()` for granular analysis.

---

## 5️⃣ 📌 SQL Queries & Exploratory Analysis

Below is a breakdown of business questions addressed using SQL:

### 🔹 **Content Distribution** – Movies vs. TV Shows

```sql
SELECT type, COUNT(*) FROM netflix GROUP BY 1;
```

🎯 *Determine the distribution of content types.*

---

### 🔹 **Most Common Ratings for Each Type**

```sql
WITH RatingCounts AS (
    SELECT type, rating, COUNT(*) AS rating_count
    FROM netflix GROUP BY type, rating
),
RankedRatings AS (
    SELECT type, rating, rating_count,
    RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT type, rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;
```

🎯 *Understand content rating preferences.*

---

### 🔹 **Movies Released in 2020**

```sql
SELECT * FROM netflix WHERE release_year = 2020;
```

🎯 *Track recent releases.*

---

### 🔹 **Top 5 Countries by Content Count**

```sql
SELECT * FROM (
    SELECT UNNEST(STRING_TO_ARRAY(country, ',')) AS country, COUNT(*) AS total_content
    FROM netflix GROUP BY 1
) AS t1
WHERE country IS NOT NULL
ORDER BY total_content DESC LIMIT 5;
```

🎯 *Identify regions with the most content.*

---

### 🔹 **Longest Movie**

```sql
SELECT * FROM netflix
WHERE type = 'Movie'
ORDER BY SPLIT_PART(duration, ' ', 1)::INT DESC;
```

🎯 *Spotlight on Netflix’s longest film.*

---

### 🔹 **Content Added in the Last 5 Years**

```sql
SELECT * FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';
```

🎯 *Understand recent content trends.*

---

### 🔹 **Content by Director: Rajiv Chilaka**

```sql
SELECT * FROM (
    SELECT *, UNNEST(STRING_TO_ARRAY(director, ',')) AS director_name FROM netflix
) AS t
WHERE director_name = 'Rajiv Chilaka';
```

🎯 *Explore works by a specific creator.*

---

### 🔹 **TV Shows with More Than 5 Seasons**

```sql
SELECT * FROM netflix
WHERE type = 'TV Show'
  AND SPLIT_PART(duration, ' ', 1)::INT > 5;
```

🎯 *Identify binge-worthy shows.*

---

### 🔹 **Content Count by Genre**

```sql
SELECT UNNEST(STRING_TO_ARRAY(listed_in, ',')) AS genre, COUNT(*) AS total_content
FROM netflix GROUP BY 1;
```

🎯 *Understand genre preferences.*

---

### 🔹 **Top 5 Years by Indian Content Share**

```sql
SELECT country, release_year, COUNT(show_id) AS total_release,
ROUND(COUNT(show_id)::numeric /
(SELECT COUNT(show_id) FROM netflix WHERE country = 'India')::numeric * 100, 2) AS avg_release
FROM netflix
WHERE country = 'India'
GROUP BY country, release_year
ORDER BY avg_release DESC
LIMIT 5;
```

🎯 *Analyze India's content release trend.*

---

### 🔹 **All Documentaries**

```sql
SELECT * FROM netflix WHERE listed_in LIKE '%Documentaries';
```

🎯 *List content focused on real stories.*

---

### 🔹 **Content Without a Director**

```sql
SELECT * FROM netflix WHERE director IS NULL;
```

🎯 *Spot incomplete records.*

---

### 🔹 **Salman Khan Movies (Last 10 Years)**

```sql
SELECT * FROM netflix
WHERE casts LIKE '%Salman Khan%'
AND release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10;
```

🎯 *Analyze an actor’s recent works.*

---

### 🔹 **Top 10 Indian Movie Actors by Count**

```sql
SELECT UNNEST(STRING_TO_ARRAY(casts, ',')) AS actor, COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY actor
ORDER BY COUNT(*) DESC
LIMIT 10;
```

🎯 *Identify popular Indian actors.*

---

### 🔹 **Content Categorization by Keywords (Kill, Violence)**

```sql
SELECT category, COUNT(*) AS content_count
FROM (
    SELECT CASE 
        WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
        ELSE 'Good' END AS category
    FROM netflix
) AS categorized_content
GROUP BY category;
```

🎯 *Classify content sentiment.*

---

## 6️⃣ 📈 Key Insights

* 📌 **Movies dominate** Netflix’s catalog, but TV Shows are substantial.
* 📌 **TV Shows** tend to have a more consistent rating structure.
* 📌 **United States, India, and the UK** are major content providers.
* 📌 **Genres like Documentaries and Dramas** are prominently featured.
* 📌 **Recent years** have seen a spike in content addition, especially from India.
* 📌 **Keyword analysis** helps identify potentially violent content.

---

## 7️⃣ 🎯 Recommendations

* 🔹 **For Viewers**: Use genre and rating trends to guide content choices.
* 🔹 **For Netflix**: Increase localization for countries with growing contributions (like India).
* 🔹 **For Content Strategy**: Track high-performing genres and expand content in those niches.
* 🔹 **For Content Moderation**: Consider keyword tagging to identify mature or violent content.

---

## 8️⃣ 🚀 Future Enhancements

* 🔄 Integrate with visualization tools like **Power BI** or **Tableau**.
* 📦 Build **dashboards** to enhance insights.
* ⏳ Automate data ingestion for real-time analysis.

---

## 9️⃣ ⚠️ Challenges

* 🎭 Inconsistencies in the `country`, `director`, and `casts` fields.
* 🗓 Varying formats in `date_added` and `duration` required preprocessing.
* 🎥 Ambiguity in genre classifications (e.g., multiple genres per record).

---

## 🔟 📜 Limitations

* The dataset is **not updated in real-time**; it reflects a static snapshot.
* Some records may have **missing or incomplete information**.

---

## ✍️ Author

**Oladosu Ibrahim Adeniyi**
*Data Analyst | Cloud Enthusiast | Business Intelligence Developer*

📧 **Email**: [oladosuadeniyi39@gmail.com](mailto:oladosuadeniyi39@gmail.com)
🔗 **LinkedIn**: [linkedin.com/in/oladosu-ibrahim-12427b197](https://www.linkedin.com/in/oladosu-ibrahim-12427b197)

---

## 📌 License

This project is licensed under the MIT License — feel free to use, share, or modify with attribution.

---


