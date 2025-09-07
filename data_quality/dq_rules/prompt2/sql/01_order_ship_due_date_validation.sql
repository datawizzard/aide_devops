SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       `OrderDateKey`,
       `ShipDateKey`,
       `DueDateKey`,
       'OrderDateKey must be <= ShipDateKey and ShipDateKey must be <= DueDateKey' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales`
WHERE NOT (`OrderDateKey` <= `ShipDateKey`
           AND `ShipDateKey` <= `DueDateKey`)
UNION ALL
SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       `OrderDateKey`,
       `ShipDateKey`,
       `DueDateKey`,
       'OrderDateKey must be <= ShipDateKey and ShipDateKey must be <= DueDateKey' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`
WHERE NOT (`OrderDateKey` <= `ShipDateKey`
           AND `ShipDateKey` <= `DueDateKey`)
