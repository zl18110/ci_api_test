#!/usr/bin/env python
# coding=UTF-8
"""
Desc： #本地开发的config配置
Author：shenping
Time：2020-03-09 14:50
"""

db_ordertest = {
    "host": '172.16.0.1',
    "port": 3408,
    "user": 'staff_shenping',
    "passwd": 'kBwxKMgw89Hi2z8a',
    "db": 'odertest',
    "charset": 'utf8'
}

CI_ENV = {
    "CI_HOST": "dev.jaadee.net",
    "CI_PROTOCOL": "http"
}

DOCKERFILE_DIR = '/cidata/dev'
RETRY = False
MAX_RETRY = 0  # scenario级别的重试机制，最大重试次数n。总共执行了1+n次
RETRY_GAP = 5  # 重试间隔，单位秒
BEHAVE_REPORT_DIR = '/cidata/dev/ci_api_test/features/report'  # Behave测试报告路径
