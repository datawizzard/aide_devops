SELECT f.`SalesOrderNumber`,
       f.`SalesOrderLineNumber`,
       f.`ProductKey`,
       'Referenced ProductKey does not exist in dimproduct' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` f
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct` p
     WHERE f.`ProductKey` = p.`ProductKey`)
