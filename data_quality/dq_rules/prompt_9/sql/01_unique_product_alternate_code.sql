SELECT `ProductKey`,
       `ProductAlternateKey`,
       'Duplicate ProductAlternateKey detected' AS `violation_reason`
FROM
  (SELECT `ProductKey`,
          `ProductAlternateKey`,
          ROW_NUMBER() OVER (PARTITION BY `ProductAlternateKey`
                             ORDER BY `ProductKey`) AS `row_num`
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`) subquery
WHERE subquery.`row_num` > 1
