------------------------------
-- over(partition by)を使用した場合の数値カウントサンプル
-- クエリ実行日を含む当月から25ヶ月前の例：4月１日〜前日まで
-- * deleted_atが空のもの
-- * activity_type=19or23のもの
------------------------------
  SELECT
  distinct
    DATE(acted_at) acted_at,
    brand_id,
    product_id,
    COUNT(*) OVER(PARTITION BY brand_id, user_id, DATE(acted_at), related_keys) pv_ct,
    COUNT(*) OVER(PARTITION BY brand_id, user_id, DATE(acted_at)) uu_ct,
  FROM  `プロジェクト名.データセット.テーブル名`
  WHERE
    deleted_at IS NULL
    AND activity_type IN (19,23)
    AND DATE(acted_at) BETWEEN DATE_SUB(DATE_ADD(DATE_TRUNC(CURRENT_DATE('Asia/Tokyo'), MONTH), INTERVAL -25 MONTH), INTERVAL 0 DAY)
    AND DATE_SUB(CURRENT_DATE('Asia/Tokyo'), INTERVAL 1 DAY) 
