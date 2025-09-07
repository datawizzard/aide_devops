SELECT f.`SalesOrderNumber`,
       f.`SalesOrderLineNumber`,
       f.`CustomerKey`,
       'Referenced CustomerKey does not exist in dimcustomer' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` f
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer` c
     WHERE f.`CustomerKey` = c.`CustomerKey`)
