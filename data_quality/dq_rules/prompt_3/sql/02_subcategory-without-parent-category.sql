SELECT s.`ProductSubcategoryKey`,
       s.`EnglishProductSubcategoryName`,
       'Subcategory lacks an associated parent category' AS `violation_reason`
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproductsubcategory` s
WHERE NOT EXISTS
    (SELECT 1
     FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproductcategory` c
     WHERE s.`ProductCategoryKey` = c.`ProductCategoryKey`)
