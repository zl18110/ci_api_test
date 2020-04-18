# -*- coding: utf-8 -*-

import importlib,sys

from behave.contrib.scenario_autoretry import patch_scenario_with_autoretry
from features.conf import config
from features.utils.environment_param import *


def before_all(context):
    importlib.reload(sys)
    c_res = get_access_token(context)
    context.token = c_res['data']['accessToken']
    context.uuid = c_res['data']['uid']
    context.fcwcuser = c_res
    od_res = get_login_cookie(context)
    context.cookie = od_res['cookie']
    context.clientToken = od_res['clientToken']
    s_res = get_shop_token()
    context.shop_token = s_res['accessToken']
    context.shop_uid = s_res['uuid']


def before_feature(context,feature):
    if config.RETRY:
        for scenario in feature.scenarios:
            patch_scenario_with_autoretry(
                scenario,
                max_attempts=config.MAX_RETRY)  # 用例级别重试机制，MAX_RETRY重试次数


# 每个场景结束后解绑虚拟手机号，防止用例遗漏
def after_scenario(context,setp):
    sql_result = get_phoneX()
    for res in sql_result:
        order_unbind_axn(res['orders_sn'])

