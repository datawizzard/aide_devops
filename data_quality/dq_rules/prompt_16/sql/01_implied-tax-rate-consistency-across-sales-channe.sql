WITH reseller_tax_rate AS
  (SELECT frs.`SalesTerritoryKey`,
          frs.`OrderDateKey`,
          AVG(frs.`TaxAmt` / NULLIF(frs.`SalesAmount`, 0)) AS avg_tax_rate
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factresellersales` frs
   GROUP BY frs.`SalesTerritoryKey`,
            frs.`OrderDateKey`),
     internet_tax_rate AS
  (SELECT fis.`SalesTerritoryKey`,
          fis.`OrderDateKey`,
          AVG(fis.`TaxAmt` / NULLIF(fis.`SalesAmount`, 0)) AS avg_tax_rate
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`factinternetsales` fis
   GROUP BY fis.`SalesTerritoryKey`,
            fis.`OrderDateKey`)
SELECT rtr.`SalesTerritoryKey`,
       rtr.`OrderDateKey`,
       rtr.`avg_tax_rate` AS reseller_tax_rate,
       itr.`avg_tax_rate` AS internet_tax_rate,
       'Implied tax rate difference exceeds tolerance of 0.01' AS violation_reason
FROM reseller_tax_rate rtr
JOIN internet_tax_rate itr ON rtr.`SalesTerritoryKey` = itr.`SalesTerritoryKey`
AND rtr.`OrderDateKey` = itr.`OrderDateKey`
WHERE ABS(rtr.`avg_tax_rate` - itr.`avg_tax_rate`) > 0.01
