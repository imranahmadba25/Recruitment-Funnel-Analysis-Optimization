-- 1. Show all candidate details
SELECT * FROM recruitment_analysis.recruitment;
-- 2. Find total number of candidates
SELECT COUNT(*) AS total_candidates 
FROM recruitment_analysis.recruitment;
-- 3. Show unique job roles applied
SELECT role_applied
FROM recruitment_analysis.recruitment
GROUP BY role_applied;
-- 4. Number of candidates by role
SELECT role_applied, COUNT(*) AS total_applications
FROM recruitment_analysis.recruitment
GROUP BY role_applied;
-- 5. Number of candidates by location
SELECT location, COUNT(*) AS total_applications
FROM recruitment_analysis.recruitment
GROUP BY location;
-- 6. How many candidates joined
SELECT COUNT(*) AS total_hires
FROM recruitment_analysis.recruitment
WHERE status = 'Joined';
-- 7. How many candidates rejected
SELECT COUNT(*) AS total_rejected
FROM recruitment_analysis.recruitment
WHERE status = 'Rejected';
-- 8. Hire rate by location
SELECT location,
       COUNT(*) AS total_candidates,
       SUM(CASE WHEN status = 'Joined' THEN 1 ELSE 0 END) AS hires,
       ROUND(100.0 * SUM(CASE WHEN status = 'Joined' THEN 1 ELSE 0 END)/COUNT(*),2) AS hire_rate_pct
FROM recruitment_analysis.recruitment
GROUP BY location;
