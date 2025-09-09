SELECT `calendar_id`,
       `start_date`,
       `end_date`,
       'end_date precedes start_date' AS violation_reason
FROM `aigdqr-ragstoriches`.`calendar_ddp`.`v_calendar`
WHERE `end_date` < `start_date`
