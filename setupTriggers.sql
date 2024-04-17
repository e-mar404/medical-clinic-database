USE mdb;

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
        R.expiration_date > NEW.appointment_date AND
		  	R.patient_id=NEW.patient_id AND
        R.doctor_id=NEW.doctor_id AND
        D.employee_id=NEW.doctor_id AND
        D.specialist) THEN
		      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Patient needs referral to see specialist, please contact your primary care doctor';
	END IF;
END; //

DELIMITER //
CREATE TRIGGER Appointment_ChargePatientForNoShow
AFTER UPDATE ON Appointment
FOR EACH ROW
BEGIN
  IF NEW.appointment_status = 'no show' THEN
    IF NOT EXISTS (
      SELECT C.patient_id
      FROM Charges AS C
      WHERE
      NEW.appointment_status='no show' AND
      C.date_charged=NEW.appointment_date AND
      C.patient_id=NEW.patient_id
      ) THEN
      INSERT INTO Charges(patient_id, amount, date_charged) VALUES(NEW.patient_id, 15.00, NEW.appointment_date);
    END IF;
  END IF;
END; //

DELIMITER //

CREATE TRIGGER Appointment_ChargePatientForConfirm
AFTER UPDATE ON Appointment
FOR EACH ROW
BEGIN
  IF NEW.appointment_status = 'confirm' THEN
    IF NOT EXISTS (
        SELECT C.patient_id
        FROM Charges AS C
        WHERE
          C.date_charged = NEW.appointment_date AND
          C.patient_id = NEW.patient_id
      ) THEN
        INSERT INTO Charges(patient_id, amount, date_charged) VALUES(NEW.patient_id, 100.00, NEW.appointment_date);
    END IF;
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
CREATE TRIGGER Medication_NoDuplicatePrescriptions
BEFORE INSERT ON Medication
FOR EACH ROW
BEGIN
  IF EXISTS (
      SELECT patient_id, medication_name
      FROM Medication
      WHERE patient_id=NEW.patient_id AND medication_name=NEW.medication_name AND active
    ) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Patient already has already been prescribed that medication';
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
