SELECT `CustomerKey`,
       `EmailAddress`,
       'Email domain is disposable or fake' AS violation_reason
FROM `aigdqr-ragstoriches`.`adv_works_dw`.`dimcustomer`
WHERE lower(trim(split(`EmailAddress`, '@')[1])) IN ('mailinator.com',
                                                     'tempmail.com',
                                                     '10minutemail.com',
                                                     'guerrillamail.com',
                                                     'fakeinbox.com')
