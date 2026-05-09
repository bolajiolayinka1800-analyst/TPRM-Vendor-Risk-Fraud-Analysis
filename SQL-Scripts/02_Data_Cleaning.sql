-- DATA CLEANING AND QUALITY ASSURANCE

-- 1. ORPHAN AUDIT RECORDS
-- Identifies audit records that have no matching vendor in the master vendor table

SELECT a.vendor_id
FROM vendor_audit a
LEFT JOIN tprm_vendors v ON a.vendor_id = v.vendor_id
WHERE v.vendor_id IS NULL;


-- 2. INVALID RISK SCORE DETECTION
-- Checking for cyber and financial scores outside the valid 0–100 range, which would distort the 
-- Weighted Risk Index calculation.

SELECT * FROM vendor_audit
WHERE cyber_score > 100 OR cyber_score < 0
   OR Financial_score > 100 OR Financial_score < 0;


-- 3. NULL VALUE DETECTION IN CRITICAL FIELDS
-- Identifies records with missing compliance classification or audit dates

SELECT * FROM vendor_audit
WHERE Overall_risk_compliance IS NULL
   OR audit_date IS NULL;


-- 4. CATEGORY STANDARDISATION
-- Checks for inconsistent vendor category labels that would break industry-level risk segmentation queries.

SELECT DISTINCT category
FROM tprm_vendors;

-- UPDATED
UPDATE tprm_vendors
SET category = 'Information Technology'
WHERE category IN ('IT', 'it', 'info tech');


-- 5. DUPLICATE AUDIT RECORD DETECTION
-- Uses GROUP BY and HAVING COUNT(*) > 1 to identify vendors with more than one audit record on the same date.

SELECT vendor_id, audit_date, COUNT(*)
FROM vendor_audit
GROUP BY vendor_id, audit_date
HAVING COUNT(*) > 1;


-- 6. TEXT FIELD STANDARDISATION (TRIMMING)
-- Removes leading and trailing whitespace 

UPDATE tprm_vendors SET vendor_name = TRIM(vendor_name);
UPDATE tprm_vendors SET category    = TRIM(category);


-- 7. FUTURE AUDIT DATE DETECTION
-- Flags any audit records where the audit date is set in the future, which violates logical data constraints.

SELECT * FROM vendor_audit
WHERE audit_date > CURRENT_DATE;