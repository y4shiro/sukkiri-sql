USE intro_sql;

# 問題 3-1
# 1. 6 月のデータ
SELECT * FROM 気象観測 WHERE 月 = 6;

# 2. 6 月以外のデータ
SELECT * FROM 気象観測 WHERE 月 != 6;
SELECT * FROM 気象観測 WHERE 月 <> 6;

# 3. 降水量が 100 未満
SELECT * FROM 気象観測 WHERE 降水量 < 100;

# 4. 降水量が 200 より多い
SELECT * FROM 気象観測 WHERE 降水量 > 200;

# 5. 最高気温が 30 以上のデータ
SELECT * FROM 気象観測 WHERE 最高気温 >= 30;

# 6. 最低気温が 0 以下のデータ
SELECT * FROM 気象観測 WHERE 最低気温 <= 0;

# 7. 3 / 5 / 7 月のデータ
SELECT * FROM 気象観測 WHERE 月 IN(3, 5, 7);
SELECT * FROM 気象観測 WHERE 月 = 3 OR 月 = 5 OR 月 = 7;

# 8. 3 / 5 / 7 月以外のデータ
SELECT * FROM 気象観測 WHERE 月 NOT IN(3, 5, 7);
SELECT * FROM 気象観測 WHERE 月 <> 3 AND 月 <> 5 AND 月 <> 7;

# 9. 降水量が 100 以下かつ、湿度が 50 より低い
SELECT * FROM 気象観測 WHERE 降水量 <= 100 AND 湿度 < 50;

# 10. 最低気温が 5 未満か、最高気温が 35 より高い
SELECT * FROM 気象観測 WHERE 最低気温 < 5 OR 最高気温 > 35;

# 11. 湿度が 60 ~ 79 の範囲にあるデータ
SELECT * FROM 気象観測 WHERE 湿度 BETWEEN 60 AND 79;
SELECT * FROM 気象観測 WHERE 湿度 >= 60 AND 湿度 <= 79;

# 12. 観測データのない列のある月
SELECT * FROM 気象観測
WHERE 降水量 IS NULL OR 最高気温 IS NULL OR 最低気温 IS NULL OR 湿度 IS NULL;

# 問題 3-2
# 1. 都道府県が '川' で終わる都道府県名
SELECT * FROM 都道府県 WHERE 都道府県名 LIKE '%川';
# 2. 都道府県名に '島' が含まれる都道府県名
SELECT * FROM 都道府県 WHERE 都道府県名 LIKE '%島%';
# 3. 都道府県名が '愛' で始まる都道府県名
SELECT * FROM 都道府県 WHERE 都道府県名 LIKE '愛%';
# 4. 都道府県名と県庁所在地が一致するデータ
SELECT * FROM 都道府県 WHERE 都道府県名 = 県庁所在地;
# 5. 都道府県名と県庁所在地が一致しないデータ
SELECT * FROM 都道府県 WHERE 都道府県名 <> 県庁所在地;

# 問題 3-3
# 1. 登録されている全データを取得
SELECT * FROM 成績表;
# 2. 次ページの平にある学生の成績データを追加する
INSERT INTO 成績表
VALUES ('S001', '織田 信長', 77, 55, 80, 75, 93, NULL);
INSERT INTO 成績表
VALUES ('A002', '豊臣 秀吉', 64, 69, 70, 0, 59, NULL);
INSERT INTO 成績表
VALUES ('E003', '徳川 家康', 80, 83, 85, 90, 79, NULL);
# 3. 2 で登録した学籍番号 S001 の学生の法学を 85、哲学を 67 に修正する
UPDATE 成績表
   SET 法学 = 85, 哲学 = 67
 WHERE 学籍番号 = 'S001';
# 4. 2 で登録した A002 と E003 の学生の外国語を 81 に修正する
UPDATE 成績表
   SET 外国語 = 81
 WHERE 学籍番号 IN('A002', 'E003');
# 5. 総合成績を更新する SQL 文を書く
UPDATE 成績表
   SET 総合成績 = 'A'
 WHERE 法学 >= 80 AND 経済学 >= 80 AND 哲学 >= 80 AND 情報倫理 >= 80 AND 外国語 >= 80;

UPDATE 成績表
   SET 総合成績 = 'B'
 WHERE (法学 >= 80 OR 外国語 >= 80) AND (経済学 >= 80 OR 哲学 >= 80)
   AND 総合成績 IS NULL;

UPDATE 成績表
   SET 総合成績 = 'D'
 WHERE 法学 < 50 AND 経済学 < 50 AND 哲学 < 50 AND 情報倫理 < 50 AND 外国語 < 50
   AND 総合成績 IS NULL;

UPDATE 成績表
   SET 総合成績 = 'C'
 WHERE 総合成績 IS NULL;
 
# 6. 0 点の科目がある学生を成績表テーブルから削除する
DELETE FROM 成績表
 WHERE 法学 = 0 OR 経済学 = 0 OR 哲学 = 0 OR 情報倫理 = 0 OR 外国語 = 0;