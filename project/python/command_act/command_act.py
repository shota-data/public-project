import sys
import pandas as pd

file1(変数)=sys.argv[1]

file2(変数)=sys.argv[2] 
str_file2(変数)=str(file2)

file3(変数) = "file_{}.txt".format(str_file2(変数))
file3(変数) = "file_{}.txt".format(str_file2(変数))

out_path(変数)='./[0]'.format(file3(変数))

df_a(変数) = pd.read_json(JSONファイル)
df_b(変数) = pd.read_json(JSONファイル)

if 'カラム名' not in df_a(変数).columns 
  df_a(変数)['カラム名'] = None
else:
  pandas.merge(left, right, how=’inner’, on=None, left_on=None, right_on=None, left_index=False, right_index=False, sort=False, suffixes=(‘_x’, ‘_y’), copy=True, indicator=False, validate=None).drop(columns='colmun_name')

df_a.loc=[df_v['カラム名'].isnull() 'カラム名'] = df_a[カラム名2]

str.strip() 