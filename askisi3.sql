SELECT SELL.DName, MIN(SELL.Price)
FROM SELL
INNER JOIN DRUG
ON SELL.DName = DRUG.DName
INNER JOIN MANUFACTURER
ON DRUG.MRegistration = MANUFACTURER.MRegistration
WHERE MANUFACTURER.Name LIKE 'Johnson & Johnson'
GROUP BY SELL.DName

SELECT DISTINCT(MANUFACTURER.Name), PHARMACY.Address, CONTRACT.Manufacturer, CONTRACT.Pharmacy, CONTRACT.EndDate
FROM MANUFACTURER
INNER JOIN CONTRACT
ON Manufacturer.MRegistration = CONTRACT.Manufacturer
INNER JOIN PHARMACY
ON PHARMACY.PName = CONTRACT.Pharmacy
WHERE CONTRACT.EndDate = (
SELECT MIN(CONTRACT.EndDate)
FROM CONTRACT
WHERE MANUFACTURER.MRegistration = CONTRACT.Manufacturer
)

SELECT PATIENT.FirstName +' '+PATIENT.LastName AS [Full Name]
FROM PATIENT
INNER JOIN PRESCRIPTION
ON PATIENT.SSN = PRESCRIPTION.Patient
WHERE PRESCRIPTION.DoctorLicNo =
(
SELECT TOP 1 COUNT(PATIENT.numberrange)
FROM PATIENT
GROUP BY PATIENT.numberrange
ORDER BY COUNT(PATIENT.numberrange) DESC
)

SELECT drug.Dname
FROM DRUG drug
JOIN MANUFACTURER manu 
ON drug.MRegistration=manu.MRegistration
WHERE drug.DrugRegistrationDate>
(
SELECT MIN(drug2.DrugRegistrationDate)
FROM DRUG drug2
JOIN MANUFACTURER manu2 ON drug2.MRegistration=manu2.MRegistration
WHERE drug2.Formula=drug.Formula AND manu2.Name='Bayer' AND drug2.DrugRegistrationDate=
(
SELECT MIN(drug3.DrugRegistrationDate)
FROM DRUG drug3
WHERE drug3.Formula = drug2.Formula)
)
