-- 1. EXECUTIVE SUMMARY (High-Level Profile)
-- Summary of total vendors, average risk scores, and overall status.
SELECT 
    Overall_risk_complaince AS Risk_Level,
    COUNT(*) AS Vendor_Count,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM vendor_audit)) * 100, 2) AS Percentage_of_Portfolio
FROM vendor_audit
GROUP BY Overall_risk_complaince
ORDER BY Field(Overall_risk_complaince, 'High', 'Medium', 'Low');



-- 2. WEIGHTED RISK SCORINGtprm_vendors
-- Formula: Cyber (50%), Financial (30%), Compliance (20%)
SELECT 
    vendor_name,
    industry,
    ROUND((cyber_score * 0.5) + (Financial_score * 0.3) + (Compliance_score * 0.2), 2) AS Weighted_Risk_Index,
    CASE 
        WHEN (cyber_score * 0.5) + (Financial_score * 0.3) + (Compliance_score * 0.2) > 75 THEN 'Elite Partner'
        WHEN (cyber_score * 0.5) + (Financial_score * 0.3) + (Compliance_score * 0.2) BETWEEN 50 AND 75 THEN 'Standard'
        ELSE 'High-Exposure / Remediation Required'
    END AS Vendor_Tier
FROM v_final_risk_report
ORDER BY Weighted_Risk_Index DESC;



-- 3. INDUSTRY CRITICALITY ANALYSIS
-- Identifying which sectors carry the most weight.
SELECT 
    v.Category,
    COUNT(v.vendor_id) AS Total_Vendors,
    AVG(a.cyber_score) AS Avg_Cyber_Score,
    AVG(a.Financial_score) AS Avg_Financial_Score,
    CASE 
        WHEN AVG(a.cyber_score) < 60 THEN 'IMMEDIATE ATTENTION'
        WHEN AVG(a.cyber_score) BETWEEN 60 AND 75 THEN 'MONITOR'
        ELSE 'STABLE'
    END AS Strategic_Priority
FROM tprm_vendors v
JOIN vendor_audit a ON v.vendor_id = a.vendor_id
GROUP BY v.Category
ORDER BY Avg_Cyber_Score ASC;



-- 4. RISK CONCENTRATION (The "Too Many Eggs" Problem)
SELECT v.category,
    COUNT(v.vendor_id) AS concentration_count,
    AVG(a.cyber_score) AS category_avg_risk
FROM tprm_vendors v
JOIN vendor_audit a ON v.vendor_id = a.vendor_id
GROUP BY v.category
HAVING COUNT(v.vendor_id) > 50;



--  THE "RED FLAG" REPORT (Risk Concentration)
-- Vendors that could cause a bankruptcy or a data breach tomorrow.
SELECT 
    v.vendor_name,
    v.category,
    a.cyber_score,
    a.Compliance_score,
    a.Overall_risk_complaince
FROM tprm_vendors v
JOIN vendor_audit a ON v.vendor_id = a.vendor_id
WHERE v.category = 'Critical' 
  AND (a.cyber_score < 50 OR a.Overall_risk_complaince = 'High')
ORDER BY a.cyber_score ASC;



-- 6. AUDIT FRESHNESS & HISTORICAL TRAIL
-- Tracking when vendors were last checked and mocking the audit timeline.
SELECT 
    vendor_name,
    audit_date,
    DATEDIFF(CURRENT_DATE, audit_date) AS Days_Since_Last_Audit,
    CASE 
        WHEN DATEDIFF(CURRENT_DATE, audit_date) > 365 THEN 'EXPIRED - Re-audit Required'
        WHEN DATEDIFF(CURRENT_DATE, audit_date) > 300 THEN 'EXPIRING SOON'
        ELSE 'COMPLIANT'
    END AS Compliance_Status
FROM v_final_risk_report
WHERE DATEDIFF(CURRENT_DATE, audit_date) > 300;



-- . THE REMEDIATION TRACKER
-- Queries that identify which vendors need a "Fix-it" plan.
SELECT 
    v.vendor_name,
    a.Overall_risk_complaince,
    'Urgent' AS action_priority,
    CASE 
        WHEN a.cyber_score < 40 THEN 'Initiate Technical Security Audit'
        WHEN a.Financial_score < 40 THEN 'Request 3-Year Audited Financials'
        ELSE 'Quarterly Performance Review'
    END AS consultant_next_steps
FROM tprm_vendors v
JOIN vendor_audit a ON v.vendor_id = a.vendor_id
WHERE a.Overall_risk_complaince = 'High';
