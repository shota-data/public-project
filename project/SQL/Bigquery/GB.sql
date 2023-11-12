-- テーブルのGB計算方法
SELECT table_name, table_shema
(data_length + index_length) /1024/1024/1024 as ALL_GB
FROM informathion.schema.table
table_shema =　"a"
AND  table_name = "b"