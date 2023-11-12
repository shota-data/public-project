# ===========================================
# CDF上で実行するPythonコード
# ==========================================
def transform(record, emitter, context):
    
    # 現行データ出力
    emitter.emit(record)
    
    # b最新月と同月分追加して出力
    last_a_month = context.getArguments().get(str('date_month'))
    a_year = int(last_a_month[0:4])

    last_b_month = context.getArguments().get(str('date_month'))
    b_year = int(last_b_month[0:4])
    
  if (record['c_month'] == last_a_month):
    for year in range(a_year,b_year + 1):
      for month in range(1,13):
        m = "%d-%02d" % (year,month)
        if m > last_a_month and m <= last_b_month:
          record['c_month'] = m
          emitter.emit(record)