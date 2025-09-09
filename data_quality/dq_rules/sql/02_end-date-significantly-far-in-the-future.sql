SELECT `calendar_id`,
       `end_date`,
       'end_date is significantly far in the future' AS violation_reason
FROM `aigdqr-ragstoriches`.`calendar_ddp`.`v_calendar`
WHERE `end_date` > date_add(current_date(), 36500)
