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

## ⚙️ Project Workflow

### 1️⃣ Database Setup (MySQL)

* Create a database:

```sql
CREATE DATABASE Project1;
```

* Grant privileges (optional):

```sql
GRANT ALL PRIVILEGES ON Project1.* 
TO 'your_username'@'localhost';

FLUSH PRIVILEGES;
```

---

### 2️⃣ Environment Setup

Install required Python packages:

```bash
pip install pandas sqlalchemy mysql-connector-python
```

---

### 3️⃣ Extract — Load CSV Files

```python
import pandas as pd

events = pd.read_csv("disaster_events.csv")
regions = pd.read_csv("region.csv")
impact = pd.read_csv("impact_assessment.csv")
```

---

### 4️⃣ Transform — Data Cleaning

Example preprocessing:

```python
regions['population'] = regions['population'].fillna(regions['population'].median())
impact['affected_people'] = impact['affected_people'].fillna(0)
impact['economic_loss_musd'] = impact['economic_loss_musd'].fillna(0)
```

---

### 5️⃣ Load — Connect to MySQL

```python
from sqlalchemy import create_engine

engine = create_engine("mysql+mysqlconnector://username:password@localhost/Project1")
```

---

### 6️⃣ Write Data to MySQL Tables

```python
events.to_sql("disaster_events", engine, if_exists="replace", index=False)
regions.to_sql("regions", engine, if_exists="replace", index=False)
impact.to_sql("impact_assessment", engine, if_exists="replace", index=False)
```

---

### 7️⃣ Verify Tables in MySQL

```sql
USE Project1;
SHOW TABLES;
SELECT * FROM disaster_events;
```

---

## ✅ Project Outcome

* Cleaned and structured disaster datasets
* Successfully stored data in MySQL tables
* Demonstrated ETL pipeline workflow
* Ready for further SQL analysis or visualization

---

## 🚀 Future Improvements

* Add data validation checks
* Create automated ETL scripts
* Implement dashboard visualization
* Add advanced SQL analytics queries

---

## 👨‍💻 Author

**Rahul Garg**

---

## 📄 License

This project is for educational purposes.
