WITH product_validity AS
  (SELECT p.`ProductKey`,
          p.`StartDate` AS start_date,
          COALESCE(p.`EndDate`, current_timestamp()) AS end_date
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct` p)
SELECT pv1.`ProductKey`,
       pv1.`start_date`,
       pv1.`end_date`,
       pv2.`start_date` AS overlapping_start_date,
       pv2.`end_date` AS overlapping_end_date,
       'Overlapping validity periods for the same ProductKey' AS violation_reason
FROM product_validity pv1
JOIN product_validity pv2 ON pv1.`ProductKey` = pv2.`ProductKey`
AND pv1.`start_date` < pv2.`end_date`
AND pv1.`end_date` > pv2.`start_date`
AND pv1.`start_date` != pv2.`start_date`
