#インプットファイルからデータを取得してピボットフレーム作成＆グラフ表示する方法とアウトプットCSVの作成方法
import pandas as pd

df = pd.read_csv('./~.csv')

df['ymd'] = pd.to_datetime(df['ymd'])

df = df.groupby(["ymd", "cd"]).agg({"mail":"sum"}).reset_index()

df_pivot = df.pivot_table(index=["ymd"], columns="cd", values="mail")

df_pivot

df_pivot.plot()

#アプトプットファイル
df_pivot.to_csv("output.csv")