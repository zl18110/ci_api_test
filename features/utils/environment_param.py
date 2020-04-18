# -*- coding: utf-8 -*-
import requests
import sys
import json
from features.steps.constant import *
from features.conf.config import CI_ENV, CI_OD_SYS,CI_SUP
from features.db.db_helper import database


def get_code():
    query_sql = u"select mock_code from jdcustomerstest.cus_mock where uid = 2638122  order by id desc limit 1;"
    sql_result, sql_amount = database.run_sql(query_sql)
    print('mock_code is :', sql_result[0]['mock_code'])
    return sql_result[0]['mock_code']


def get_access_token(context):
    url = str("{protocol}://{host}") + eval('login_url')
    url = url.format(protocol=CI_ENV['CI_PROTOCOL'], host=CI_ENV['CI_HOST'])

    print('api url is:', url)
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
        print('fcwc_user is :',result)
        return result


# 订单系统登录获取cookie
def get_login_cookie(context):
    url = str("{protocol}://{host}") + eval('od_login_url')
    url = url.format(protocol=context.config.userdata.get("protocol", CI_OD_SYS['CI_PROTOCOL']),
                     host=context.config.userdata.get("host", CI_OD_SYS['CI_HOST']))

    print('od_login_url is:', url)
    headers = {
        'Content-Type': 'application/json',
        'Connection': 'keep-alive'
    }
    res = requests.get(url, headers=headers, allow_redirects=False)
    if res.status_code != 200:
        print("Got error: " + res.text)
        print("res.status_code: ", res.status_code)
        print("res.headers: ", res.headers)
        sys.exit(-1)
    else:
        resjson = json.loads(res.text)
        re = {'cookie': res.cookies, 'clientToken': resjson['clientToken']}
        print('this  cookie is:', re['cookie'])
        print('this  clientToken is:', re['clientToken'])
        return re


# 商户B端登录
def get_shop_token():
    url = str("{protocol}://{host}") + eval('shop_login_url')
    url = url.format(protocol=CI_SUP['CI_PROTOCOL'],
                     host=CI_SUP['CI_HOST'])

    print('shop_login_url is:', url)
    param = {
        "areaCode": "86",
        "code": "1707",
        "phone": "13099951707"
    }
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        'Connection': 'keep-alive'
    }
    res = requests.post(url, data=param, headers=headers, allow_redirects=False)
    if res.status_code != 200:
        print("Got error: " + res.text)
        print("res.status_code: ", res.status_code)
        print("res.headers: ", res.headers)
        sys.exit(-1)
    else:
        result = json.loads(res.text)
        re = {'accessToken': result['data']['account']['accessToken'], 'uuid': result['data']['account']['uid']}
        print('accessToken and uid is:', re)
        return re


def get_phoneX():
    query_sql = u"select orders_sn,phoneX,subs_id FROM ordertest.od_orders_user WHERE  phoneX <>'' or subs_id <>'' ;"
    sql_result, sql_amount = database.run_sql(query_sql)
    print('未解绑手机号虚拟号订单：',sql_result)
    return sql_result


def get_axn_bind():
    query_sql = u"select phone_a,phone_x,subs_id FROM jdcustomerstest.axn_bind ;"
    sql_result, sql_amount = database.run_sql(query_sql)
    print('未解释放手机号：', sql_result)
    return sql_result


def order_unbind_axn(orderSn):
    url = str("{protocol}://{host}") + eval('order_unbind_Axn_url')
    url = url.format(protocol=CI_ENV['CI_PROTOCOL'], host=CI_ENV['CI_HOST'])

    print('order_unbind_Axn_url is:', url)
    param = {
        "orderSn": orderSn
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
        print('已解绑手机虚拟号订单:', orderSn)


def unbindX(phone_a,phone_x,subs_id):
    url = str("{protocol}://{host}") + eval('unbind_Axn_url')
    url = url.format(protocol=CI_ENV['CI_PROTOCOL'], host=CI_ENV['CI_HOST'])

    print('order_unbind_Axn_url is:', url)
    param = {
            "phoneX": phone_x,
            "subsId": subs_id
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
        print('已解绑手机号:', (phone_a,phone_x))
        return True


def releaseSecretNo(phone_a,phone_x):
    url = str("{protocol}://{host}") + eval('release_SecretNo_url')
    url = url.format(protocol=CI_ENV['CI_PROTOCOL'], host=CI_ENV['CI_HOST'])

    print('order_unbind_Axn_url is:', url)
    param = {
        "phoneX": phone_x
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
        print('已释放手机号:', (phone_a, phone_x))
        return True


if __name__ == '__main__':
    get_shop_token()