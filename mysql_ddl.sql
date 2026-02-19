CREATE DATABASE IF NOT EXISTS Project1;
USE Project1;

CREATE TABLE disaster_events (
    event_id INT PRIMARY KEY,
    disaster_type VARCHAR(50),
    region VARCHAR(50),
    event_date DATE,
    severity VARCHAR(20)
);

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region VARCHAR(50),
    population BIGINT,
    area_sq_km INT
);

CREATE TABLE impact_assessment (
    impact_id INT PRIMARY KEY,
    event_id INT,
    affected_people INT,
    economic_loss_musd DECIMAL(10,2),
    FOREIGN KEY (event_id) REFERENCES disaster_events(event_id)
);

SELECT * FROM disaster_events LIMIT 10;
SELECT * FROM regions LIMIT 10;
SELECT * FROM impact_assessment LIMIT 10;

----Total affected people per region---
SELECT r.region, SUM(i.affected_people) AS total_affected
FROM impact_assessment i
JOIN disaster_events e ON i.event_id = e.event_id
JOIN regions r ON e.region = r.region
GROUP BY r.region
ORDER BY total_affected DESC;

-----Disaster count by type----
SELECT disaster_type, COUNT(*) AS total_events
FROM disaster_events
GROUP BY disaster_type;

-----Monthly disaster trend----
SELECT DATE_FORMAT(event_date,'%Y-%m') AS month, COUNT(*) AS events
FROM disaster_events
GROUP BY month
ORDER BY month;

-----Avg economic loss per disaster type----
SELECT e.disaster_type, AVG(i.economic_loss_musd) AS avg_loss
FROM impact_assessment i
JOIN disaster_events e
ON i.event_id = e.event_id
GROUP BY e.disaster_type;

------ Most severe disaster regions---
SELECT region, severity, COUNT(*) AS freq
FROM disaster_events
GROUP BY region, severity
ORDER BY freq DESC;
