SELECT fs.`SalesOrderNumber`,
       fs.`SalesOrderLineNumber`,
       fs.`SalesAmount`,
       fcr.`AverageRate`,
       fs.`SalesAmount` * fcr.`AverageRate` AS `CalculatedReportingCurrencyAmount`,
       'Mismatch in reporting-currency amount calculation' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` fs
JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`factcurrencyrate` fcr ON fs.`CurrencyKey` = fcr.`CurrencyKey`
AND fs.`OrderDateKey` = fcr.`DateKey`
WHERE fs.`SalesAmount` * fcr.`AverageRate` IS NULL
