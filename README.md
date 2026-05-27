# HR Employee Attrition Analysis using PostgreSQL & Power BI

## Project Overview

This project focuses on analyzing employee attrition patterns using PostgreSQL and Power BI to identify the major factors contributing to workforce turnover. The analysis helps HR departments understand employee behavior, burnout risk, job satisfaction trends, and retention challenges through data-driven insights and interactive dashboards.

---

## Problem Statement

Employee attrition negatively impacts organizational productivity, increases hiring costs, and affects workforce stability. The objective of this project is to analyze HR employee data and uncover the key factors responsible for employee turnover using SQL analysis and business intelligence dashboards.

---

## Objectives

- Calculate overall employee attrition rate
- Identify departments with highest attrition
- Analyze overtime impact on employee exits
- Study salary and promotion-related attrition
- Detect burnout risk among employees
- Identify high-performing employees leaving the organization
- Build interactive HR analytics dashboard

---

## Technologies Used

- PostgreSQL
- SQL
- Power BI
- pgAdmin
- Excel / CSV

---

## Dataset Information

The dataset contains HR employee records with features such as:

- Employee Number
- Department
- Job Role
- Monthly Income
- Overtime
- Job Satisfaction
- Work-Life Balance
- Performance Rating
- Distance From Home
- Years Since Last Promotion
- Attrition Status

---

## SQL Concepts Used

- Aggregate Functions
- CASE Statements
- GROUP BY
- ORDER BY
- FILTER Clause
- Conditional Logic
- Business Analysis Queries
- Data Segmentation

---

## Business Questions Solved

1. What is the overall attrition rate?
2. Which department has the highest attrition?
3. Does overtime increase employee attrition?
4. Which salary range experiences maximum attrition?
5. Which job roles have highest attrition and lowest salary?
6. How does job satisfaction affect attrition?
7. Does long distance from home increase attrition?
8. Which age group has highest employee attrition?
9. Are employees without promotion more likely to leave?
10. How Does Time Spent With Current Manager Affect Employee Attrition?
11. Which employees are high-performance but still leaving?
12. Which combination of factors causes maximum attrition?
13. Employee burnout detection analysis

---

## Key Findings

- Employees working overtime showed significantly higher attrition rates.
- Low salary employees experienced maximum attrition.
- Poor work-life balance and low job satisfaction strongly contributed to employee exits.
- Younger employees showed higher turnover trends compared to senior employees.
- Employees without promotion for long periods were more likely to leave.
- Burnout indicators strongly correlated with attrition patterns.
- High-performing employees were also leaving the organization, indicating retention challenges.

---

## Dashboard Features

- Interactive KPI Cards
- Department-wise Attrition Analysis
- Burnout Risk Analysis
- Overtime Impact Visualization
- Salary & Promotion Insights
- High Performer Attrition Tracking
- Employee Behavior Analytics
- Advanced HR Insights

---

## Power BI Dashboard Pages

### Page 1 — Attrition Overview
- Overall Attrition Rate
- Department Attrition
- Overtime Analysis
- Salary Range Analysis

### Page 2 — Employee Behavior Analysis
- Job Satisfaction Analysis
- Distance From Home Analysis
- Promotion Analysis
- Age Group Attrition

### Page 3 — Advanced HR Insights
- Burnout Detection
- High Performer Attrition
- Multi-factor Attrition Analysis
- Manager-wise Attrition

---

---

## Sample SQL Query

```sql
SELECT department,

    COUNT(*) FILTER ( WHERE attrition = 'Yes' ) AS attrition_count,

    ROUND( COUNT(*) FILTER (WHERE attrition = 'Yes') * 100.0 / COUNT(*), 2 ) AS attrition_rate

FROM employee_attrition

GROUP BY department

ORDER BY attrition_rate DESC;
```

---

## Results

The project successfully identified major employee attrition drivers including overtime, low job satisfaction, salary imbalance, poor work-life balance, and lack of promotion opportunities. The dashboard enables HR teams to make informed workforce retention decisions.

---

## Future Improvements

- Add predictive attrition modeling using Machine Learning
- Integrate automated HR reporting
- Deploy dashboard to Power BI Service
- Add employee retention recommendation system

---

## How to Run the Project

1. Import dataset into PostgreSQL
2. Execute SQL analysis queries
3. Connect PostgreSQL data with Power BI
4. Build interactive dashboards and KPIs

---

## Author

Vrijesh S. Balam
