WITH date_range AS
  (SELECT DISTINCT `DateKey`
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factcurrencyrate`),
     missing_dates AS
  (SELECT dc.`CurrencyKey`,
          dr.`DateKey`
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcurrency` dc
   CROSS JOIN date_range dr
   WHERE NOT EXISTS
       (SELECT 1
        FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factcurrencyrate` fcr
        WHERE fcr.`CurrencyKey` = dc.`CurrencyKey`
          AND fcr.`DateKey` = dr.`DateKey`))
SELECT md.`CurrencyKey`,
       md.`DateKey`,
       'Missing exchange rate record for this currency on this day' AS `violation_reason`
FROM missing_dates md
