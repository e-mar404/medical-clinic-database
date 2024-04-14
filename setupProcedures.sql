DELIMITER //
CREATE PROCEDURE check_for_no_show_appointments(IN open_time TIME, IN close_time TIME)
BEGIN
  IF CURRENT_TIME() BETWEEN open_time AND close_time THEN
  SET SQL_SAFE_UPDATES = 0;
  
  UPDATE Appointment
  SET appointment_status='no show'
  WHERE 
    appointment_status='scheduled' AND
    appointment_date <= CURDATE() AND 
    CURTIME() > SUBTIME(appointment_time, '-00:01');
  
  SET SQL_SAFE_UPDATES = 1;
  END IF;
END; //
