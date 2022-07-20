use intro_sql;

SELECT * FROM 社員; # 社員番号, 名前, 生年月日, 部署ID(外部キー), 上司ID, 勤務地ID(外部キー)
SELECT * FROM 部署; # 部署ID, 名前, 本部拠点ID(外部キー)
SELECT * FROM 支店; # 支店ID, 名前, 支店長ID(外部キー)

# 問題 8-2
# 1. 部署名が入った全社員の一覧表
# 社員番号, 名前, 部署名 の列を持った表を作成
SELECT 社員番号, S.名前 AS 名前, B.名前 AS 部署名
  FROM 社員 AS S
  JOIN 部署 AS B
    ON S.部署ID = B.部署ID;

# 2. 上司の名前が入った全社員の一覧表
# 社員番号, 名前, 上司名
SELECT S.社員番号, S.名前 AS 名前, J.名前 AS 上司名
  FROM 社員 AS S
  LEFT JOIN 社員 AS J
    ON S.上司ID = J.社員番号;

# 3. 部署名と勤務地が入った社員一覧表
# 社員番号, 名前, 部署名, 勤務地
SELECT SHA.社員番号, SHA.名前, B.名前 AS 部署名, SHI.名前 AS 勤務地
  FROM 社員 AS SHA
  JOIN 部署 AS B
    ON SHA.部署ID = B.部署ID
  JOIN 支店 AS SHI
    ON SHA.勤務地ID = SHI.支店ID;

# 4. 支店ごとの支店長名と社員数の一覧表
SELECT SHI.支店ID AS 支店コード, SHI.名前 AS 支店名, SHA1.名前 AS 支店長名, SHA2.社員数
  FROM 支店 AS SHI
  JOIN 社員 AS SHA1
    ON SHI.支店長ID = SHA1.社員番号
  JOIN (SELECT 勤務地ID, COUNT(勤務地ID) AS 社員数
          FROM 社員
         GROUP BY 勤務地ID) AS SHA2
    ON SHA2.勤務地ID = SHA1.勤務地ID;

# 5. 上司と違う勤務地に努めている社員一覧表
# 社員番号, 名前, 本人勤務地, 上司勤務地
SELECT S1.社員番号 AS 社員番号, S1.名前 AS 名前,
       K1.名前 AS 本人勤務地, K2.名前 AS 上司勤務地
  FROM 社員 AS S1
  JOIN 社員 AS S2
    ON S1.上司ID = S2.社員番号
   AND S1.勤務地ID <> S2.勤務地ID
  JOIN 支店 AS K1
    ON S1.勤務地ID = K1.支店ID
  JOIN 支店 AS K2
    ON S2.勤務地ID = K2.支店ID;