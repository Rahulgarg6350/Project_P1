# Disaster Affected Region Tracker Analysis

## 📌 Project Overview

This project demonstrates a simple **ETL (Extract–Transform–Load)** pipeline using Python and MySQL.
It loads disaster-related datasets from CSV files, cleans and preprocesses the data using Pandas, and stores the processed data into a MySQL database.

The goal of this project is to showcase:

* Data preprocessing with Python
* Database connectivity using SQLAlchemy
* Loading structured data into MySQL tables
* Basic database integration workflow for analytics

---

## 🗂 Dataset Files

The project uses the following CSV datasets:

* `disaster_events.csv` — Contains disaster event details
* `region.csv` — Contains region demographic information
* `impact_assessment.csv` — Contains disaster impact statistics

---

## 🛠 Technologies Used

* Python
* Pandas
* SQLAlchemy
* MySQL
* Jupyter Notebook

---

### STEP 1 — Import & Load Data

```python
import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

events = pd.read_csv("disaster_events.csv")
regions = pd.read_csv("regions.csv")
impact = pd.read_csv("impact_assessment.csv")
```

---

### STEP 2 — Data Cleaning

```python
events.drop_duplicates(inplace=True)
regions.drop_duplicates(inplace=True)
impact.drop_duplicates(inplace=True)

events['event_date'] = pd.to_datetime(events['event_date'], errors='coerce')
events.dropna(subset=['event_date'], inplace=True)

regions['population'].fillna(regions['population'].median(), inplace=True)
impact.fillna(0, inplace=True)
```

---

### STEP 3 — MySQL Connection

```python
engine = create_engine("mysql+pymysql://username:password@localhost/Project1")
```

---

### STEP 4 — Load to Database

```python
events.to_sql("disaster_events", engine, if_exists="replace")
regions.to_sql("regions", engine, if_exists="replace")
impact.to_sql("impact_assessment", engine, if_exists="replace")
```

---

### STEP 5 — Merge for Analysis

```python
df = events.merge(impact, on="event_id")\
           .merge(regions, on="region", how="left")
```

---


## 📊 Dashboard Problem Statements (Matplotlib)

### 🔹 1. Top 5 Regions by Total Affected Population

![Top Regions](images/top5_regions.png)

---

### 🔹 2. Disaster Severity Distribution by Type

![Severity Distribution](images/severity_distribution.png)

---

### 🔹 3. Trend of Disasters Over Time (Monthly)

![Monthly Trend](images/monthly_trend.png)

---

### 🔹 4. Economic Loss vs Affected Population Scatter Plot

![Scatter Plot](images/loss_vs_population.png)

---

### 🔹 5. Region-wise Disaster Frequency Heatmap

![Heatmap](images/region_heatmap.png)

---

## ✅ Project Outcome

* Cleaned and structured disaster datasets
* Successfully stored data in MySQL tables
* Demonstrated ETL pipeline workflow
* Generated visual dashboards for analytical insights
* Ready for further SQL analysis or visualization

---

## 🚀 Future Improvements

* Add data validation checks
* Create automated ETL scripts
* Implement interactive dashboards (Plotly/Power BI)
* Add advanced SQL analytics queries

---

## 👨‍💻 Author

Rahul Garg
