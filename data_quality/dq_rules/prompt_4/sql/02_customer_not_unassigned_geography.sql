SELECT c.`CustomerKey`,
       c.`GeographyKey`,
       'Customer is not assigned to any geography (GeographyKey is NULL)' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` c
WHERE c.`GeographyKey` IS NULL
