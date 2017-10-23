SELECT DISTINCT first_name
FROM patients
WHERE last_name
LIKE %MIT%

SELECT DISTINCT first_name
FROM patients, encounters
WHERE patients.id = encounters.patients.id


SELECT DISTINCT first_name
FROM patients, encounters
WHERE patients.id = encounters.patients.id
AND admitted_at
BETWEEN
#2014/07/05# AND #2014/08/19#
