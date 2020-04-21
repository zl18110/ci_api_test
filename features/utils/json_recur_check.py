# -*- coding: utf-8 -*-
from decimal import *

import datetime
from hamcrest import *  # assert_that, instance_of
import ast
import simplejson


# JSON数据递归检查


def retrive_data(data):
    if isinstance(data, str):
        try:
            data = ast.literal_eval(data)
        except Exception:
            pass
    return data


def check_list(expected, real, msg=""):
    result = [False] * len(expected)
    if not (isinstance(expected, list) and isinstance(real, list)):
        msg = "Must Be List"
    else:
        for index, edata in enumerate(expected):
            edata = retrive_data(edata)
            for rdata in real:
                rdata = retrive_data(rdata)
                ret, msg = check_data(edata, rdata, msg)
                # 找到了想要的数据，返回找下一个数据，必须要确保数据中没有完全相同的数据
                if ret:
                    result[index] = True
                    break
    result = all(result)
    if not result:
        msg += "\n Expect Data: %s \n, but  Real data is: %s \n" % (str(expected), str(real))
    return result, msg


def check_list_contain(expected, real, msg=""):
    result = [False] * len(expected)
    if not (isinstance(expected, list) and isinstance(real, list)):
        msg = "Must Be List"
    else:
        for index, edata in enumerate(expected):
            edata = retrive_data(edata)
            for rdata in real:
                rdata = retrive_data(rdata)
                ret, msg = check_data_contain(edata, rdata, msg)
                # 找到了想要的数据，返回找下一个数据，必须要确保数据中没有完全相同的数据
                if ret:
                    result[index] = True
                    break
    result = all(result)
    if not result:
        msg += "\n Expect Data: %s \n, not in   Real data is: %s \n" % (str(expected), str(real))
    return result, msg


def check_dict(expected, real, msg=""):
    ret, msg = "", msg
    if not expected:
        if not real:
            ret = True
            return ret, msg
        else:
            ret = False
            msg = "expecte data is (%s)\nbut real data is (%s)" % (str(expected), str(real))
            return ret, msg
    else:
        for key in expected:
            assert_that(real, has_key(key))
            edata = retrive_data(expected[key])
            rdata = retrive_data(real[key])
            ret, msg = check_data(edata, rdata)
            if not ret:
                msg += "\n Error Key [%s]: \n expecte data is (%s) \n " \
                       "but real data is (%s)\n" % (key, str(edata), str(rdata))
                return ret, msg
    return ret, msg


def check_dict_contain(expected, real, msg=""):
    ret, msg = "", msg
    if not expected:
        if not real:
            ret = True
            return ret, msg
        else:
            ret = False
            msg = "expecte data is (%s) not in\n but real data is (%s)" % (str(expected), str(real))
            return ret, msg
    else:
        for key in expected:
            assert_that(real, has_key(key))
            edata = retrive_data(expected[key])
            rdata = retrive_data(real[key])
            ret, msg = check_data_contain(edata, rdata)
            if not ret:
                msg += "\n Error Key [%s]: \n expecte data is (%s) not in \n  " \
                       " real data is (%s)\n" % (key, str(edata), str(rdata))
                return ret, msg
    return ret, msg


def check_data(edata, rdata, msg=""):
    try:
        edata = ast.literal_eval(edata)
        rdata = ast.literal_eval(rdata)
    except Exception:
        pass
    if isinstance(edata, list):
        ret, msg = check_list(edata, rdata, msg)
    elif isinstance(edata, dict):
        ret, msg = check_dict(edata, rdata, msg)
    else:
        ret, msg = (edata == rdata) and (True, "") or (
            False, "Expect value: %s != Real value : %s" % (str(edata), str(rdata)))
    return ret, msg


def check_data_contain(edata, rdata, msg=""):
    try:
        edata = ast.literal_eval(edata)
        rdata = ast.literal_eval(rdata)
    except Exception:
        pass
    if isinstance(edata, list):
        ret, msg = check_list_contain(edata, rdata, msg)
    elif isinstance(edata, dict):
        ret, msg = check_dict_contain(edata, rdata, msg)
    else:
        if edata:
            ret, msg = (str(edata) in str(rdata) or str(edata) == str(rdata)) and (True, "") or (
                False, "Expect value: %s not in  Real value : %s" % (str(edata), str(rdata)))
        else:
            ret, msg = (True, "ok")
    return ret, msg


def check_json_data(expected_data, real_data, msg=""):
    ret, msg = check_data(expected_data, real_data, msg)
    assert_that(ret, msg)


def check_json_contain(expected_data, real_data, msg=""):
    ret, msg = check_data_contain(expected_data, real_data, msg)
    assert_that(ret, msg)


if __name__ == "__main__":
    import time

    print(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))
