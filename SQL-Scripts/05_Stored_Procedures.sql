-- These stored procedures simulate real-world Third-Party Risk Management (TPRM) workflows, including vendor risk scoring, compliance monitoring, and decision support.
-- 1.INDUSTRY BASED VENDOR RISK ASSESSMENT REPORT
DELIMITER //

CREATE PROCEDURE Get_Industry_Risk_Report(IN input_industry VARCHAR(100))
BEGIN
    SELECT 
        v.Vendor_name,
        v.Category,
        a.cyber_score,
        a.financial_score,
        a.compliance_score,
        CASE 
            WHEN a.cyber_score < 50 THEN 'URGENT: SECURITY REVIEW'
            WHEN a.financial_score < 40 THEN 'CRITICAL: FINANCIAL DISTRESS'
            ELSE 'MAINTAIN MONITORING'
        END AS Consultant_Recommendation
    FROM tprm_vendors v
    JOIN vendor_audit a ON v.Vendor_id = a.vendor_id
    WHERE v.Category LIKE CONCAT('%', TRIM(input_industry), '%')
    ORDER BY a.cyber_score ASC;
END //

DELIMITER ;

-- 2. TOP PERFORMING VENDORS
DELIMITER //

CREATE PROCEDURE Get_Top_Vendors(IN min_score INT)
BEGIN
    SELECT 
        v.Vendor_name,
        v.Category,
        a.cyber_score,
        a.financial_score,
        a.compliance_score
    FROM tprm_vendors v
    JOIN vendor_audit a ON v.Vendor_id = a.vendor_id
    WHERE 
        a.cyber_score >= min_score
        AND a.financial_score >= min_score
        AND a.compliance_score >= min_score
    ORDER BY a.cyber_score DESC, a.financial_score DESC;
END //

DELIMITER ;



-- 3. VENDOR COMPLIANCE ALERT SYSTEM

DELIMITER //

CREATE PROCEDURE Get_Compliance_Alerts()
BEGIN
    SELECT 
        v.Vendor_name,
        v.Category,
        a.compliance_score,
        CASE 
            WHEN a.compliance_score < 40 THEN 'CRITICAL NON-COMPLIANCE'
            WHEN a.compliance_score BETWEEN 40 AND 60 THEN 'MODERATE RISK'
            ELSE 'COMPLIANT'
        END AS Compliance_Status
    FROM tprm_vendors v
    JOIN vendor_audit a ON v.Vendor_id = a.vendor_id
    WHERE a.compliance_score < 60
    ORDER BY a.compliance_score ASC;
END //

DELIMITER ;