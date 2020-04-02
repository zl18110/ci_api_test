# -*- coding: utf-8 -*-

import importlib,sys

from behave.contrib.scenario_autoretry import patch_scenario_with_autoretry
from features.conf import config
from features.utils.token_uuid import *


def before_all(context):
    importlib.reload(sys)
    c_res = get_access_token(context)
    context.token = c_res['accessToken']
    context.uuid = c_res['uuid']
    od_res = get_login_cookie(context)
    context.cookie = od_res['cookie']
    context.clientToken = od_res['clientToken']


def before_feature(context,feature):
    if config.RETRY:
        for scenario in feature.scenarios:
            patch_scenario_with_autoretry(
                scenario,
                max_attempts=config.MAX_RETRY)  # 用例级别重试机制，MAX_RETRY重试次数
