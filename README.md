## Project Structure
- sql/ SQL scripts for analysis  
- screenshots/ Query results and outputs  
- TPRM_Project_Report.pdf/ Full project report
- # Third-Party Risk Management (TPRM): Vendor Risk & Fraud Analysis

---

## Project Overview

This project focuses on analyzing vendor risk and detecting potential fraud patterns within a Third-Party Risk Management (TPRM) framework using SQL.

The goal is to ensure data quality, assess vendor risk exposure, and uncover suspicious activities that could impact business operations.

---

## Objectives

- Perform data cleaning and validation  
- Analyze vendor risk levels and distribution  
- Develop a weighted risk scoring model  
- Detect fraud patterns and anomalies  
- Build automated reporting using stored procedures  

---

## Dataset Description

The project uses two main tables:

- **tprm_vendors** → Vendor information (name, category, contract value, country, etc.)  
- **vendor_audit** → Risk metrics (cyber score, financial score, compliance score, audit date)  

These tables are joined using `vendor_id`.

---

## Data Cleaning

Key data quality checks performed:

- Identified missing and null values  
- Detected invalid risk scores (outside 0–100 range)  
- Checked for duplicate audit records  
- Standardized vendor categories  
- Validated date consistency  

---

## Risk Analysis

### Risk Distribution

- Low Risk: **28%**  
- Medium Risk: **25%**  
- High Risk: **22%**  
- Critical Risk: **25%**  

 **45% of vendors fall into high and critical risk categories**, indicating significant exposure.

---

### Weighted Risk Scoring

A composite risk model was created using:

- Cyber Score → 50%  
- Financial Score → 30%  
- Compliance Score → 20%  

This helps prioritize vendors based on overall risk exposure.

---

### Key Risk Insights

- A large portion of vendors fall into medium to high risk categories  
- Certain vendor categories show lower cyber security performance  
- Continuous monitoring is required for high risk vendors  

---

## Fraud Intelligence

### Key Findings

- **544 vendors** flagged with unusually high contract values  
- **0 ghost vendors** (no missing country data)  
- **1 onboarding anomaly** detected  
- **0 risk vs incident mismatches**  
- **11 vendors** showed round-number transaction patterns  

---

### Insight

While data quality and classification appear consistent, the high number of vendors with large contract values suggests potential financial risk and the need for further audit controls.

---

## Stored Procedures

The project includes reusable SQL procedures for:

- Industry-based risk analysis  
- Identifying top-performing vendors  
- Generating compliance alerts  

These improve efficiency and enable dynamic reporting.

---

## Key Takeaways

- Data cleaning is critical for reliable analysis  
- Nearly half of vendors fall into high risk categories  
- Fraud detection requires pattern based analysis  
- SQL can be effectively used for risk automation and monitoring  

---

## Conclusion

This project demonstrates how SQL can be used to manage vendor risk, detect fraud patterns, and support business decision-making.

Organizations can leverage these insights to improve vendor governance, reduce exposure, and strengthen internal controls.

---

## Author

**Bolaji Olalekan**  
Data Analyst | SQL | Power BI | Risk & Fraud Analytics  
