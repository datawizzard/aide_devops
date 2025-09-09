SELECT child.`SalesTerritoryKey`,
       child.`SalesTerritoryAlternateKey`,
       'Orphaned entry: parent does not exist' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory` child
LEFT JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory` parent ON child.`SalesTerritoryKey` = parent.`SalesTerritoryKey`
WHERE parent.`SalesTerritoryKey` IS NULL
