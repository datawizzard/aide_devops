SELECT `ProductKey`,
       `ProductAlternateKey`,
       'ProductAlternateKey is NULL' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct`
WHERE `ProductAlternateKey` IS NULL
