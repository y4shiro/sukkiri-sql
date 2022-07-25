use intro_sql;

SELECT * FROM 口座;
SELECT * FROM 廃止口座;
SELECT * FROM 取引;
SELECT * FROM 取引事由;

# 第 2 章 基本文法と四大命令
# 1. 口座テーブルの全データを * を用いずに抽出
SELECT 口座番号, 名義, 種別, 残高, 更新日 FROM 口座;
# 2. 口座テーブルの全ての口座番号を抽出する
SELECT 口座番号 FROM 口座;
# 3. 口座テーブルの全ての口座番号と残高を抽出する
SELECT 口座番号, 残高 FROM 口座;
# 4. 口座テーブルの全てのデータを * を用いて抽出する
SELECT * FROM 口座;
# 5. 口座テーブルの全ての名義を "XXXXX" に更新する
UPDATE 口座
   SET 名義 = 'XXXXX';
# 6. 口座テーブルの全ての残高を 99999999、更新日を 2022-03-01 に更新
UPDATE 口座
   SET 残高 = 99999999, 更新日 = '2022-03-01';
# 7. 口座テーブルに次の 3 つのデータを 1 回の実行ごとに 1 つづつ登録する
INSERT INTO 口座 (口座番号, 名義, 種別, 残高, 更新日)
     VALUES ('0642191', 'アオキ　ハルカ', '1', 3640551, '2022-03-13');
INSERT INTO 口座 (口座番号, 名義, 種別, 残高, 更新日)
     VALUES ('1039410', 'キノシタ　リュウジ', '1', 259017, '2021-11-30');
INSERT INTO 口座 (口座番号, 名義, 種別, 残高)
     VALUES ('1239855', 'タカシナ　ミツル', '2', 6509773);
# 8. 口座テーブルの全てのデータを削除する
DELETE FROM 口座;

# 第 3 章 操作する行の絞り込み
# 9. 口座テーブルから、口座番号が '0037651' のデータを抽出する
SELECT *
  FROM 口座
 WHERE 口座番号 = '0037651';
# 10. 口座テーブルから、残高が 0 より大きいデータを抽出する
SELECT *
  FROM 口座
 WHERE 残高 > 0;
# 11. 口座テーブルから、口座番号が 1000000 番より前のデータを抽出する
SELECT *
  FROM 口座
 WHERE 口座番号 < 1000000;
# 12. 口座テーブルから、更新日が 2021 年以前のデータを抽出する
SELECT *
  FROM 口座
 WHERE 更新日 < '2022-01-01';
# 13. 口座テーブルから、残高が 100 万円以上のデータを抽出する
SELECT *
  FROM 口座
 WHERE 残高 >= 1000000;
# 14. 口座テーブルから、種別が '普通' ではないデータを抽出する
SELECT *
  FROM 口座
 WHERE 種別 <> '1';
# 15. 口座テーブルから、更新日が登録されていないデータを抽出する
SELECT *
  FROM 口座
 WHERE 更新日 IS NULL;
# 16. 口座テーブルから、'ハシ' を含む名義のデータを抽出する
SELECT *
  FROM 口座
 WHERE 名義 LIKE '%ハシ%';
# 17. 口座テーブルから、更新日が 2022/01 の日付であるデータを抽出する。ただし、記述する条件式は 1 つであること
SELECT *
  FROM 口座
 WHERE 更新日 BETWEEN '2022-01-01' AND '2022-01-31';
# 18. 口座テーブルから、種別が '当座' または '別段' のデータを抽出する。ただし、記述する条件式は 1 つであること
SELECT *
  FROM 口座
 WHERE 種別 IN ('2', '3');
# 19. 口座テーブルから、名義が 'サカタ　リョウヘイ' / 'マツモト　ミワコ' / 'ハマダ　サトシ' のデータを抽出する
SELECT *
  FROM 口座
 WHERE 名義 IN ('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ');
# 20. 口座テーブルから、更新日が 2021-12-30 から 2022-01-04 であるデータを抽出する
SELECT *
  FROM 口座
 WHERE 更新日 >='2021-12-30' AND 更新日 <= '2022-01-04';
# 21. 口座テーブルから、残高が 1 万円未満で、更新日が登録されているデータを抽出する
SELECT *
  FROM 口座
 WHERE 残高 < 10000 AND 更新日 IS NOT NULL;
# 22. 口座テーブルから、次の条件のいずれかに当てはまるデータを抽出する
# - 口座番号が 2000000 番台
# - 名義の姓が 'エ' から始まる 3 文字で、名前が 'コ' で終わる
SELECT *
  FROM 口座
 WHERE 口座番号 LIKE '2______'
    OR 名義 LIKE 'エ__　%コ';

# 第 4 章 検索結果の加工
# 24. 口座テーブルから、口座番号順に全てのデータを抽出する。ただし、並び替えには列名を指定し、昇順にすること
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 ORDER BY 口座番号;
# 25. 口座テーブルから、名義の一覧を取得する。データの重複を除外し、名義の昇順にすること
SELECT DISTINCT 名義
  FROM 口座
 ORDER BY 名義;
# 26. 口座テーブルから、残高の大きい順にすべてのデータを抽出する。残高が同額の場合には口座番号の昇順にし、並び替えには列番号を指定すること
SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 ORDER BY 4 DESC, 1;
# 27. 口座テーブルから、更新日を過去の日付順に 10 件抽出する。ただし、更新日の設定が無いデータは除くこと
SELECT 更新日
  FROM 口座
 WHERE 更新日 IS NOT NULL
 ORDER BY 更新日
 LIMIT 10;
# MySQL 以外で OFFSET を使った場合
SELECT 更新日
  FROM 口座
 WHERE 更新日 IS NOT NULL
 ORDER BY 更新日
 OFFSET 0 FETCH FIRST 10 ROWS ONLY;
# 28. 口座テーブルから、更新日と残高を、残高の小さい順に 11 ~ 20 件のみを抽出する。
# ただし、残高が 0 円または更新日の設定がないデータは除外し、残高が同額の場合には更新日の新しい順(降順)とする
SELECT 更新日, 残高
  FROM 口座
 WHERE 残高 > 0 AND 更新日 IS NOT NULL
 ORDER BY 残高, 更新日 DESC
 LIMIT 10 OFFSET 10;
# 29. 口座テーブルと廃止口座テーブルに登録されている口座番号を昇順に抽出する
SELECT 口座番号 FROM 口座
 UNION
SELECT 口座番号 FROM 廃止口座
 ORDER BY 口座番号;
# 30. 口座番号に登録されている名義のうち、廃止口座テーブルには存在しない名義を抽出する。重複データは除き、降順で並べる
SELECT DISTINCT 名義 FROM 口座;
SELECT DISTINCT 名義 FROM 廃止口座;
# PostgreSQL の場合
SELECT 名義 FROM 口座
EXCEPT
SELECT 名義 FROM 廃止口座
 ORDER BY 1 DESC;
# MySQL で NOT IN を使用した場合
SELECT DISTINCT 名義 FROM 口座
WHERE 名義 NOT IN (
  SELECT DISTINCT 名義
    FROM 廃止口座
)
ORDER BY 名義 DESC;
# MySQL で LEFT JOIN + IS NULL を使用した場合
SELECT DISTINCT 口座.名義
  FROM 口座
  LEFT JOIN 廃止口座
    ON 口座.名義 = 廃止口座.名義
 WHERE 廃止口座.名義 IS NULL
 ORDER BY 口座.名義 DESC;

# 31. 口座テーブルと廃止口座テーブルの両方に登録されている名義を昇順に抽出する
# PostgreSQL などの場合
   SELECT 名義 FROM 口座
INTERSECT
   SELECT 名義 FROM 廃止口座
    ORDER BY 1;
# MySQL で INNER JOIN を利用した場合
SELECT 口座.名義 FROM 口座
 INNER JOIN 廃止口座
    ON 口座.名義 = 廃止口座.名義
 ORDER BY 口座.名義;
# 32. 口座テーブルと廃止口座テーブルに登録されている口座番号と残高の一覧を取得する
# ただし、口座テーブルは残高が 0 のもの、廃止口座テーブルは解約時残高が 0 ではないものを抽出の対象とする。一覧は口座番号順とする
SELECT 口座番号, 残高 FROM 口座
 WHERE 残高 = 0
UNION
SELECT 口座番号, 解約時残高 FROM 廃止口座
 WHERE 解約時残高 <> 0
 ORDER BY 1;