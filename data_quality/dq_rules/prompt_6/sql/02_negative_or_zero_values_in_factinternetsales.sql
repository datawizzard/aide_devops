SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       `OrderQuantity`,
       `UnitPrice`,
       `ExtendedAmount`,
       `SalesAmount`,
       `TaxAmt`,
       `Freight`,
       'Negative or zero value detected in quantities, unit prices, totals, taxes, or freight' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`
WHERE `OrderQuantity` <= 0
  OR `UnitPrice` <= 0
  OR `ExtendedAmount` <= 0
  OR `SalesAmount` <= 0
  OR `TaxAmt` < 0
  OR `Freight` < 0
