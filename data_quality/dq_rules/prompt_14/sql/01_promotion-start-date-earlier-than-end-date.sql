SELECT `PromotionKey`,
       `EnglishPromotionName`,
       `StartDate`,
       `EndDate`,
       'StartDate is not earlier than EndDate' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimpromotion`
WHERE `StartDate` >= `EndDate`
