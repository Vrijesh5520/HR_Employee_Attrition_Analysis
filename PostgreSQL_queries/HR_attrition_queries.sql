-- Creating table
CREATE TABLE employee
(
Age INT,
Attrition VARCHAR(5),
BusinessTravel VARCHAR(20),
Department VARCHAR(25),
DistanceFromHome INT,
EducationField VARCHAR(20),
EmployeeNumber INT PRIMARY KEY,
EnvironmentSatisfaction INT,
Gender VARCHAR(10),
JobLevel INT,
JobRole VARCHAR(25),
JobSatisfaction INT,
MaritalStatus VARCHAR(10),
MonthlyIncome INT,
OverTime VARCHAR(5),
PercentSalaryHike INT,
PerformanceRating INT,
WorkLifeBalance INT,
YearSinceLastPromotion INT,
YearWithCurrManager INT
);

-- 1) What isthe Overall Attrition Rate?
SELECT 
  COUNT(*) AS total_employees,
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS employees_left,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate 
FROM employee_attrition;

-- 2) Which Department Has the Highest Attrition Rate?
SELECT department , 
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition 
GROUP BY department ORDER BY attrition_rate DESC;

-- 3) Does Overtime Increase Employee Attrition?
SELECT overtime, 
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY overtime ORDER BY attrition_rate DESC;

-- 4) Which Salary Range Experiences Maximum Attrition?
SELECT 
  CASE
    WHEN monthlyincome < 3000 THEN 'Low Salary'
    WHEN monthlyincome BETWEEN 3000 AND 7000 THEN 'Medium Salary'
    ELSE 'High Salary'
  END AS salary_range,
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count
FROM employee_attrition
GROUP BY salary_range ORDER BY attrition_count DESC;

-- 5) Which Job Roles Have Highest Attrition and Lowest Salary?
SELECT jobrole , COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  ROUND(AVG(monthlyincome),2) AS average_salary
FROM employee_attrition
GROUP BY jobrole ORDER BY attrition_count DESC, average_salary ASC;

-- 6) How Does Job Satisfaction Affect Attrition?
SELECT jobsatisfaction , COUNT(*) FILTER (WHERE attrition = 'Yes' ) AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY jobsatisfaction ORDER BY jobsatisfaction;

-- 7) Does Long Distance From Home Increase Attrition?
SELECT 
  CASE
    WHEN distancefromhome <= 5 THEN 'Near'
    WHEN distancefromhome BETWEEN 6 AND 15 THEN 'Medium'
    ELSE 'Far'
  END AS distance_category,
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY distance_category ORDER BY attrition_rate DESC;

-- 8) Which Age Group Has Highest Employee Attrition?
SELECT 
  CASE
    WHEN age BETWEEN 18 AND 30 THEN '18-30'
    WHEN age BETWEEN 31 AND 40 THEN '31-40'
    WHEN age BETWEEN 41 AND 50 THEN '41-50'
    ELSE '50+'
  END AS age_group,
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY age_group ORDER BY attrition_rate DESC;

-- 9) Are Employees Without Promotion More Likely to Leave?
SELECT 
  CASE
    WHEN yearssincelastpromotion <= 2 THEN 'Recently Promoted'
    WHEN yearssincelastpromotion BETWEEN 3 AND 5 THEN 'Moderate Delay'
    ELSE 'Long No Promotion'
  END AS promotion_status,
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY promotion_status ORDER BY attrition_rate DESC;

-- 10) How Does Time Spent With Current Manager Affect Employee Attrition?
SELECT manager,
  COUNT(*) FILTER (WHERE attrition = 'Yes') AS attrition_count,
  COUNT(*) AS total_employees,
  ROUND(COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY manager ORDER BY attrition_rate DESC;


-- 11) Which Employees Are High-Performance but Still Leaving?
SELECT employeenumber, department, 
  jobrole,performancerating, 
  monthlyincome, jobsatisfaction
FROM employee_attrition
WHERE attrition = 'Yes' AND performancerating >= 4
ORDER BY monthlyincome DESC;

-- 12) Which Combination of Factors Causes Maximum Attrition?
SELECT overtime,
  jobsatisfaction,
  worklifebalance,
  COUNT(*) AS attrition_count
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY overtime, jobsatisfaction, worklifebalance
ORDER BY attrition_count DESC
LIMIT 10;

-- 13) Employee Burnout Detection Analysis
SELECT employeenumber, department, 
  jobrole, overtime, jobsatisfaction,
  worklifebalance, yearssincelastpromotion,
  CASE
    WHEN overtime = 'Yes' 
      AND jobsatisfaction <= 2
      AND worklifebalance <= 2
    THEN 'High Burnout Risk'
    WHEN overtime = 'Yes'
      OR jobsatisfaction <= 2
    THEN 'Medium Burnout Risk'
    ELSE 'Low Burnout Risk'
  END AS burnout_risk
FROM employee_attrition
ORDER BY burnout_risk;