SELECT fs.`SalesOrderNumber`,
       fs.`SalesOrderLineNumber`,
       fs.`CustomerKey`,
       fs.`OrderDate`,
       'No effective customer version found for the order date' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` fs
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`calendar_ddp`.`v_customer` vc
     WHERE vc.`customer_id` = fs.`CustomerKey`
       AND vc.`insert_date` <= fs.`OrderDate`
       AND (vc.`update_date` IS NULL
            OR vc.`update_date` > fs.`OrderDate`))
