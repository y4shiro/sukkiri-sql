# 問題 6-1
SELECT * FROM 都市別気象観測;
# 1. 日本全体としての年間降水量の合計と、年間の最高気温・最低気温の平均
SELECT
  SUM(降水量) AS 日本全体の年間降水量合計,
  AVG(最高気温) AS 年間の最高気温平均,
  AVG(最低気温) AS 年間の最低気温平均
FROM 都市別気象観測;

# 2. 東京の年間降水量と、隔月の最高気温、最低気温の平均
SELECT
  SUM(降水量),
  AVG(最高気温),
  AVG(最低気温)
FROM 都市別気象観測
WHERE 都市名 = '東京';

# 3. 各都市の降水量の平均と、最も低かった最高気温、最も高かった最低気温
SELECT
  都市名,
  AVG(降水量),
  MIN(最高気温),
  MAX(最低気温)
FROM 都市別気象観測
GROUP BY 都市名;

# 4. 月別の降水量、最高気温、最低気温の平均
SELECT
  月,
  AVG(降水量),
  AVG(最高気温),
  AVG(最低気温)
FROM 都市別気象観測
GROUP BY 月;

# 5. 1年間で最も高い最高気温が 38 度以上を記録した月のある都市名とその気温
SELECT 都市名, MAX(最高気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MAX(最高気温) >= 38;

# 6. 1年間で最も低い最低気温が -10 度以下を記録した月のある都市名とその気温
SELECT 都市名, MIN(最低気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MIN(最低気温) <= -10;

# 問題 6-2
SELECT * FROM 入退室管理;
# 1. 現在入室中の社員数を取得する
SELECT COUNT(*) AS 入室中の社員数
FROM 入退室管理
WHERE 退室 IS NULL;

# 2. 社員ごとの入室回数を、回数の多い順に取得する
SELECT 社員名, COUNT(社員名) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
ORDER BY 入室回数 DESC;

# 3. 事由区分ごとの入室回数を取得する
SELECT
CASE 事由区分
  WHEN '1' THEN 'メンテナンス'
  WHEN '2' THEN 'リリース作業'
  WHEN '3' THEN '障害対応'
  WHEN '9' THEN 'その他'
END AS 事由,
COUNT(事由区分) AS 入室回数
FROM 入退室管理
GROUP BY 事由区分;

# 4. 入室回数が 10 回を超える社員について、社員名と入室回数を取得する
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
HAVING COUNT(*) >= 10;

# 5. これまでに障害対応が発生した日付と、それに対応した社員数を取得する
SELECT 日付, COUNT(社員名) AS 対応社員数
FROM 入退室管理
WHERE 事由区分 = '3'
GROUP BY 日付;