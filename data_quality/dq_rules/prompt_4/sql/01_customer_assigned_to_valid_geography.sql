SELECT c.`CustomerKey`,
       c.`GeographyKey`,
       'Customer is assigned to an invalid geography or geography does not exist' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` c
LEFT JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimgeography` g ON c.`GeographyKey` = g.`GeographyKey`
WHERE g.`GeographyKey` IS NULL
