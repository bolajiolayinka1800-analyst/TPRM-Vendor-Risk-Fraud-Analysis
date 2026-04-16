-- 1. SUSPICIOUS CONTRACT VALUES
-- Finding vendors with unusually high contract values for their category.
SELECT Vendor_name, Category, Contract_value 
FROM tprm_vendors 
WHERE Contract_value > 900000;

-- 2. "GHOST VENDOR" COUNTRY CHECK
-- Identifying vendors from "High Risk" locations or missing countries.
SELECT Vendor_name, Country, Risk_status 
FROM tprm_vendors 
WHERE Country IS NULL OR Country = '';


-- 3. ONBOARDING ANOMALIES
-- Checking for multiple vendors onboarded on the exact same date.
SELECT Onboarding_date, COUNT(*) as vendors_created
FROM tprm_vendors 
GROUP BY Onboarding_date 
HAVING vendors_created > 5;


-- 4. RISK VS. INCIDENT MISMATCH
-- Finding vendors marked as "Low Risk" but having a high number of incidents.
SELECT Vendor_name, Risk_status, Incident_count 
FROM tprm_vendors 
WHERE Risk_status = 'Low' AND Incident_count > 5;


-- 5. Fraudsters often submit fake invoices in round numbers
SELECT Vendor_name, Contract_value
FROM tprm_vendors
WHERE Contract_value % 100 = 0 
AND Contract_value > 1000;