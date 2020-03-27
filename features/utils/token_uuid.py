# -*- coding: utf-8 -*-
import requests
import sys
import json
from features.steps.constant import *
from features.conf.config import CI_ENV
from features.db.db_helper import database


def get_code():
    query_sql = u"select mock_code from jdcustomerstest.cus_mock where uid = 2638265  order by id desc limit 1;"
    sql_result, sql_amount = database.run_sql(query_sql)
    print('this db is ',database)
    print('sql_result is :',sql_result)
    return sql_result


def get_access_token(context):
    url = eval('login_url') % (context.config.userdata.get("protocol", CI_ENV['CI_PROTOCOL']),context.config.userdata.get("host", CI_ENV['CI_HOST']))
    print(' api url is:',url)
    code = get_code()
    param = {
      "code":code,
      "deviceIDFA":"358240051111110",
      "deviceId":"7CF07942BCC92F16AB055D93218BCE00",
      "loginIp":"172.16.0.99",
      "mobile":12888887111,
      "pars":{},
      "region":86,
      "type":"0"
    }
    headers = {
        'Content-Type': 'application/json',
        'Connection':'keep-alive'
    }
    res = requests.post(url, data=json.dumps(param), headers=headers, allow_redirects=False)
    print('this res is ',res.text)
    if res.status_code != 200:
        print("Got error: " + res.text)
        print("res.status_code: ", res.status_code)
        print("res.headers: ", res.headers)
        sys.exit(-1)
    else:
        result = json.loads(res.text)
        res = {}
        print("access_token is :", result['data']['accessToken'])
        print("uuid is :", result['data']['uid'])
        res['accessToken'] = result['data']['accessToken']
        res['uuid'] = result['data']['uid']
        return res