USE intro_sql;

# 問題 4-1
# 1. 注文順かつその明細順に、すべての注文データを取得する
SELECT * FROM 注文履歴
ORDER BY 注文番号, 注文枝番;

# 2. 2022/01 に注文のあった商品名一覧を商品名順に取得する
SELECT DISTINCT 商品名 FROM 注文履歴
WHERE 日付 >= '2022-01-01' AND 日付 <= '2022-01-31'
ORDER BY 商品名;

# 3. ドリンクの商品を対象に、注文金額の低いほうから 2 ~ 4 番目の注文の注文番号と注文枝番、注文金額を取得する
SELECT 注文番号, 注文枝番, 注文金額 FROM 注文履歴
 WHERE 分類 = '1' ORDER BY 注文金額
OFFSET 1 ROWS FETCH NEXT 3 ROWS ONLY;

# 4. その他の商品について、2つ以上同時に購入された商品を取得し、日付、商品名、単価、数量、注文金額を購入日順に表示する。
# ただし、同日に売り上げたものは、数量の多い順に表示する
SELECT 日付, 商品名, 単価, 数量, 注文金額 FROM 注文履歴
 WHERE 分類 = '3' AND 数量 >= 2
ORDER BY 日付, 数量 DESC;

# 5. 商品の分類ごとに、分類、商品名、サイズ、単価を一つの表として取得する
# また、サイズはドリンクの商品についてのみ表示し、分類と商品名順に並べる
SELECT DISTINCT 分類, 商品名, サイズ, 単価 FROM 注文履歴
WHERE 分類 = '1'
UNION
SELECT DISTINCT 分類, 商品名, NULL, 単価 FROM 注文履歴
WHERE 分類 = '2'
UNION
SELECT DISTINCT 分類, 商品名, NULL, 単価 FROM 注文履歴
WHERE 分類 = '3'
ORDER BY 1, 2;

# 問題 4-2
# 1. 和集合の結果、整数テーブルと等しくなる
SELECT 値 FROM 奇数
UNION
SELECT 値 FROM 偶数;

# 2. 差集合の結果、奇数テーブルと等しくなる
SELECT 値 FROM 整数
EXCEPT
SELECT 値 FROM 偶数;

# 3. 積集合の結果、偶数テーブルと等しくなる
SELECT 値 FROM 整数
INTERSECT
SELECT 値 FROM 偶数;

# 4. 検索結果無し
SELECT 値 FROM 奇数
INTERSECT
SELECT 値 FROM 偶数;