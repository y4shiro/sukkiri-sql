USE intro_sql;

SELECT * FROM 家計簿;
SELECT * FROM 家計簿アーカイブ;
SELECT * FROM 家計簿集計;

# 1-1, 1-2, 1-3
SELECT 出金額 FROM 家計簿;
SELECT 日付, 費目, メモ, 入金額, 出金額 FROM 家計簿;
SELECT * FROM 家計簿;

# 1-4
SELECT 日付, 費目, 出金額 FROM 家計簿
WHERE 出金額 > 3000;

# 1-5
INSERT INTO 家計簿
VALUES ('2022-02-25', '住居費', '3月の家賃', 0, 85000);

# 1-6
UPDATE 家計簿
SET 出金額 = 90000
WHERE 日付 = '2022-02-25';

# 1-7
DELETE FROM 家計簿
WHERE 日付 = '2022-02-25';
