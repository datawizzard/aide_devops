SELECT p.`ProductKey`,
       p.`EnglishProductName`,
       'Product lacks an associated subcategory' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct` p
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproductsubcategory` s
     WHERE p.`ProductSubcategoryKey` = s.`ProductSubcategoryKey`)
