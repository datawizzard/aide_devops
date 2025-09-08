WITH customer_validity AS
  (SELECT c.`customer_id`,
          c.`insert_date` AS start_date,
          COALESCE(c.`update_date`, current_timestamp()) AS end_date
   FROM `aigdqr-ragstoriches`.`calendar_ddp`.`v_customer` c)
SELECT cv1.`customer_id`,
       cv1.`start_date`,
       cv1.`end_date`,
       cv2.`start_date` AS overlapping_start_date,
       cv2.`end_date` AS overlapping_end_date,
       'Overlapping validity periods for the same customer_id' AS violation_reason
FROM customer_validity cv1
JOIN customer_validity cv2 ON cv1.`customer_id` = cv2.`customer_id`
AND cv1.`start_date` < cv2.`end_date`
AND cv1.`end_date` > cv2.`start_date`
AND cv1.`start_date` != cv2.`start_date`
