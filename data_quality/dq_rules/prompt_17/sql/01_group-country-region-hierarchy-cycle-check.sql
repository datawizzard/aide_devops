WITH RECURSIVE hierarchy_path AS
  (SELECT `SalesTerritoryKey`,
          `SalesTerritoryKey` AS root_key,
          CAST(`SalesTerritoryKey` AS STRING) AS PATH,
          1 AS depth
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory`
   UNION ALL SELECT child.`SalesTerritoryKey`,
                    parent.root_key,
                    CONCAT(parent.path, ' -> ', child.`SalesTerritoryKey`) AS PATH,
                    parent.depth + 1
   FROM hierarchy_path parent
   JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimsalesterritory` child ON parent.`SalesTerritoryKey` = child.`SalesTerritoryKey`
   WHERE parent.depth < 100)
SELECT root_key AS `SalesTerritoryKey`,
       PATH AS `cycle_path`,
               'Cycle detected in hierarchy' AS `violation_reason`
FROM hierarchy_path
WHERE `SalesTerritoryKey` = root_key
  AND depth > 1
