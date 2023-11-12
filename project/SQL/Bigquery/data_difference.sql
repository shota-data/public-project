-- ==============================
-- データ確認方法
-- 両テーブルから不一致カラムを除外した差分データの確認
-- ==============================

WITH one as(
SELECT * except(update_date)
FROM  `project.DS.TBL`
WHERE ex_date = ''

EXCEPT DISTINCT

SELECT * except(update_date)
FROM  `project.DS.TBL`
WHERE ex_date = ''
), two as (
SELECT * except(update_date)
FROM  `project.DS.TBL`
WHERE ex_date = ''

EXCEPT DISTINCT

SELECT * except(update_date)
FROM  `project.DS.TBL`
WHERE ex_date = ''
)
SELECT *
FROM one

UNION ALL

SELECT *
FROM two
