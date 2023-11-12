# name
embulk db

## Overview
シンボリックリンクにしてDBファイルを一括する方法
yamlファイルに全て記載する方法も可能

・modeについて
embulkにはupsert機能が存在しない

mode という部分は insert、insert_direct, truncate_insert, merge, merge_direct, replace も選択することが可能。

mode	挙動
insert	書込み（PRIMARY制約に引っかかると、全部失敗）
insert_direct	書込み（PRIMARY制約に引っかかると、全部失敗）
truncate_insert	置き換え、テーブル定義は変わらない
merge	上書き更新、追加
merge_direct	上書き更新、追加
replace	置き換え、テーブル定義は変更できる、　config.ymlの定義次第

注意点
embulkではdatatimeがないので
timestampになる

## Requirement
embulk,yaml

## document
参考：https://qiita.com/tashiro_gaku/items/f7fa0f1a99c759d947a7