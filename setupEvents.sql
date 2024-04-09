DELIMITER //
CREATE EVENT CancelNoShowAppointments 
ON SCHEDULE EVERY 1 HOUR 
DO
BEGIN
  IF HOUR(CURRENT_TIME) > 9 OR HOUR(CURRENT_TIME()) < 17 THEN
    CALL check_for_no_show_appointments();
  END IF;
END; //
