SELECT * FROM 家計簿;

INSERT INTO 家計簿
VALUES ('2022-02-25', '居住費', '3月の家賃', 0, 85000);

SELECT 費目, 入金額, 出金額
FROM 家計簿;

SELECT 費目 AS ITEM, 入金額 AS RECEIVE, 出金額 AS PAY
FROM 家計簿 AS MONEYBOOK
WHERE 費目 = '給料';

INSERT INTO 家計簿
(費目, 日付, 出金額)
VALUES ('通信費', '2022-02-20', 6200);

INSERT INTO 家計簿
VALUES ('2022-03-20', '通信費', '携帯電話料金', 0, 6200);