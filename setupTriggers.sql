USE mdb;

DROP TRIGGER IF EXISTS Appointment_CheckForReferral;
DROP TRIGGER IF EXISTS Employee_CheckRolesTrigger;
DROP TRIGGER IF EXISTS ContactInformation_ITrigger;
DROP TRIGGER IF EXISTS ContactInformation_UTrigger;
DROP TRIGGER IF EXISTS Company_ITrigger;
DROP TRIGGER IF EXISTS Company_UTrigger;
DROP TRIGGER IF EXISTS Clinic_ITrigger;
DROP TRIGGER IF EXISTS Clinic_UTrigger;
DROP TRIGGER IF EXISTS Clinic_ITrigger;
DROP TRIGGER IF EXISTS ManagedBy_ITrigger;
DROP TRIGGER IF EXISTS ManagedBy_UTrigger;
DROP TRIGGER IF EXISTS Employee_ITrigger;
DROP TRIGGER IF EXISTS Employee_UTrigger;
DROP TRIGGER IF EXISTS Patient_ITrigger;
DROP TRIGGER IF EXISTS Patient_UTrigger;
DROP TRIGGER IF EXISTS Patient_MedicalHistory_ITrigger;
DROP TRIGGER IF EXISTS Patient_MedicalHistory_UTrigger;
DROP TRIGGER IF EXISTS Patient_MedicalProcedure_ITrigger;
DROP TRIGGER IF EXISTS Patient_MedicalProcedure_UTrigger;
DROP TRIGGER IF EXISTS Patient_InsuranceInformation_ITrigger;
DROP TRIGGER IF EXISTS Patient_InsuranceInformation_UTrigger;
DROP TRIGGER IF EXISTS Patient_FinancialInformation_ITrigger;
DROP TRIGGER IF EXISTS Patient_FinancialInformation_UTrigger;
DROP TRIGGER IF EXISTS Patient_EmergencyContacts_ITrigger;
DROP TRIGGER IF EXISTS Patient_EmergencyContacts_UTrigger;
DROP TRIGGER IF EXISTS Appointment_ITrigger;
DROP TRIGGER IF EXISTS Appointment_UTrigger;
DROP TRIGGER IF EXISTS Medication_ITrigger;
DROP TRIGGER IF EXISTS Medication_UTrigger;

DELIMITER //
CREATE TRIGGER Appointment_CheckForReferral 
BEFORE INSERT ON Appointment 
FOR EACH ROW
BEGIN
	IF EXISTS (
    SELECT D.Specialist
    FROM Employee as D
    WHERE 
      D.employee_id=New.doctor_id AND 
      D.Specialist
    ) AND 
    NOT EXISTS (
      SELECT * 
		  FROM mdb.Referral AS R, Employee AS D
			WHERE 
        R.expiration_date > CURDATE() AND
		  	R.patient_id=NEW.patient_id AND
        R.doctor_id=NEW.doctor_id AND
        D.employee_id=NEW.doctor_id AND
        D.specialist) THEN
		      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Patient needs referral to see specialist, please contact your primary care doctor';
	END IF;
END; //

DELIMITER //
CREATE TRIGGER Employee_CheckRolesTrigger
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.employee_type = 'Medical' THEN
        IF NEW.employee_role NOT IN ('Doctor', 'Nurse') THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid employee role for Medical type. Employee role must be either Doctor or Nurse.';
        END IF;
    ELSEIF NEW.employee_type = 'Staff' THEN
        IF NEW.employee_role NOT IN ('Receptionist', 'Administrator') THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid employee role for Staff type. Employee role must be either Receptionist or Administrator.';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee type and role must be specified.';
    END IF;
END; //

DELIMITER //
CREATE TRIGGER ContactInformation_ITrigger
BEFORE INSERT ON ContactInformation
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER ContactInformation_UTrigger
BEFORE UPDATE ON ContactInformation
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Company_ITrigger
BEFORE INSERT ON Company
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Company_UTrigger
BEFORE UPDATE ON Company
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; // 

DELIMITER //
CREATE TRIGGER Clinic_ITrigger
BEFORE INSERT ON Clinic
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Clinic_UTrigger
BEFORE UPDATE ON Clinic
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; // 

DELIMITER //
CREATE TRIGGER ManagedBy_ITrigger
BEFORE INSERT ON ManagedBy 
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; // 

DELIMITER //
CREATE TRIGGER ManagedBy_UTrigger
BEFORE UPDATE ON ManagedBy
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Employee_ITrigger
BEFORE INSERT ON Employee
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Employee_UTrigger
BEFORE UPDATE ON Employee
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_ITrigger
BEFORE INSERT ON Patient 
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_UTrigger
BEFORE UPDATE ON Patient
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_MedicalHistory_ITrigger
BEFORE INSERT ON Patient_MedicalHistory 
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_MedicalHistory_UTrigger
BEFORE UPDATE ON Patient_MedicalHistory
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_MedicalProcedure_ITrigger
BEFORE INSERT ON Patient_MedicalProcedure 
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_MedicalProcedure_UTrigger
BEFORE UPDATE ON Patient_MedicalProcedure
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_InsuranceInformation_ITrigger
BEFORE INSERT ON Patient_InsuranceInformation 
FOR EACH ROW
  BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_InsuranceInformation_UTrigger
BEFORE UPDATE ON Patient_InsuranceInformation
FOR EACH ROW
  BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_FinancialInformation_ITrigger
BEFORE INSERT ON Patient_FinancialInformation 
FOR EACH ROW
BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_FinancialInformation_UTrigger
BEFORE UPDATE ON Patient_FinancialInformation
FOR EACH ROW
BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_EmergencyContacts_ITrigger
BEFORE INSERT ON Patient_EmergencyContacts 
FOR EACH ROW
BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Patient_EmergencyContacts_UTrigger
BEFORE UPDATE ON Patient_EmergencyContacts
FOR EACH ROW
BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Appointment_ITrigger
BEFORE INSERT ON Appointment 
FOR EACH ROW
BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Appointment_UTrigger
BEFORE UPDATE ON Appointment
FOR EACH ROW
BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //

DELIMITER //
CREATE TRIGGER Medication_ITrigger
BEFORE INSERT ON Medication 
FOR EACH ROW
BEGIN
    SET NEW.created = CURDATE();
    SET NEW.createdby = USER();
END; //

DELIMITER //
CREATE TRIGGER Medication_UTrigger
BEFORE UPDATE ON Medication
FOR EACH ROW
BEGIN
    SET NEW.updated = CURDATE();
    SET NEW.updatedby = USER();
END; //
