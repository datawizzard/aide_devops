SELECT `SalesOrderNumber`,
       `SalesOrderLineNumber`,
       'Duplicate line number within the same order' AS violation_reason
FROM
  (SELECT `SalesOrderNumber`,
          `SalesOrderLineNumber`,
          ROW_NUMBER() OVER (PARTITION BY `SalesOrderNumber`
                             ORDER BY `SalesOrderLineNumber`) AS row_num
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales`) t
WHERE t.row_num > 1
