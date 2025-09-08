SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       `OrderQuantity`,
       `UnitPrice`,
       `UnitPriceDiscountPct`,
       `TaxAmt`,
       `Freight`,
       `SalesAmount`,
       'Recalculated total does not match existing SalesAmount' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`
WHERE ROUND((`OrderQuantity` * `UnitPrice` * (1 - `UnitPriceDiscountPct`)) + `TaxAmt` + `Freight`, 2) != ROUND(`SalesAmount`, 2)
