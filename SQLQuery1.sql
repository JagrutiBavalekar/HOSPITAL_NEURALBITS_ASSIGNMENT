use jagruti_hospital


SELECT 
  CASE 
    WHEN DATEDIFF(YEAR, dob, GETDATE()) < 18 THEN 'Child'
    WHEN DATEDIFF(YEAR, dob, GETDATE()) BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS total_patients
FROM patient
GROUP BY 
  CASE 
    WHEN DATEDIFF(YEAR, dob, GETDATE()) < 18 THEN 'Child'
    WHEN DATEDIFF(YEAR, dob, GETDATE()) BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END;
  --1
  -- Monthly
SELECT hospital_id,
       FORMAT(admission_datetime, 'yyyy-MM') AS month,
       COUNT(*) AS total_patients
FROM patient
GROUP BY hospital_id, FORMAT(admission_datetime, 'yyyy-MM');

-- Weekly
SELECT hospital_id,
       DATEPART(YEAR, admission_datetime) AS year,
       DATEPART(WEEK, admission_datetime) AS week,
       COUNT(*) AS weekly_patients
FROM patient
GROUP BY hospital_id, DATEPART(YEAR, admission_datetime), DATEPART(WEEK, admission_datetime);

-- Yearly
SELECT hospital_id,
       YEAR(admission_datetime) AS year,
       COUNT(*) AS yearly_patients
FROM patient
GROUP BY hospital_id, YEAR(admission_datetime);


--2
-- Daily
SELECT CAST(admission_datetime AS DATE) AS admission_date,
       COUNT(*) AS daily_occupancy
FROM patient
GROUP BY CAST(admission_datetime AS DATE);

-- Weekly
SELECT DATEPART(YEAR, admission_datetime) AS year,
       DATEPART(WEEK, admission_datetime) AS week,
       COUNT(*) AS weekly_occupancy
FROM patient
GROUP BY DATEPART(YEAR, admission_datetime), DATEPART(WEEK, admission_datetime);

-- Monthly
SELECT FORMAT(admission_datetime, 'yyyy-MM') AS month,
       COUNT(*) AS monthly_occupancy
FROM patient
GROUP BY FORMAT(admission_datetime, 'yyyy-MM');

-- Yearly
SELECT YEAR(admission_datetime) AS year,
       COUNT(*) AS yearly_occupancy
FROM patient
GROUP BY YEAR(admission_datetime);




--3

SELECT 
  CASE 
    WHEN DATEDIFF(YEAR, dob, GETDATE()) < 18 THEN 'Child'
    WHEN DATEDIFF(YEAR, dob, GETDATE()) BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  COUNT(*) AS total
FROM patient
GROUP BY 
  CASE 
    WHEN DATEDIFF(YEAR, dob, GETDATE()) < 18 THEN 'Child'
    WHEN DATEDIFF(YEAR, dob, GETDATE()) BETWEEN 18 AND 59 THEN 'Adult'
    ELSE 'Senior'
  END;




  --4

  SELECT TOP 1 medicine_name, COUNT(*) AS total_used
FROM treatment
GROUP BY medicine_name
ORDER BY total_used DESC;


--5

SELECT d.diagnosis_name, t.medicine_name, COUNT(*) AS total
FROM diagnosis d
JOIN treatment t ON d.patient_id = t.patient_id
GROUP BY d.diagnosis_name, t.medicine_name
HAVING COUNT(*) = (
    SELECT MAX(counts) FROM (
        SELECT COUNT(*) AS counts
        FROM diagnosis d2
        JOIN treatment t2 ON d2.patient_id = t2.patient_id
        WHERE d2.diagnosis_name = d.diagnosis_name
        GROUP BY t2.medicine_name
    ) AS inner_counts
);




--6

SELECT AVG(DATEDIFF(DAY, admission_datetime, discharge_datetime)) AS avg_days
FROM patient;



--7(1)

SELECT 
  FORMAT(p.admission_datetime, 'yyyy-MM') AS month,
  b.payment_mode,
  SUM(b.bill_amount) AS total_income
FROM billing b
JOIN patient p ON b.patient_id = p.patient_id
GROUP BY FORMAT(p.admission_datetime, 'yyyy-MM'), b.payment_mode
ORDER BY month;



--7(2)

SELECT 
  YEAR(p.admission_datetime) AS year,
  b.payment_mode,
  SUM(b.bill_amount) AS total_income
FROM billing b
JOIN patient p ON b.patient_id = p.patient_id
GROUP BY YEAR(p.admission_datetime), b.payment_mode
ORDER BY year;


