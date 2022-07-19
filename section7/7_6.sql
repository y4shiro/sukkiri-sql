USE intro_sql;
SELECT * FROM 料金;
SELECT * FROM レンタル;

# 問題 7-2
# 1
SELECT 価格 * (SELECT SUM(レンタル日数)
                FROM レンタル
               WHERE 車種コード ='E01') AS 金額
  FROM 料金
 WHERE 車種コード = 'E01';

SELECT SUM(レンタル日数)
  FROM レンタル
 WHERE 車種コード ='E01';

# 2.
SELECT 車種コード, 車種名
  FROM 料金
 WHERE 車種コード IN (SELECT 車種コード FROM レンタル
                     WHERE レンタル日数 > 1)
 ORDER BY 車種コード;

 SELECT 車種コード FROM レンタル
  WHERE レンタル日数 > 1;

# 3.
SELECT SUM(SUB.日数) AS 合計日数,
       COUNT(SUB.車種コード) AS 車種数
  FROM (SELECT 車種コード, SUM(レンタル日数) AS 日数
          FROM レンタル
         GROUP BY 車種コード) AS SUB;

SELECT 車種コード, SUM(レンタル日数) AS 日数
  FROM レンタル
 GROUP BY 車種コード;

# 問題 7-3
SELECT * FROM 個体識別;

# 1. 飼育県別に飼育頭数をカウントし、頭数集計テーブルに登録する
INSERT INTO 頭数集計
SELECT 飼育県, COUNT(個体識別番号) AS 飼育頭数
FROM 個体識別
GROUP BY 飼育県;

# 2. 1 で作成した頭数集計テーブルで、飼育頭数の多い方から 3 つの都道府県で飼育されている牛のデータを、
# 個体識別テーブルより抽出する
SELECT 飼育県 AS 都道府県名, 個体識別番号,
  CASE 雌雄コード 
    WHEN '1' THEN '雄'
    WHEN '2' THEN '雌'
  END AS 雌雄
  FROM 個体識別
WHERE 飼育県 IN(SELECT 飼育県 FROM 頭数集計
                ORDER BY 頭数 DESC
                OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY);

# 3
SELECT 個体識別番号,
  CASE 品種コード
    WHEN '01' THEN '乳用種'
    WHEN '02' THEN '肉用種'
    WHEN '03' THEN '交雑種'
  END AS '品種',
  出生日,
  母牛番号
FROM 個体識別
WHERE 母牛番号 IN (SELECT 個体識別番号 FROM 個体識別
                    WHERE 品種コード = '01');