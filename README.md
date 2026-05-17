## TPRM: Vendor Risk Analysis & Fraud Intelligence System 
Applied to the Fintech & Digital Payments Industry
- OVERVIEW

Fintech companies rely heavily on third-party vendors payment processors, KYC/KYB providers, cloud infrastructure, and compliance partners. Each relationship introduces risk. Each relationship introduces operational, cybersecurity, financial, and regulatory risk.
This project simulates how real world risk teams operate: not just identifying risky vendors, but understanding why they are risky, detecting fraud signals, and recommending actionable responses.
The project is built on 1,000 simulated vendor records, combining SQL-based analytics with an executive Power BI dashboard.

It aligns with both:

- Nigerian regulatory frameworks (CBN, FATF/GIABA, NDPA)
- Global standards (PCI-DSS, FCA, GDPR)
## Why I Built This:

Fintech companies today are only as strong as the vendors they trust. Payment processors, KYC providers, cloud hosts, legal partners these third parties sit at the heart of how a fintech operates, and every single one of them introduces risk. The problem is that most organisations have no structured, data driven way to manage that exposure. Vendor decisions get made on gut feel, compliance reviews happen reactively, and fraud signals go undetected until an audit uncovers them or money has already left the building.
That is the problem this project was built to solve.
When the numbers came back, the picture was stark. Nearly half the vendor portfolio 48.1% fell into the High or Critical risk tiers. Every single vendor category scored below the 60 points cybersecurity threshold meaning the exposure was not isolated to one area. On the fraud side, 544 vendors were flagged for unusually high contract values, 9 showed round number invoice patterns consistent with fictitious billing, and one onboarding date had 6 vendors registered simultaneously a known signal for synthetic vendor network creation.
Beyond the findings, what makes this project meaningful is what it enables. Procurement teams get an objective basis for contract decisions. Finance teams get early fraud detection before money leaves the organisation. Leadership gets a clear answer on whether third-party exposure sits within the organisation's risk appetite. And the compliance team gets automated alerts and audit ready documentation so when a regulator comes knocking, the evidence is already there.

## Tools & Technologies
- SQL (MySQL)
- Power BI
- Excel (for data validation)
- Data Cleaning & Validation
- Risk Scoring Models
- Fraud Detection Analytics

This project demonstrates how data can support risk, compliance, and fraud intelligence teams in financial institutions.

## Project Structure

```bash
tprm-vendor-risk-fraud-intelligence/
│
├── 01_Database_Setup.sql
├── 02_Data_Cleaning.sql
├── 03_Risk_Analysis_Reports.sql
├── 04_Fraud_Intelligence.sql
├── 05_Stored_Procedures.sql
│
├── TPRM_Dashboard.pbix
├── TPRM_Fintech_Report_Final.docx
└── TPRM_Technical_Appendices.docx
```

Key features:

Risk distribution (donut chart)
Industry criticality (bar chart)
Vendor tier classification
Fraud anomaly tracking (horizontal bar chart)
KPI cards:
Data quality status
Regulatory coverage

Every visual is directly linked to SQL queries, ensuring full traceability from dashboard to raw data.

Project Modules
## 01 Database Setup

Two table schema:

TRPM vendor (KYB data)
Vendor audit (risk scores)

Fields include:

- Country
- Onboarding date
- Contract value
- Data access flag
- Incident count
## 02 Data Cleaning
Six step data quality pipeline:

- Referential integrity checks
- Score validation
- Null handling
- Duplicate removal (47 records identified)
- Category standardisation
- Future-date validation


## 03 Risk Analysis

Developed a weighted vendor risk scoring model:

- Cybersecurity (50%)
- Financial (30%)
- Compliance (20%)

Includes:

- Industry risk analysis
- Audit freshness tracking
- Remediation mapping for high-risk vendors
## 04 Fraud Intelligence

Five fraud detection scenarios:

- High contract values: Payment processor overbilling
- Missing country data: Ghost vendor / AML bypass
- Bulk onboarding (same date): Synthetic vendor networks
- Low risk with high incidents:  Risk model manipulation
- Round number contracts: Fictitious invoicing (Benford’s Law)
## 05 Stored Procedures

Automated reporting using parameterised procedures:

CALL Get_Industry_Risk_Report('Cloud Provider');
CALL Get_Top_Vendors(80);
CALL Get_Compliance_Alerts();
Key Skills Demonstrated
SQL (advanced querying, joins, aggregations, stored procedures)
Data cleaning and validation
Risk modeling and scoring
Fraud detection logic
Power BI dashboard development
Regulatory awareness (fintech compliance)


## Power Bi Dashboard

The Power BI dashboard covers two pages:
Page 1: Executive Overview
Portfolio risk distribution, vendor tier classification, average cybersecurity scores by category, fraud anomaly detection summary, and four KPI cards covering compliance alerts, High and Critical exposure, low risk vendors, and total fraud cases. Includes three dropdown slicers — Risk Status, Category, and Vendor Tier — that filter all visuals simultaneously.
Page 2: Findings and Recommendations
Key findings with priority badges, recommendations with timeline badges, and full regulatory framework alignment across CBN, FATF/GIABA, NDPA 2023, PCI-DSS, FCA Operational Resilience, and GDPR.

## Regulatory Alignment 

This framework maps to specific compliance obligations in both the Nigerian and global fintech regulatory environment:

- CBN Risk Based Cybersecurity Framework 
- FATF / GIABA AML and KYB
- Nigeria Data Protection Act 2023 (NDPA)
- PCI-DSS
- FCA Operational Resilience
- GDPR


## Challenges Encountered

During the development of this project, several technical and analytical challenges were encountered:

- Data Quality Issues
- Risk Classification Inconsistencies
- SQL Stored Procedure Execution
- Data Integration Challenges
- Dashboard Visualization Challenges
Some visuals, including the risk distribution chart, initially failed to display correctly due to field mapping and data model issues. Adjustments to relationships and field selections were required.

## Lessons Learned

These challenges strengthened understanding of:
- Data cleaning and validation
- SQL debugging and optimization
- Stored procedures and automation
- Power BI dashboard development
- Risk analysis and fraud intelligence reporting
- Translating technical analysis into business-focused insights


Author

Bolaji Olalekan
- Data & Risk Analyst | TPRM | GRC | Fraud Intelligence | SQL | Power BI | Fintech Compliance
