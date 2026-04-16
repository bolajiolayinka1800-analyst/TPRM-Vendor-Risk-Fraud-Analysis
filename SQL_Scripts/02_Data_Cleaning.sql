-- Implemented a SQL data cleansing pipeline to ensure accurate referential integrity and standardized risk scoring ranges, preventing skewed reporting in the final Executive Dashboard;

-- 1. Audits with no matching Vendor
SELECT a.vendor_id
FROM vendor_audit a
LEFT JOIN tprm_vendors v ON a.vendor_id = v.vendor_id
WHERE v.vendor_id IS NULL;


-- 2. Check for scores outside the 0 to 100 range
SELECT * FROM vendor_audit
WHERE cyber_score > 100 OR cyber_score < 0
   OR Financial_score > 100 OR Financial_score < 0;
   
   
-- 3.Checking of Rows with missing data in vendor audits table
SELECT * FROM vendor_audit
WHERE Overall_risk_complaince IS NULL 
   OR audit_date IS NULL;

-- 5.  Standardizing of column
SELECT DISTINCT category
FROM tprm_vendors;
-- The fix UPDATE tprm_vendor standardization
UPDATE tprm_vendors
SET category = 'Information Technology'
WHERE category IN ('IT', 'it', 'info tech');


-- 6. checking duplication in vendor audit
SELECT vendor_id, audit_date, COUNT(*)
FROM vendor_audit
GROUP BY vendor_id, audit_date
HAVING COUNT(*) > 1;


-- 7. Standardizing by trimming texts
UPDATE tprm_vendors SET vendor_name = TRIM(vendor_name);
UPDATE tprm_vendors SET category = TRIM(category);


-- 8. Date logic auditing
SELECT * FROM vendor_audit 
WHERE audit_date > CURRENT_DATE;