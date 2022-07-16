USE intro_sql;

SELECT * FROM 家計簿;

SELECT 費目, 出金額 FROM 家計簿 WHERE 出金額 > 3000;

SELECT 費目, 出金額
  FROM 家計簿 
 WHERE 出金額 > 3000;