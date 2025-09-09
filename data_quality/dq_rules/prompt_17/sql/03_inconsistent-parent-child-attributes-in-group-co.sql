SELECT child.`SalesTerritoryKey`,
       child.`SalesTerritoryRegion`,
       parent.`SalesTerritoryRegion` AS parent_region,
       'Inconsistent region between parent and child' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory` child
JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory` parent ON child.`SalesTerritoryKey` = parent.`SalesTerritoryKey`
WHERE child.`SalesTerritoryRegion` <> parent.`SalesTerritoryRegion`
