DELIMITER //
CREATE PROCEDURE check_for_no_show_appointments(IN open_time TIME, IN close_time TIME)
BEGIN
  SET SQL_SAFE_UPDATES = 0;
  IF (CURRENT_TIME() BETWEEN open_time AND close_time) THEN
  
  UPDATE Appointment
  SET appointment_status='no show'
  WHERE 
    appointment_status='scheduled' AND (
    appointment_date <= CURDATE() AND 
    CURTIME() > SUBTIME(appointment_time, '-00:15') OR
    appointment_date < CURDATE());
  
  END IF;
  SET SQL_SAFE_UPDATES = 1;
END; //
