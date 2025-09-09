SELECT `calendar_id`,
       `start_date`,
       `end_date`,
       'end_date is earlier than start_date' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`calendar_ddp`.`v_calendar_full`
WHERE `end_date` < `start_date`
