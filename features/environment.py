# -*- coding: utf-8 -*-

import importlib,sys

from behave.contrib.scenario_autoretry import patch_scenario_with_autoretry
from features.conf import config
from features.utils.token_uuid import *


def before_all(context):
    importlib.reload(sys)
    context.token = get_access_token(context)['accessToken']
    context.uuid = get_access_token(context)['uuid']


def before_feature(context,feature):
    if config.RETRY:
        for scenario in feature.scenarios:
            patch_scenario_with_autoretry(
                scenario,
                max_attempts=config.MAX_RETRY)  # 用例级别重试机制，MAX_RETRY重试次数
