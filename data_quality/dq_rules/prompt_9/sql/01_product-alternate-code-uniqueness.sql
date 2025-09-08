SELECT p.`ProductKey`,
       p.`ProductAlternateKey`,
       'Duplicate ProductAlternateKey detected' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct` p
WHERE EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct` p2
     WHERE p.`ProductAlternateKey` = p2.`ProductAlternateKey`
       AND p.`ProductKey` <> p2.`ProductKey`)
  AND p.`ProductAlternateKey` IS NOT NULL
