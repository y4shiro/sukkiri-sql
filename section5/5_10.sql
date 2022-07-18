USE intro_sql;

# 問題 5-1
# 1
UPDATE 試験結果
   SET 午後1 = (80 * 4) - (86 + 68 + 91)
 WHERE 受験者id = 'SW1046';
UPDATE 試験結果
   SET 論述 = (68 * 4) - (65 + 53 + 70)
 WHERE 受験者id = 'SW1350';
UPDATE 試験結果
   SET 午前 = (56 * 4) - (59 + 56 + 36)
 WHERE 受験者id = 'SW1877';
# 2
SELECT 受験者id AS '合格者 ID' FROM 試験結果
 WHERE 午前 >= 60 
   AND 午後1 + 午後2 >= 120
   AND 論述 >= (午前 + 午後1 + 午後2 + 論述) * 0.3;

# 問題 5-2
# 1
UPDATE 回答者
SET 国名 = CASE SUBSTRING(TRIM(メールアドレス),
               LENGTH(TRIM(メールアドレス))-1, 2)
    WHEN 'jp' THEN '日本'
    WHEN 'uk' THEN 'イギリス'
    WHEN 'cn' THEN '中国'
    WHEN 'fr' THEN 'フランス'
    WHEN 'vn' THEN 'ベトナム'
END;
# 2
SELECT TRIM(メールアドレス) AS メールアドレス,
  CASE WHEN 年齢 >= 20 AND 年齢 < 30 THEN '20代'
       WHEN 年齢 >= 30 AND 年齢 < 40 THEN '30代'
       WHEN 年齢 >= 40 AND 年齢 < 50 THEN '40代'
       WHEN 年齢 >= 50 AND 年齢 < 60 THEN '50代' 
   END
       || ':' ||
  CASE 住居
       WHEN 'D' THEN '戸建て'
       WHEN 'C' THEN '集合住宅'
   END AS 属性
  FROM 回答者;

# 問題 5-3
# 1
UPDATE 受注
   SET 文字数 = LENGTH(REPLACE(文字, ' ', ''));
# 2
SELECT 受注日, 受注ID, 文字数,
       CASE COALESCE(書体コード, '1')
         WHEN '1' THEN 'ブロック体'
         WHEN '2' THEN '筆記体'
         WHEN '3' THEN '草書体'
       END AS 書体名,
       CASE COALESCE(書体コード, '1')
         WHEN '1' THEN 100
         WHEN '2' THEN 150
         WHEN '3' THEN 200
       END AS 単価,
       CASE WHEN 文字数 > 10 THEN 500
         ELSE 0 END AS 特別加工費
FROM 受注
ORDER BY 受注日, 受注ID;

# 3
UPDATE 受注
   SET 文字 = REPLACE(文字, ' ', '☆')
 WHERE 受注id = '113';
