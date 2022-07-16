USE intro_sql;

SELECT * FROM 家計簿;

# 問題 1-3
SELECT * FROM 家計簿
WHERE 入金額 = 50000;

DELETE FROM 家計簿
WHERE 出金額 > 4000;

UPDATE 家計簿
SET メモ = 'カフェラテを購入'
WHERE 日付 = '2022-02-03';