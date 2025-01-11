create database Dep;
use Dep;
select * from Mhealth;
# Distribution of Students' Gender  :
SELECT gender, COUNT(*) AS gender_count FROM Mhealth GROUP BY gender;

# Age Distribution of Students:
SELECT age, COUNT(*) AS age_count FROM Mhealth GROUP BY age ORDER BY age;

# Courses Most Students Are Enrolled In :
SELECT course, COUNT(*) AS student_count FROM Mhealth GROUP BY course ORDER BY student_count DESC;


#Percentage of Students Reporting Depression :
SELECT (COUNT(CASE WHEN depression = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS depression FROM Mhealth;


# Percentage of Students Reporting Panic Attacks*:
SELECT (COUNT(CASE WHEN panic_attack = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS panic_attack FROM Mhealth;

# Correlation Between Age and Mental Health Issues*:
SELECT age,(COUNT(CASE WHEN depression = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS depression,(COUNT(CASE WHEN anxiety = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS anxiety,(COUNT(CASE WHEN panic_attack = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS panic_attack FROM Mhealth GROUP BY age ORDER BY age;

# ccorrelation Between CGPA and Mental Health Issues*:
SELECT CGPA,(COUNT(CASE WHEN depression = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS depression,(COUNT(CASE WHEN anxiety = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS anxiety,(COUNT(CASE WHEN panic_attack = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS panic_attacks FROM Mhealth GROUP BY CGPA ORDER BY CGPA;

# Mental Health Issues by Year of Study*:
SELECT Year,(COUNT(CASE WHEN depression = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS depression,(COUNT(CASE WHEN anxiety = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS anxiety,(COUNT(CASE WHEN panic_attack = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS panic_attack FROM Mhealth GROUP BY year ORDER BY year;

#Percentage of Students with Mental Health Issues Seeking Specialist Treatment*:
SELECT (COUNT(CASE WHEN (depression = 'Yes' OR anxiety = 'Yes' OR panic_attack = 'Yes') AND treatment = 'Yes' THEN 1 END) * 100.0 / COUNT(CASE WHEN depression = 'Yes' OR anxiety = 'Yes' OR panic_attack = 'Yes' THEN 1 END)) AS treatment FROM Mhealth; 

# Variation in Seeking Specialist Treatment by Gender and Course*:
SELECT gender,course,(COUNT(CASE WHEN treatment = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS treatment FROM Mhealth GROUP BY gender, course ORDER BY gender, course;

# Common Characteristics of Students with Multiple Mental Health Issues*:
SELECT age, gender, course, CGPA, COUNT(*) AS Mhealth FROM Mhealth WHERE (depression = 'Yes' AND anxiety = 'Yes') OR (depression = 'Yes' AND panic_attack = 'Yes') OR (anxiety = 'Yes' AND panic_attack = 'Yes') GROUP BY age, gender, course, CGPA ORDER BY Mhealth DESC;

# Patterns in Mental Health Issues Among Students*:
 SELECT age, gender, course, CGPA, (COUNT(CASE WHEN depression = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS depression, (COUNT(CASE WHEN anxiety = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS anxiety, (COUNT(CASE WHEN panic_attack = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS panic_attack FROM Mhealth GROUP BY age, gender, course, CGPA ORDER BY age, gender, course, CGPA;