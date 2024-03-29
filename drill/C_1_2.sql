use intro_sql;

SELECT * FROM 商品;
SELECT * FROM 廃番商品;
SELECT * FROM 注文;

# 1. 商品テーブルの全てのデータを * を使わずに抽出する
SELECT 商品コード, 商品名, 単価, 商品区分, 関連商品コード FROM 商品;

# 2. 商品テーブルの全ての商品名を抽出する
SELECT DISTINCT 商品名 FROM 商品;

# 3. 注文テーブルの全てのデータを * を用いて抽出する
SELECT * FROM 注文;

# 4. 注文テーブルの全ての注文番号、注文枝番、商品コードを抽出する
SELECT 注文番号, 注文枝番, 商品コード FROM 注文;

# 5. 商品テーブルに次のデータを 1 回の実行ごとに 1 つづつ追加する
INSERT INTO 商品 (商品コード, 商品名, 単価, 商品区分)
VALUES ('W0461', '冬のあったかコート', 12800, '1');
INSERT INTO 商品 (商品コード, 商品名, 単価, 商品区分)
VALUES ('S0331', '春のさわやかコート', 6800, '1');
INSERT INTO 商品 (商品コード, 商品名, 単価, 商品区分)
VALUES ('A0582', '秋のシックなコート', 9800, '1');

# 第 3 章 操作する行の絞り込み
# 6. 商品テーブルから、商品コードが 'W1252' のデータを抽出する
SELECT *
  FROM 商品
 WHERE 商品コード = 'W1252';

# 7. 商品コードが 'S0023' の商品について、商品テーブルの単価を 500 円に変更する
UPDATE 商品
   SET 単価 = '500'
 WHERE 商品コード = 'S0023';

# 8. 商品テーブルから、単価が千円以下の商品データを抽出する
SELECT *
  FROM 商品
 WHERE 単価 <= 1000;

# 9. 商品テーブルから、単価が 5 万円以上の商品データを抽出する
SELECT *
  FROM 商品
 WHERE 単価 >= 50000;

# 10. 注文テーブルから、2022 年以降の注文データを抽出する
SELECT *
  FROM 注文
 WHERE 注文日 >= '2022-01-01';

# 11. 注文テーブルから、2021 年 11 月以前の注文データを抽出する
SELECT *
  FROM 注文
 WHERE 注文日 < '2022-12-01';

# 12. 商品テーブルから、'衣類' ではない商品データを抽出する
SELECT *
  FROM 商品
 WHERE 商品区分 <> '1';

# 13. 注文テーブルから、クーポン割引を利用していない注文データを抽出する
SELECT *
  FROM 注文
 WHERE クーポン割引料 IS NULL;

# 14. 商品テーブルから、商品コードが 'N' で始まる商品を削除する
DELETE FROM 商品
 WHERE 商品コード LIKE 'N%';

# 15. 商品テーブルから、商品名に 'コート' が含まれる商品について、商品コード、商品名、単価を抽出する
SELECT 商品コード, 商品名, 単価
  FROM 商品
 WHERE 商品名 LIKE '%コート%';

# 16. '靴' または '雑貨' もしくは '未分類' の商品について、商品コード、商品区分を抽出する
# ただし、記述する条件式は 1 つである
SELECT 商品コード, 商品区分
  FROM 商品
 WHERE 商品区分 IN ('2', '3', '9');

# 17. 商品テーブルから、商品コードが 'A0100' ~ 'A0500' に当てはまる商品データを抽出する。条件式は 1 つであること
SELECT *
  FROM 商品
 WHERE 商品コード BETWEEN 'A0100' AND 'A0500';

# 18. 注文テーブルから、商品コードが 'N0501' / 'N1021' / 'N0223' のいずれかを注文した注文データを抽出する
SELECT *
  FROM 注文
 WHERE 商品コード IN ('N0501', 'N1021', 'N0223');

# 19. 商品テーブルから、'雑貨' で商品名に '水玉' が含まれる商品データを抽出する
SELECT *
  FROM 商品
 WHERE 商品区分 = '3' AND 商品名 LIKE '%水玉%';

# 20. 商品テーブルから、商品名に '軽い' または 'ゆるふわ' のどちらかが含まれる商品データを抽出する
SELECT *
  FROM 商品
 WHERE 商品名 LIKE '%軽い%' OR 商品名 LIKE '%ゆるふわ%';

# 21. 商品テーブルから、'衣類' で単価が 3 千円以下、または '雑貨' で単価が1万円以上の商品データを抽出する
SELECT *
  FROM 商品
 WHERE (商品区分 = '1' AND 単価 <= 3000)
    OR (商品区分 = '3' AND 単価 >= 10000);

# 22. 注文テーブルから、2022 年 3 月中に、一度の注文で数量 3 個以上の注文があった商品コードを抽出する
SELECT 商品コード
  FROM 注文
 WHERE 注文日 BETWEEN '2022-03-01' AND '2022-03-31'
   AND 数量 >= 3;
# 別解
SELECT 商品コード
  FROM 注文
 WHERE 注文日 >= '2022-03-01'
   AND 注文日 <= '2022-03-31'
   AND 数量 >= 3;

# 23. 注文テーブルから、一度の注文で数量 10 個以上を注文したか、クーポン割引を利用した注文データを抽出する
SELECT *
  FROM 注文
 WHERE 数量 >= 10
    OR クーポン割引料 IS NOT NULL;

# 第 4 章 検索結果の加工
# 25. 商品区分 '衣類' の商品について、商品コードの降順に商品コードと商品名の一覧を取得する
SELECT 商品コード, 商品名
  FROM 商品
 WHERE 商品区分 = '1'
 ORDER BY 商品コード DESC;

# 26. 注文テーブルから、主キーの昇順に 2022 年 3 月以降の注文一覧を取得する。
# 取得する項目は、注文日 / 注文番号 / 注文枝番 / 商品コード / 数量とする
SELECT 注文日, 注文番号, 注文枝番, 商品コード, 数量
  FROM 注文
 WHERE 注文日 >= '2022-03-01'
 ORDER BY 注文日, 注文番号, 注文枝番;

# 27. 注文テーブルから、これまでに注文のあった商品コードを抽出する。重複は除外し、商品コードの昇順に抽出すること
SELECT DISTINCT 商品コード
  FROM 注文
 ORDER BY 商品コード;

# 28. 注文テーブルから、注文のあった日付を新しい順に 10 行抽出する(同一日付が複数回登場しても良い)
SELECT 注文日
  FROM 注文
 ORDER BY 注文日 DESC
 LIMIT 10;
# MySQL 以外
SELECT 注文日
  FROM 注文
 ORDER BY 注文日 DESC
 OFFSET 0 FETCH FIRST 10 ROWS ONLY;

# 29. 商品テーブルから、単価の低い順に並べて 6 ~ 20 行目に当たる商品データを抽出する
# 同一の単価の場合は、商品区分、商品コードの昇順に並ぶようにする
SELECT *
  FROM 商品
 ORDER BY 単価, 商品区分, 商品コード
 LIMIT 15 OFFSET 5;

# 30. 廃盤商品テーブルから、2020 / 12 に廃盤されたものと、売上個数が 100 を超えるものを併せて抽出する
# 一覧は、売上個数の多い順に並べること
SELECT *
  FROM 廃番商品
 WHERE (廃番日 >= '2020-12-01' AND 廃番日 <= '2020-12-31')
    OR 売上個数 >= 100
 ORDER BY 売上個数 DESC;
# 別解
SELECT *
  FROM 廃番商品
 WHERE (廃番日 >= '2020-12-01' AND 廃番日 <= '2020-12-31')
UNION
SELECT *
  FROM 廃番商品
 WHERE 売上個数 >= 100
 ORDER BY 売上個数 DESC;

# 31. 商品テーブルから、これまでに注文されたことのない商品コードを昇順に抽出する
SELECT 商品コード
  FROM 商品
 WHERE 商品コード NOT IN(SELECT DISTINCT 商品コード FROM 注文)
 ORDER BY 商品コード;
# 別解 LEFT JOIN + IS NULL
SELECT S.商品コード
  FROM 商品 AS S
  LEFT JOIN 注文 AS C
    ON C.商品コード = S.商品コード
 WHERE C.商品コード IS NULL
 ORDER BY S.商品コード;
# 別解 EXCEPT が利用可能な場合
SELECT 商品コード
  FROM 商品
EXCEPT
SELECT 商品コード
  FROM 注文
 ORDER BY 1;

# 32. 商品テーブルから、これまでに注文された実績のある商品コードを降順に抽出する
SELECT 商品コード
  FROM 商品
 WHERE 商品コード IN (SELECT DISTINCT 商品コード FROM 注文)
 ORDER BY 商品コード DESC;

# 33. 商品区分が '未分類' で、単価が千円以下と 1 万円を超える商品について、商品コード、商品名、単価を抽出する
# 単価の低い順に並べ、同額の場合は商品コードの昇順とする
SELECT 商品コード, 商品名, 単価
  FROM 商品
 WHERE 商品区分 = '9'
   AND (単価 <= 1000 OR 単価 >= 10000)
 ORDER BY 単価, 商品コード;

# 第 5 章 式と関数
# 34. 商品テーブルの商品区分 '未分類' の商品について、商品コード、単価、キャンペーン価格の一覧を取得する
# キャンペーン価格は単価の 5% 引きであり、1 円未満の端数は考慮しない
# 一覧は商品コード順に並べること
SELECT 商品コード, 単価, 単価 * 0.95 AS キャンペーン価格
  FROM 商品
 WHERE 商品区分 = '9'
 ORDER BY 商品コード;

# 35. 注文日が 2022-03-12 から 2022-03-14 で、同じ商品を 2 個以上注文し、既にクーポン割引を利用している注文について、
# さらに 300 円割引をすることになった。該当データのクーポン割引料を更新する
UPDATE 注文
   SET クーポン割引料 = クーポン割引料 + 300
 WHERE 注文日 >= '2022-03-12' AND 注文日 <= '2022-03-14'
   AND 数量 >= 2
   AND クーポン割引料 IS NOT NULL;

# 36. 注文番号 '202202250126' について、商品コード 'W0156' の注文数を 1 つ減らすよう更新する
UPDATE 注文
   SET 数量 = 数量 - 1
 WHERE 注文番号 = '202202250126'
   AND 商品コード = 'W0156';

# 37. 注文テーブルから、注文番号 '202110010001' ~ '202110319999' の注文データを抽出する
# 注文番号と枝番は - でつなげて一つの項目として抽出する
SELECT CONCAT(注文番号, '-', 注文枝番)
  FROM 注文
 WHERE 注文番号 BETWEEN '202110010001' AND '202110319999';

# 38. 商品テーブルから、商品区分の一覧を取得する。見出しは '区分' と '区分名' とし、区分名には日本語名を表記する
SELECT 商品区分 AS 区分,
  CASE
    WHEN 商品区分 = '1' THEN '衣類'
    WHEN 商品区分 = '2' THEN '靴'
    WHEN 商品区分 = '3' THEN '雑貨'
    WHEN 商品区分 = '9' THEN '未分類'
  END AS 区分名
  FROM 商品
 GROUP BY 商品区分;

# 39. 商品テーブルから、商品コード、商品名、単価、販売価格ランク、商品区分を抽出する
# 販売価格ランクは、3 前円未満 を 'S'、3 千円以上 1 万円未満 を 'M'、1万円以上を 'L' とする
# また、商品区分はコードと日本語名を ':' で連結して表示する
# 一覧は、単価の昇順に並べ、同額の場合は商品コードの昇順に並べること
SELECT 商品コード, 商品名, 単価, 
       CASE
	     WHEN 単価 < 3000 THEN 'S'
	     WHEN 単価 >= 3000 AND 単価 < 10000 THEN 'M'
	     WHEN 単価 >= 10000 THEN 'L'
       END AS 販売価格ランク,
       CONCAT(商品区分, ':',
         CASE
           WHEN 商品区分 = '1' THEN '衣類'
           WHEN 商品区分 = '2' THEN '靴'
           WHEN 商品区分 = '3' THEN '雑貨'
           WHEN 商品区分 = '9' THEN '未分類'
         END
       ) AS 区分名
  FROM 商品
 ORDER BY 単価, 商品コード;
 
# 40. 商品テーブルから、商品名が 10 文字を超過する商品名とその文字数を抽出する。文字数の昇順に並べること
SELECT 商品名, CHAR_LENGTH(商品名) AS 文字数
  FROM 商品
 WHERE CHAR_LENGTH(商品名) > 10
 ORDER BY CHAR_LENGTH(商品名);

# 41. 注文テーブルから、注文日と注文番号の一覧を抽出する。注文番号は日付の部分を取り除き、4 桁の連番部分を表記すること
SELECT 注文日,
       SUBSTRING(注文番号, 9, 4) AS 注文番号
  FROM 注文;

# 42. 商品テーブルについて、商品コードの 1 文字目が 'M' の商品の商品コードを 'E' で始まるよう更新する
UPDATE 商品
   SET 商品コード = CONCAT('E', SUBSTRING(商品コード, 2, 4))
 WHERE SUBSTRING(商品コード, 1, 1) = 'M';

# 43. 注文番号の連結部分が '1000' ~ '2000' の注文番号を抽出する。連番部分 4 桁を昇順で抽出すること
SELECT SUBSTRING(注文番号, 9, 4) AS 連結部分
  FROM 注文
 WHERE SUBSTRING(注文番号, 9, 4) >= '1000'
   AND SUBSTRING(注文番号, 9, 4) <= '2000'
 ORDER BY SUBSTRING(注文番号, 9, 4);

# 44. 商品コード 'S1990' の廃番日を、関数を使って本日の日付に修正する
UPDATE 廃番商品
   SET 廃番日 = CURDATE()
 WHERE 商品コード = 'S1990';

# 45. 1 万円以上の商品一覧を取得する。ただし、30% 値下げした時の単価を、商品コード、商品名、現在の単価と併せて取得する
# 値下げ後の単価の見出しは、'値下げした単価' とし、1 円未満は切り捨てる
SELECT 商品コード, 商品名, 単価,
  TRUNCATE(単価 * 0.7, 0) AS 値下げした単価
  FROM 商品
 WHERE 単価 >= 10000;

# 第 6 章 集計とグループ化
# 46. これまでに注文された数量の合計を求める
SELECT SUM(数量) AS 数量合計 FROM 注文;

# 47. 注文日順に、注文日ごとの数量の合計を求める
SELECT 注文日, SUM(数量) AS 数量合計
  FROM 注文
 GROUP BY 注文日
 ORDER BY 注文日;

# 48. 商品区分順に、商品区分ごとの単位の最小額と最高額を求める
SELECT 商品区分, MIN(単価) AS 最小額, MAX(単価) AS 最高額
  FROM 商品
 GROUP BY 商品区分
 ORDER BY 商品区分;

# 49. 商品コードごとに、これまで注文された数量の合計を商品コード順に求める
SELECT 商品コード, SUM(数量) AS 注文合計
  FROM 注文
 GROUP BY 商品コード
 ORDER BY 商品コード;

# 50. これまでに最もよく売れた商品を 10 位まで抽出する。商品コードと販売した数量を数量の多い順に並べ、数量が同じ場合は商品コードの昇順で並べる
SELECT 商品コード, SUM(数量) AS 数量合計
  FROM 注文
 GROUP BY 商品コード
 ORDER BY 数量合計 DESC, 商品コード
 LIMIT 10;

# 51. これまでに売れた数量が 5 未満の商品コードとその数量を抽出する
SELECT 商品コード, SUM(数量) AS 数量合計
  FROM 注文
 GROUP BY 商品コード
HAVING SUM(数量) < 5;

# 52. これまでにクーポン割引をした注文件数と、割引額の合計を求める。ただし、WHERE 句による絞り込み条件は指定しない
SELECT COUNT(クーポン割引料) AS 割引件数, SUM(クーポン割引料) AS 割引額合計
  FROM 注文;

# 53. 月ごとの注文件数を求める。抽出列の名前は '年月' と '注文件数' とし、年月列の内容は '202201' のような形式で、日付の新しい順で抽出する
# なお、1 件の注文には、必ず注文枝番 '1' の注文明細が含まれている事が保証されている
SELECT SUBSTRING(注文番号, 1, 6) AS 年月, COUNT(*) AS 注文件数
  FROM 注文
 WHERE 注文枝番 = '1'
 GROUP BY 年月
 ORDER BY 年月 DESC;

# 54. 注文テーブルから、'Z' から始まる商品コードのうち、これまでに売れた数量が 100 個以上の商品コードを抽出する
SELECT 商品コード, SUM(数量)
  FROM 注文
 WHERE 商品コード LIKE 'Z%'
 GROUP BY 商品コード
HAVING SUM(数量) >= 100;

# 第 7 章 副問合せ
# 55. 商品コード 'S0604' の商品について、商品コード、商品名、単価、これまでに販売した数量を抽出する
# ただし、抽出には、選択列リストにて注文テーブルを副問合せする SELECT 文を用いること
SELECT 商品コード, 商品名, 単価,
       (SELECT SUM(数量)
          FROM 注文
         WHERE 商品コード = 'S0604') AS 販売数量
  FROM 商品
 WHERE 商品コード = 'S0604';

# 56. 次の注文について、商品コードを間違って登録していることがわかった
# 商品テーブルより、条件に合致する商品コードを取得し、当該の注文テーブルを更新する
# ただし、注文テーブルの更新には SET 句にて商品テーブルを副問合せする UPDATE 文を用いること
# - 注文日: 2022-03-15 / 注文番号: 202203150014 / 注文枝番: 1
# - 正しい注文の条件: 商品区分が '靴' で、商品名に 'ブーツ' / '雨' / '安心' を含む
UPDATE 注文
   SET 商品コード = (SELECT 商品コード
          FROM 商品
         WHERE 商品区分 = '2'
           AND 商品名 LIKE '%ブーツ%'
           AND 商品名 LIKE '%雨%'
           AND 商品名 LIKE '%安心%')
 WHERE 注文日 = '2022-03-15'
   AND 注文番号 = '202203150014'
   AND 注文枝番 = '1';

# 57. 商品名に 'あったか' が含まれる商品が売れた日付とその商品コードを過去の日付順に抽出する
# ただし、WHERE 句で IN 演算子を利用した副問合せを用いること
SELECT 注文日, 商品コード
  FROM 注文
 WHERE 商品コード IN (SELECT 商品コード
                      FROM 商品
                     WHERE 商品名 LIKE ('%あったか%'))
 ORDER BY 注文日;

# 58. 商品ごとにそれぞれ平均販売数量を求め、どの商品の平均販売数量よりも多い数が売れた商品を探し、
# その商品コードと販売数量を抽出する。ただし、ALL 演算子を利用した副問合せを用いること
SELECT 商品コード, SUM(数量) AS 数量
  FROM 注文
 GROUP BY 商品コード
HAVING SUM(数量) > ALL (SELECT AVG(数量)
                         FROM 注文
                        GROUP BY 商品コード);

# 59. クーポン割引を利用して販売した商品コード 'W0746' の商品について、その販売数量と、商品 1 個あたりの平均割引額を抽出する
# 列名は '割引による販売数' と '平均割引額' とし、1 円未満は切り捨てる
# 抽出には FROM 句で副問合せを利用する
SELECT C.数量合計 AS 割引による販売数, TRUNCATE(C.割引料合計 / C.数量合計, 0) AS 平均割引額
  FROM (SELECT SUM(数量) AS 数量合計, SUM(クーポン割引料) AS 割引料合計
          FROM 注文
         WHERE クーポン割引料 IS NOT NULL
           AND 商品コード = 'W0746') AS C;

# 60. 次の注文について、内容を追加したいという依頼があった。追加分の注文を注文テーブルに登録する。
# 使用する注文枝番は、該当の注文番号を副問合せにて参照し、1 を加算した番号を採番する。
# なお、登録の SQL 文は注文ごとに 1 つずつ作成すること
# 注文日: 2022-03-21, 注文番号: 202203210080, 商品コード: S1003, 数量: 1, クーポン割引: 無し
# 注文日: 2022-03-22, 注文番号: 202203220901, 商品コード: A0052, 数量: 2, クーポン割引: 500
INSERT INTO 注文
     SELECT 注文日, 注文番号, MAX(注文枝番) + 1, 'S1003', 1, NULL
       FROM 注文
      WHERE 注文日 = '2022-03-21' AND 注文番号 = '202203210080'
      GROUP BY 注文日, 注文番号;

INSERT INTO 注文
     SELECT 注文日, 注文番号, MAX(注文枝番) + 1, 'A0052', 2, 500
       FROM 注文
      WHERE 注文日 = '2022-03-22' AND 注文番号 = '202203220901'
      GROUP BY 注文日, 注文番号;

# 第 8 章 複数テーブルの結合
# 61. 注文番号 '202201130115' について、注文番号、注文枝番、商品コード、商品名、数量の一覧を注文番号および注文枝番の順に抽出する
# 商品名は商品テーブルより取得すること
SELECT T.注文番号, T.注文枝番, T.商品コード, S.商品名, T.数量
  FROM 注文 AS T
  JOIN 商品 AS S
    ON T.商品コード = S.商品コード
 WHERE T.注文番号 = '202201130115'
 ORDER BY T.注文番号, T.注文枝番;

# 62. 廃番となった商品コード 'A0009' について、廃番日より後に注文された注文情報を抽出する
# 抽出する列は注文日 / 注文番号 / 注文枝番 / 数量 / 注文金額で、注文金額は単価と数量から算出すること
SELECT T.注文日, T.注文番号, T.注文枝番, T.数量, T.数量 * H.単価 AS 注文金額
  FROM 注文 AS T
  JOIN 廃番商品 AS H
    ON T.商品コード = H.商品コード
 WHERE T.商品コード = 'A0009'
   AND T.注文日 > H.廃番日;

# 63. 商品コード 'S0604' について、商品情報(商品コード / 商品名 / 単価)とこれまでの注文情報(注文日 / 注文番号 / 数量)、
# さらに単価と数量から売上金額を求め、一覧として抽出する
# 一覧は、注文のあった順に表示すること
SELECT S.商品コード, S.商品名, S.単価, T.注文日, T.注文番号, T.数量, S.単価 * T.数量 AS 売上金額
  FROM 注文 AS T
  JOIN 商品 AS S
    ON T.商品コード = S.商品コード
 WHERE S.商品コード = 'S0604'
 ORDER BY T.注文番号;

# 64. 2020/08 に注文の合った商品コード一覧を抽出する。一覧には商品名も表示する
# 既に廃番となっている商品は特に考慮する必要はない、具体的には一覧に含まれなくても良い
SELECT T.商品コード, S.商品名
  FROM 注文 AS T
  JOIN 商品 AS S
    ON T.商品コード = S.商品コード
 WHERE T.注文日 >= '2020-08-01'
   AND T.注文日 < '2020-09-01';

# 65. 問題 64 で、廃番された商品も一覧に含めるよう SQL を変更する。なお、廃番商品の商品名には '廃番' と表示すること
SELECT T.商品コード, COALESCE(S.商品名, '廃番') AS 商品名
  FROM 注文 AS T
  LEFT JOIN 商品 AS S
    ON T.商品コード = S.商品コード
 WHERE T.注文日 >= '2020-08-01'
   AND T.注文日 < '2020-09-01';

# 66. 商品区分 '雑貨' の商品について、注文日 / 商品コード / 商品名 / 数量 を抽出する
# 商品については、商品コード : 商品名 の形式で表示する。
# ただし、注文の無かった '雑貨' 商品についてももれなく一覧に記載し、数量は 0 とすること
SELECT T.注文日, CONCAT(S.商品コード, ':', S.商品名) AS '商品', COALESCE(T.数量, 0) AS 数量
  FROM 注文 AS T
 RIGHT JOIN 商品 AS S
    ON S.商品コード = T.商品コード
 WHERE S.商品区分 = '3';

# 67. 問題 66 について、注文のあった '雑貨' 商品が既に廃番になっている可能性も考慮し、一覧を抽出する
# 廃番になった商品は、'商品コード : (廃番済み)' のように表示する
# 注意) MySQL では動かないコード
SELECT TMP.注文日, TMP.商品, TMP.数量
  FROM (SELECT S.商品区分,
               T.注文日,
               COALESCE(CONCAT(S.商品コード, ':', S.商品名), CONCAT(T.商品コード, ':(廃番済み)')) AS 商品,
               COALESCE(T.数量, 0) AS 数量
          FROM 注文 AS T
          LEFT JOIN 商品 AS S
            ON T.商品コード = S.商品コード
          UNION
        SELECT S.商品区分,
               T.注文日,
               COALESCE(CONCAT(S.商品コード, ':', S.商品名), CONCAT(T.商品コード, ':(廃番済み)')) AS 商品,
               COALESCE(T.数量, 0) AS 数量
          FROM 注文 AS T
          RIGHT JOIN 商品 AS S
            ON T.商品コード = S.商品コード) AS TMP
 WHERE TMP.商品区分 = '3';
-- ここから PostgreSQL に乗り換えた
select T.注文日,
       coalesce(S.商品コード || ':' || S.商品名, T.商品コード || ':(廃番済み)') as 商品,
       coalesce(T.数量, 0) as 数量
  from 注文 as T
  full join 商品 as S
    on T.商品コード = S.商品コード
 where S.商品区分 = '3';

-- 68. 注文番号 '202104030010' について、注文日 / 注文番号 / 注文枝番 / 商品コード / 商品名 / 単価 / 数量 / 注文金額を抽出する
-- 注文金額は単価と数量より算出し、その総額からクーポン割引料を差し引いた物とする
-- また、商品が廃番になっている場合は、廃番商品テーブルから必要な情報を取得すること
select T.注文日,
       T.注文番号,
       T.注文枝番,
       T.商品コード,
       coalesce(S.商品名, H.商品名) as 商品名,
       coalesce(S.単価, H.単価) as 単価,
       T.数量,
       coalesce(S.単価, H.単価) * T.数量 - coalesce(T.クーポン割引料, 0) as 注文金額
  from 注文 as T
  left join 商品 as S
    on T.商品コード = S.商品コード
  left join 廃番商品 as H
    on T.商品コード = H.商品コード
 where T.注文番号 = '202104030010';
 
-- 69. 商品コードが 'B' で始まる商品について、商品テーブルから商品コード / 商品名 / 単価 / 注文テーブルからこれまでの売上個数を抽出する
-- 併せて、単価と個数からこれまでの総売上金額を計算する(クーポン割引は考慮しなくて良い)
-- 一覧は、商品コード順に表示すること
select S.商品コード, S.商品名, S.単価, coalesce(T.数量, 0) as 売上数量, S.単価 * coalesce(T.数量, 0) as 総売上金額
  from 商品 as S
  left join (select 商品コード, SUM(数量) as 数量
               from 注文
              where 商品コード like 'B%'
              group by 商品コード) as T
    on S.商品コード = T.商品コード
 where S.商品コード like 'B%'
 order by S.商品コード;

-- 70. 現在販売中の商品について、関連している商品のある一覧を抽出する
-- 一覧には、商品コード / 商品名 / 関連商品コード / 関連商品名を記載する
select S1.商品コード, S1.商品名, S1.関連商品コード, S2.商品名
  from 商品 as S1
  join 商品 as S2
    on S1.関連商品コード = S2.商品コード