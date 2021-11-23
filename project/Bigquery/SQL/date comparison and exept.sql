
-- ==============================
--両データの比較して不一致データを結果に出力
-- ==============================

SELECT DISTINCT month
FROM (
SELECT * except(ex_date)
FROM 
    `project.DS.TBL`
WHERE ex_date = ''

EXCEPT DISTINCT

SELECT * except(ex_date)
FROM 
    `project.DS.TBL`
WHERE ex_date = ''
)
ORDER BY  1