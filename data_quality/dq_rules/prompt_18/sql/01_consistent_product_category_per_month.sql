WITH product_category_mapping AS
  (SELECT p.ProductKey,
          ps.ProductCategoryKey,
          t.year,
          t.month
   FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimproduct` p
   JOIN `aigdqr-ragstoriches`.`adv_works_dw`.`dimproductsubcategory` ps ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
   JOIN `aigdqr-ragstoriches`.`calendar_ddp`.`v_timeline` t ON t.date = p.StartDate),
     category_inconsistencies AS
  (SELECT pcm.ProductKey,
          pcm.year,
          pcm.month,
          COUNT(DISTINCT pcm.ProductCategoryKey) AS distinct_categories
   FROM product_category_mapping pcm
   GROUP BY pcm.ProductKey,
            pcm.year,
            pcm.month
   HAVING COUNT(DISTINCT pcm.ProductCategoryKey) > 1)
SELECT ci.ProductKey,
       ci.year,
       ci.month,
       'Product has inconsistent categories within the same calendar month' AS violation_reason
FROM category_inconsistencies ci
