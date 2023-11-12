-- カラム型の出力
SELECT COLUMN_NAME, data_type
FROM `PJ`.データセット.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = "a"
