SELECT g.`GeographyKey`,
       g.`SalesTerritoryKey`,
       'Geography references a non-existent or invalid sales territory' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimgeography` g
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory` t
     WHERE g.`SalesTerritoryKey` = t.`SalesTerritoryKey`)
