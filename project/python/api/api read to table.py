import pandas as pd
import requests
import json
from fake_useragent import UserAgent
from google.cloud import bigquery
import csv
import time
from past.builtins import unicode


def hello_pubsub(event, context):

    ua = UserAgent()
    API_KEY = ''
    

    # CSVファイルの行数取得
    count = sum([1 for _ in open('~.csv')])
    # 1回に1000件を上限にファイルを取得
    MAX_COUNT = ~
    # 行の取得開始行
    start = ~
    # 行の取得終了行
    end = MAX_COUNT + start
    df_none_usecols = pd.read_csv('.csv', header=None, usecols=[start, end])

        for row in df_none_usecols:

            BASE_URL = ""
            BASE_URL_second = " "
            headers = {
                'x-access-key': API_KEY,
                'user-agent': ua.chrome
            }
            
            URL = BASE_URL.format(pinpointcode=row[0])
            response = requests.get(URL, headers=headers)
            data = response.json()
            
            URL_p = BASE_URL_p.format(pinpointcode=row[0])
            response_p = requests.get(URL_p, headers=headers)
            po_data = response_p.json()
            
            # Construct a BigQuery client object.
            client = bigquery.Client()
            
            rows_to_insert = [
                {
                    u"": data[""], 
                    u"": data[""],
                    u"": data[""],
                    u"": data[""]
                },
            ]
            time.sleep(0.2)
            errors = client.insert_rows_json('', rows_to_insert)  # Make an API request.
            if errors == []:
                print("add")
            else:
                print("Encountered error : {}".format(errors))