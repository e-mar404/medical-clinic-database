DELIMITER //
DROP TRIGGER IF EXISTS Employee_InsertTrigger;
CREATE TRIGGER Employee_InsertTrigger
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
END;
//
DELIMITER ;
