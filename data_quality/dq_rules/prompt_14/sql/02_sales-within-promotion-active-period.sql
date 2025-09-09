SELECT fs.`SalesOrderNumber`,
       fs.`SalesOrderLineNumber`,
       fs.`OrderDate`,
       dp.`PromotionKey`,
       dp.`StartDate`,
       dp.`EndDate`,
       'OrderDate is outside the promotion active period' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` fs
JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimpromotion` dp ON fs.`PromotionKey` = dp.`PromotionKey`
WHERE fs.`OrderDate` < dp.`StartDate`
  OR fs.`OrderDate` > dp.`EndDate`
