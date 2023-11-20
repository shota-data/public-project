# 株式予測の移動平均とヒストグラムの求め方
# 必要ライブラリをインポートする
import pandas as pd
from pandas import Series,DataFrame
import numpy as np
# 可視化ライブラリ
import matplotlib.pyplot as plt
import seaborn as sns# 罫線
sns.set_style('whitegrid')
#pickleファイルで必要なデータを一括保存
#pickleはPythonオブジェクトの直列化（シリアライズ）や非直列化（デシリアライズ）を扱うライブラリ
import pickle
# Pythonで日付と時刻を扱うモジュール
from datetime import datetime

## pklファイルより株価データを取得
# 証券コード(GOOG(Google))と同じ変数名 | 2022年4月から23年の4月まで
with open('ファイル名.pkl', 'br') as f:
    GOOG = pickle.load(f)
## describeで各列の要約統計量（平均、標準偏差など）取得
GOOG.describe()

#情報の出力
GOOG.info()

# 終値時系列をプロット
GOOG['adjClose'].plot(legend=True, figsize=(10, 4))
# 1日に取引が成立した株の数をプロット
GOOG['volume'].plot(legend=True, figsize=(10, 4))


## 間隔ごとに移動平均を取得
ma_day = [10, 20, 50]

for ma in ma_day:
    column_name = f"MA {ma}"
    GOOG[column_name] = GOOG['adjClose'].rolling(ma).mean()
    
GOOG[['adjClose','MA 10','MA 20','MA 50']].plot(figsize=(10, 4))

## pct_changeを使うと変化の割合を算出
GOOG['daily'] = GOOG['adjClose'].pct_change()

## 日ごとの株式市場の変化率
GOOG['daily'].plot(figsize=(16, 9),#HDサイズのグラフ(1920×1080)が作りたかったら、figsizeを(16, 9)、dpiを120
                          legend=True,
                          linestyle='--'#折れ線グラフをイメージ,
                          marker='v')# 35種類のマーカーが使用可能

## 前日パーセンテージのヒストグラム
GOOG['daily'].hist(bins=100)

sns.histplot(GOOG['daily'],
             bins=100,
             kde=True,#カーネル密度推定グラフ / ガウス分布
             #実績データをサンプルとして、実績のない値の確率を導き出す手法
             color='purple')
