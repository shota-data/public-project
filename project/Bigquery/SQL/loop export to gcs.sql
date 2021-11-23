DECLARE x INT64 DEFAULT SUBSTR(2021-11-01, 1, 7); # stores で使う引数（デフォルト値＝1）

# 変数への代入
# ARRAYの値（店舗一覧）を自動的に作りたかったので、ARRAY_AGGで作成

SET stores = ADD_MONTHS(x, 6);

# ループ処理
# storesの長さまで繰り返し

WHILE x <= stores
 DO

  EXPORT DATA OPTIONS(
  uri='gs://xxxxxxxxxxx-gcs-bucket-tokyo/export_sample/*.csv.gz', -- ファイルパスを指定。uriにはワイルドカード表記とする必要がある(ファイル名個別指定は出来ない)
  compression='GZIP',  -- 圧縮形式を指定(GZIP, DEFLATE, SNAPPY)。未指定の場合は圧縮無し
  format='CSV',        -- ファイルフォーマットを指定。CSV, JSON, AVROが選択可能
  overwrite=true,      -- ファイルが存在していた場合の上書き有無。未指定の場合はfalse
  header=true,         -- ヘッダ行の有無。未指定の場合はfalse
  field_delimiter=','  -- 区切り文字を文字列として指定
  ) AS
  SELECT *
  FROM `myproject.mydataset.mytable`
  WHERE SUBSTR(d_date, 1, 7) = x# storesのX番目の値を取り出す
  GROUP BY d_date;


  SET x = ADD_MONTHS(x, 1);
END WHILE;