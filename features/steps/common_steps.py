# -*- coding: utf-8 -*-
"""
@author: Shenping
"""
import inspect
import os, time
import subprocess

from behave import given  # @UnresolvedImport
from behave import use_step_matcher
from simplejson import JSONDecodeError
from urllib.parse import urlencode

from features.conf.config import *
from features.db.db_mapping import *
from features.utils.http_req import *
from features.utils.json_recur_check import *
from features.utils.environment_param import *
from features.steps.constant import *

# =========================================================================
# 're'(Regular Expression Matcher)
# =========================================================================

use_step_matcher("re")


@given(u'(?:.*等待"(?P<sleep_time>.*)"[秒]?.*)')
def sleep_time(context, sleep_time=1.0):
    time.sleep(float(sleep_time))


@given(u'(?:.*[请求|访问].*"(?P<api_url_bef>.*)"接口.*)')
def send_request(context, api_url_bef):
    context.params = eval(context.text) if context.text else None
    host = context.params.get("host", "")
    protocol = context.params.get("protocol", "http")
    evn = context.params.get("evn", "")
    evn_list = ['CI_AUCTION','CI_NEWAPI','CI_RNAPI','CI_SUP','CI_OP','CI_CENTER','CI_ENV']
    if not host:
        if evn:
            for this_evn in evn_list:
                if evn == this_evn:
                    host = eval(this_evn)['CI_HOST']
                    protocol = eval(this_evn)['CI_PROTOCOL']
        else:
            host = CI_ENV['CI_HOST']
            protocol = CI_ENV['CI_PROTOCOL']

    api_url = str("{protocol}://{host}") + eval(api_url_bef)
    api_url = api_url.format(protocol=protocol, host=host) + context.params.get("link_url", "")
    print("api_url is :", api_url)
    http_method = context.params.get("http_method", "")
    url_params = context.params.get("url_params", {})
    headers = {}
    if 'headers' in context.params:
        headers = context.params.get('headers', {})

    if 'Content-Type' not in headers or headers['Content-Type'] == "":
        headers['Content-Type'] = 'application/json'

    if evn == 'CI_SUP' or evn == 'CI_SHARE':
        headers['userToken'] = context.shop_token
        if 'Content-Type' not in headers or headers['Content-Type'] == "":
            headers['Content-Type'] = 'application/x-www-form-urlencoded; charset=utf-8'
    else:
        headers['userToken'] = context.token

    headers['User-Agent'] = 'jadeking/76021 CFNetwork/1121.2.2 Darwin/19.3.0'
    print('headers is :', headers)
    print('url_params is :', url_params)
    if http_method == 'post':
        if headers['Content-Type'] == 'application/x-www-form-urlencoded; charset=utf-8':
            url_params = urlencode(url_params)
        else:
            url_params = json.dumps(url_params)
        my_request = Request(api_url, data=url_params,json=url_params, headers=headers, method=http_method)
    else:
        my_request = Request(api_url, params=url_params, data=url_params, headers=headers,
                             method=http_method if not http_method == '' else 'get')

    context.response = my_request.send_request()
    body = context.response.get("body")

    try:
        body = body.replace("\n", "").replace("\r", "")
        context.body = simplejson.loads(body, encoding='utf-8')
    except Exception as e:
        print("[WARN]Response body is not json:", e)
        context.body = body


@given(u'验证接口返回的总条数为expect_api_num')
def get_api_amount(context, expect_api_num):
    if isinstance(context.body, list):
        context.api_num = len(context.body)
    else:
        context.api_num = 1
    print("context.api_num :", context.api_num)
    assert_that(context.api_num, equal_to(int(expect_api_num)))


# 预期结果在接口返回里全部匹配到
@given(u'(?:.*[验证|检查]接口.*返回值.*)')
def assert_data(context):
    text = context.text.replace("\n", "").replace("\r", "").replace("\\","")
    try:
        context.expect_params = simplejson.loads(text, encoding='utf-8')
    except JSONDecodeError as e:

        print("\n WARN: expect_params is not json", e)
        context.expect_params = eval(text)

    print("\n context.expect_params is: ", context.expect_params)
    print("\n context.body is: ", context.body)
    check_json_data(context.expect_params, context.body)


@given(u'(?:.*失败.*[服务器|接口].*错误信息为"(?P<return_message>.*)")')
def assert_return_message(context, return_message):
    print(return_message)
    if isinstance(context.body, list):
        for context.body_instance in context.body:
            assert_that(context.body_instance['message'], is_(return_message))
    else:
        assert_that((context.body['message']), is_(return_message))


@given(u'(?:.*[服务器|接口].*返回码.*"(?P<error_code>\d{3})".*)')
def assert_error_code(context, error_code):
    assert_that(str(context.response.get("http_status")), is_(error_code))


def get_class_name_by_table_name(table_name, source):
    clsmembers = inspect.getmembers(sys.modules["features.db.db_mapping"], inspect.isclass)
    for cls in clsmembers:
        if 'mysql' == source:  # rds的
            # 若（类的table属性等于table_name 且 没有db属性） 或  就是类本身，则返回该类名
            if (table_name == cls[1]().__dict__['table']and 'db' not in cls[1]().__dict__.keys()) or table_name==cls[0]:
                return cls[0]
    return None


@given(u'(?:.*添加测试数据"(?P<class_name>.*)".*)')
def fake_test_data(context, class_name):
    params = eval(context.text) if context.text else None
    class_name = get_class_name_by_table_name(class_name, 'mysql')
    object_data = eval(class_name + ('(**params)' if params else '()'))
    try:
        object_data.insert_test_record()
    except Exception as e:
        print("+++++++++++++++++++++++++++++Faking Data+++++++++++++++++++++++++++++\n")
        print("mock data can't be inserted " + str(e))


@given(u'(?:.*使用逻辑"(?P<logic>.*)".*查询数据库.*"(?P<table>.*)".*)')
def then_impl_2(context, logic, table):
    context.sql_params = eval(context.text)
    query_sql = "select * from %s %s order by id" % (table, build_sql_condition(context.sql_params, logic))
    print("query sql is :\n", query_sql)
    context.sql_result, context.sql_amount = database.run_sql(query_sql)


@given(u'(?:.*数据表"(?P<table>.*)".*使用逻辑"(?P<logic>.*)".*查询最新记录字段"(?P<column_name>.*)".*)')
def select_column(context, logic, table, column_name):
    context.sql_params = eval(context.text)
    query_sql = u"select * from %s %s order by id desc limit 1" % (
        table, build_sql_condition(context.sql_params, logic))
    print("query sql is :", query_sql)
    context.sql_result, context.sql_amount = database.run_sql(query_sql)
    context.column_result = context.sql_result[0][column_name]
    print('column_result is ', context.column_result)


@given(u'(?:.*数据表"(?P<table>.*)".*使用逻辑"(?P<logic>.*)".*按字段"(?P<column_name>.*)"排序.*查询最新记录.*)')
def select_column(context, logic, table,column_name):
    context.sql_params = eval(context.text)
    query_sql = u"select * from %s  %s order by %s desc limit 1" % (
        table, build_sql_condition(context.sql_params, logic),column_name)
    print("query sql is :", query_sql)
    context.sql_result, context.sql_amount = database.run_sql(query_sql)
    context.column_result = context.sql_result[0]
    print('column_result is ', context.column_result)


@given(u'(?:.*根据.*参数查询数据库.*"(?P<table>.*)".*)')
def then_impl(context, table):
    then_impl_2(context, "and", table)


@given(u'(?:.*[验证|检查]数据库.*条数.*"(?P<given_num>\d+)")')
def when_impl(context, given_num):
    assert_that(int(context.sql_amount), equal_to(int(given_num)))


@given(u'(?:.*[验证|检查]数据库.*返回值.*)')
def assert_data(context):
    context.expect_params = eval(context.text)
    print("context.expect_params: \n", context.expect_params)
    print("context.sql_result: \n", context.sql_result)
    check_json_data(context.expect_params, context.sql_result)


@given(u'验证接口返回的条数中"(?P<column_name>.*)"与数据库条数一致')
def get_api_amount(context,column_name):
    context.api_amount = len(context.body[column_name])
    print("context.api_amount :", context.api_amount)
    assert_that(int(context.api_amount), equal_to(context.sql_amount))


@given(u'(?:.*运行以下sql.*)')
def then_impl(context):
    print('context.text is ：', context.text)
    sql = eval(context.text)
    print("sql is ;", sql)
    context.sql_result, context.sql_amount = database.run_sql(sql)


def get_table_name_by_class_name(class_name):
    clsmembers = inspect.getmembers(sys.modules["features.db.db_mapping"], inspect.isclass)
    for cls in clsmembers:
        if class_name == cls[0]:  # 若class_name是类名，则返回数据库表名
            return cls[1]().__dict__["table"]
    return class_name


@given(u'(?:.*删除测试数据"(?P<class_name>.*)".*)')
def del_test_data(context, class_name):
    params = eval(context.text) if context.text else None
    table_name = get_table_name_by_class_name(class_name)
    class_name = table_name if table_name else class_name
    for key, value in params.items():
        delete_history_records(class_name, key, str(value))


# 按子查询删除测试数据：如bd 传入： in ,not in 等等
@given(u'(?:.*使用逻辑"(?P<bd>.*)"子查询结果delete测试数据"(?P<class_name>.*)".*)')
def del_data_boundary(context,bd,class_name):
    params = eval(context.text) if context.text else None
    table_name = get_table_name_by_class_name(class_name)
    class_name = table_name if table_name else class_name
    delete_records_boundary(class_name, params,bd)


@given(u'(?:.*[请求|访问].*"(?P<api_url_bef>.*)"后台接口.*)')
def send_request(context, api_url_bef):
    context.params = eval(context.text) if context.text else None
    host = context.params.get("host", "")
    protocol = context.params.get("protocol", "")
    if not host:
        host = context.config.userdata.get("host", CI_OD_SYS['CI_HOST'])
    if not protocol:
        protocol = context.config.userdata.get("protocol", CI_OD_SYS['CI_PROTOCOL'])
    api_url = str("{protocol}://{host}") + eval(api_url_bef)
    api_url = api_url.format(protocol=protocol, host=host) + context.params.get("link_url", "")
    http_method = context.params.get("http_method", "")
    headers = {}
    if 'headers' in context.params:
        headers = context.params.get('headers', {})

    if 'Content-Type' not in headers or headers['Content-Type'] == "":
        headers['Content-Type'] = 'application/json'

    url_params = context.params.get("url_params", {})
    url_params['clientToken'] = context.clientToken
    print("api_url is :", api_url)
    print('headers is :', headers)
    print('url_params is :', url_params)
    print('\n\n\n\n')
    if http_method == 'get':
        context.response = requests.get(api_url, params=url_params, data=url_params, headers=headers,
                                        cookies=context.cookie,verify=False,allow_redirects=False)
    else:
        context.response = requests.post(api_url, data=url_params, headers=headers, allow_redirects=False,
                                         cookies=context.cookie, verify=False)
    print("Status: ", context.response.status_code)
    body = context.response.text
    try:
        body = body.replace("\n", "").replace("\r", "")
        context.body = simplejson.loads(body, encoding='utf-8')
    except Exception as e:
        print("[WARN]Response body is not json:", e)
        context.body = body


@given(u'解绑订单手机号虚拟号')
def order_unbind_phone(context):
    context.params = eval(context.text) if context.text else None
    orders_sn = context.params.get("orders_sn")
    order_unbind_axn(orders_sn)
