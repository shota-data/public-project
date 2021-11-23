-- ====================================================
-- ①「month」へ変更
-- ②集計キーをもとにsum実行
-- ====================================================
-- ①「month」へ変更
-- ====================================================
WITH
  col AS(
  SELECT
    id,
    SUBSTR(CAST(date AS STRING), 1, 7) month,
    pr,
    CASE  WHEN pr = "A" THEN s     ELSE null  END   s_A,
    CASE  WHEN pr = "A" THEN p    ELSE null  END   p_A,
    CASE  WHEN pr = "B" THEN s     ELSE null  END   s_B,
    CASE  WHEN pr = "B" THEN p    ELSE null  END   p_B,
    CASE  WHEN pr = "C" THEN s     ELSE null  END   s_C,
    CASE  WHEN pr = "C" THEN p    ELSE null  END   p_C,
    CASE  WHEN pr = "D" THEN s     ELSE null  END   s_D,
    CASE  WHEN pr = "D" THEN p    ELSE null  END   p_D,
    CASE  WHEN pr IS NULL THEN s   ELSE null  END   s_null,
    CASE  WHEN pr IS NULL THEN p  ELSE null  END   p_null,,
  FROM
    ``)
 )
-- ====================================================
-- ②集計キーをもとにsum実行
-- ====================================================
SELECT
  MIN(id) id,
  CAST(CONCAT(month,'-01') AS DATE) date,
  pr,
  SUM(s_A) s_A,
  SUM(p_A) p_A,
  SUM(s_B) s_B,
  SUM(p_B) p_B,
  SUM(s_C) s_C,
  SUM(p_C) p_C,
  SUM(s_D) s_D,
  SUM(p_D) p_D,
  SUM(s_null) s_null,
  SUM(p_null) p_null,
FROM
  col
GROUP BY
  1,2,3,4

