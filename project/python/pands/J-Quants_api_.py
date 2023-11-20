## APIで取得する方法
# J-Quants APIに登録
# 無料プランはデータ提供期間が過去2年分[12週間遅延]
# リフレッシュトークンとIDトークンの取得と株価データ取得
# リフレッシュトークンを取得するPythonコード
# リフレッシュトークン取得
import requests
import json
import pandas as pd

# 登録したメールアドレス、パスワードを設定
# EMAIL_ADDRESSに登録メールアドレス、PASSWORDにパスワードを入力
mail_password={"mailaddress":"EMAIL_ADDRESS", "password":"PASSWORD"}

# リフレッシュトークン取得
r_ref = requests.post("https://api.jquants.com/v1/token/auth_user", data=json.dumps(mail_password))

# リフレッシュトークン取得の表示
print(r_ref.json())

# 受け取ったリフレッシュトークンを設定
RefreshToken = r_ref.json()["refreshToken"]

# IDトークン取得
r_token = requests.post(f"https://api.jquants.com/v1/token/auth_refresh?refreshtoken={RefreshToken}")

# IDトークン表示
print(r_token.json())

# 取得したIDトークンを設定
idToken = r_token.json()["idToken"]
headers = {'Authorization': 'Bearer {}'.format(idToken)}

# 銘柄コード、期間を指定
code_ = "8697" 
from_ = "2022-12-01"
to_ = "2023-02-28"

# 株価四本値の取得
re_daily_OHLCV = requests.get(f"https://api.jquants.com/v1/prices/daily_quotes?code={code_}&from={from_}&to={to_}", headers=headers)

# pandasデータフレームに変換
df_daily_OHLCV = pd.DataFrame(re_daily_OHLCV.json()["daily_quotes"])

# 'Date'をdatetime型へ変換
df_daily_OHLCV['Date'] = pd.to_datetime(df_daily_OHLCV['Date'])