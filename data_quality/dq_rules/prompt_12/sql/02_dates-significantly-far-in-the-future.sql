SELECT `calendar_id`,
       `end_date`,
       'end_date is more than 100 years in the future' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`calendar_ddp`.`v_calendar_full`
WHERE `end_date` > date_add(current_date(), 36525)
