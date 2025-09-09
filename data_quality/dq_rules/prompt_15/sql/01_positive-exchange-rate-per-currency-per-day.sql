SELECT fcr.`CurrencyKey`,
       fcr.`DateKey`,
       fcr.`Date`,
       'No positive exchange rate recorded for this currency on this day' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factcurrencyrate` fcr
JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimcurrency` dc ON fcr.`CurrencyKey` = dc.`CurrencyKey`
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factcurrencyrate` fcr_inner
     WHERE fcr_inner.`CurrencyKey` = fcr.`CurrencyKey`
       AND fcr_inner.`DateKey` = fcr.`DateKey`
       AND fcr_inner.`AverageRate` > 0)
