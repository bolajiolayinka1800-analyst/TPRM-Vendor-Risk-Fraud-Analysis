TPRM: Vendor Risk Analysis & Fraud Intelligence System
Applied to the Fintech & Digital Payments Industry


Why I Built This:
Fintech companies depend heavily on external vendors — payment processors, KYC/KYB providers, cloud infrastructure, legal and compliance partners. Each of those relationships carries risk. I wanted to build something that reflects how risk teams at real payment companies actually think: not just flagging problems, but understanding why a vendor is risky, what type of fraud signal it's showing, and what to do about it.
This project covers 1,000 simulated vendor records across five SQL modules and a Power BI executive dashboard. The regulatory references are drawn from real fintech practice — both Nigerian frameworks (CBN, FATF/GIABA, NDPA) and international standards (PCI-DSS, FCA, GDPR) making it applicable for roles in Nigeria and globally.

What's Inside
tprm-vendor-risk-fraud-intelligence/
│
├── 01_Database_Setup.sql           # Schema design, table creation, 1,000 vendor inserts
├── 02_Data_Cleaning.sql            # Data quality checks and standardisation pipeline
├── 03_Risk_Analysis_Reports.sql    # Risk scoring, industry analysis, remediation tracker
├── 04_Fraud_Intelligence.sql       # Five fraud detection queries
├── 05_Stored_Procedures.sql        # Automated reporting procedures
│
├── TPRM_Dashboard.pbix             # Power BI executive dashboard
├── TPRM_Fintech_Report_Final.docx  # Main project report (8 sections)
└── TPRM_Technical_Appendices.docx  # Full query documentation with fintech insights

The Dashboard
Built in Power BI to give executives and risk teams a single-view summary of the full vendor portfolio. It includes a donut chart for risk distribution, bar charts for industry criticality and vendor tier classification, a horizontal bar chart for fraud anomaly counts, and cards for data quality and regulatory framework coverage.
Every visual maps directly to a SQL query in the project making it straightforward to trace any dashboard number back to its source query and result set.

Modules
01 — Database Setup
Two-table schema: a vendor master registry with KYB fields (country, onboarding date, contract value, data access flag, incident count) and a vendor audit table storing periodic risk scores across cybersecurity, financial stability, and compliance dimensions.
02 — Data Cleaning
A six-step quality pipeline run before any analysis — checking referential integrity, score ranges, null fields, 47 duplicate entries, inconsistent category labels, and future-dated audit records. In a regulated fintech, any one of these is a compliance finding.
03 — Risk Analysis
Weighted risk scoring model combining cybersecurity (50%), financial (30%), and compliance (20%). Also includes an industry criticality analysis, audit freshness tracker, and a remediation tracker mapping each high-risk vendor to a specific corrective action.
04 — Fraud Intelligence
Five anomaly detection queries, each targeting a real fintech fraud typology:

High contract values → payment processor overbilling
Missing country data → ghost vendor / AML bypass
Same-date bulk onboarding → synthetic vendor network creation
Low risk with high incidents → risk model gaming
Round-number contracts → fictitious invoicing (Benford's Law)

05 — Stored Procedures
Three parameterised stored procedures for automated reporting — an industry risk filter, a top vendor identifier, and a weekly compliance alert system.
sqlCALL Get_Industry_Risk_Report('Cloud Provider');
CALL Get_Top_Vendors(80);
CALL Get_Compliance_Alerts();

## Author

**Bolaji Olalekan**  
Data Analyst | SQL | Power BI | Risk & Fraud Analytics  
