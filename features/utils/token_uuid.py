# -*- coding: utf-8 -*-
import requests
import sys
import json
from features.steps.constant import *
from features.conf.config import CI_ENV, CI_OD_SYS
from features.db.db_helper import database


def get_code():
    query_sql = u"select mock_code from jdcustomerstest.cus_mock where uid = 2638122  order by id desc limit 1;"
    sql_result, sql_amount = database.run_sql(query_sql)
    print('mock_code is :', sql_result[0]['mock_code'])
    return sql_result[0]['mock_code']


def get_access_token(context):
    url = eval('login_url') % (context.config.userdata.get("protocol", CI_ENV['CI_PROTOCOL']),
                               context.config.userdata.get("host", CI_ENV['CI_HOST']))
    print(' api url is:', url)
    code = 1
    try:
        code = get_code()
    except Exception as e:
        print(e)
    param = {
        "code": code,
        "deviceIDFA": "358240051111110",
        "deviceId": "7CF07942BCC92F16AB055D93218BCE00",
        "loginIp": "172.16.0.99",
        "mobile": 12888886303,
        "pars": {},
        "region": 86,
        "type": "0"
    }
    headers = {
        'Content-Type': 'application/json',
        'Connection': 'keep-alive'
    }
    res = requests.post(url, data=json.dumps(param), headers=headers, allow_redirects=False)
    if res.status_code != 200:
        print("Got error: " + res.text)
        print("res.status_code: ", res.status_code)
        print("res.headers: ", res.headers)
        sys.exit(-1)
    else:
        result = json.loads(res.text)
        re = {'accessToken': result['data']['accessToken'], 'uuid': result['data']['uid']}
        print('accessToken and uid is:',re)
        return re


def get_login_cookie(context):
    url = eval('od_login_url') % (context.config.userdata.get("protocol", CI_OD_SYS['CI_PROTOCOL']),
                                  context.config.userdata.get("host", CI_OD_SYS['CI_HOST']))
    print(' od_login_url is:', url)
    headers = {
        'Content-Type': 'application/json',
        'Connection': 'keep-alive'
    }
    res = requests.get(url, headers=headers, allow_redirects=False)
    print('res is ',res)
    if res.status_code != 200:
        print("Got error: " + res.text)
        print("res.status_code: ", res.status_code)
        print("res.headers: ", res.headers)
        sys.exit(-1)
    else:
        resjson = json.loads(res.text)
        re = {'cookie': res.cookies,'clientToken':resjson['clientToken']}
        print('this  cookie is:',re['cookie'])
        print('this  clientToken is:', re['clientToken'])
        return re
