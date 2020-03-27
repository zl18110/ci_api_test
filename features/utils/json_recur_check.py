# -*- coding: utf-8 -*-
from decimal import *
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
        msg = "Expect Data: %s, but  Real data is: %s" % (str(expected), str(real))
    return result, msg


def check_dict(expected, real, msg=""):
    ret, msg = "", msg
    for key in expected:
        assert_that(real, has_key(key))
        edata = retrive_data(expected[key])
        rdata = retrive_data(real[key])
        ret, msg = check_data(edata, rdata, msg = "Key: %s" % key)
        if not ret: # 只要有一个值没匹配到就返回失败
            msg = "Key[%s]: expecte data is (%s), but real data is (%s)" % (key, str(edata),str(rdata))
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
        ret, msg = (edata == rdata) and (True, "") or (False, "edata: %s != rdata: %s" % (str(edata), str(rdata)))
    return ret, msg


def check_json_data(expected_data, real_data, msg=""):
    ret, msg = check_data(expected_data, real_data, msg)
    print(ret, msg)
    assert_that(ret, msg)


if __name__ == "__main__":
    l1={
          "cacheType": "none",
          "code": 0,
          "data": [{
              "code": "82",
              "id": 15,
              "region": "韩国"
          }, {
              "code": "31",
              "id": 28,
              "region": "荷兰"
          }, {
              "code": "1",
              "id": 27,
              "region": "加拿大"
          }, {
              "code": "39",
              "id": 26,
              "region": "意大利"
          }, {
              "code": "358",
              "id": 25,
              "region": "芬兰"
          }, {
              "code": "413",
              "id": 23,
              "region": "智利"
          }, {
              "code": "855",
              "id": 22,
              "region": "柬埔寨"
          }, {
              "code": "244",
              "id": 21,
              "region": "安哥拉"
          }, {
              "code": "351",
              "id": 20,
              "region": "葡萄牙"
          }, {
              "code": "49",
              "id": 19,
              "region": "德国"
          }, {
              "code": "55",
              "id": 18,
              "region": "巴西"
          }, {
              "code": "66",
              "id": 17,
              "region": "泰国"
          }, {
              "code": "34",
              "id": 16,
              "region": "西班牙"
          }, {
              "code": "33",
              "id": 14,
              "region": "法国"
          }, {
              "code": "94",
              "id": 13,
              "region": "斯里兰卡"
          }, {
              "code": "47",
              "id": 12,
              "region": "挪威"
          }, {
              "code": "95",
              "id": 11,
              "region": "缅甸"
          }, {
              "code": "61",
              "id": 10,
              "region": "澳大利亚"
          }, {
              "code": "44",
              "id": 9,
              "region": "英国"
          }, {
              "code": "81",
              "id": 7,
              "region": "日本"
          }, {
              "code": "60",
              "id": 5,
              "region": "马来西亚"
          }, {
              "code": "1",
              "id": 4,
              "region": "美国"
          }, {
              "code": "65",
              "id": 3,
              "region": "新加坡"
          }, {
              "code": "64",
              "id": 24,
              "region": "新西兰"
          }, {
              "code": "886",
              "id": 8,
              "region": "中国台湾"
          }, {
              "code": "853",
              "id": 6,
              "region": "中国澳门"
          }, {
              "code": "852",
              "id": 2,
              "region": "中国香港"
          }, {
              "code": "86",
              "id": 1,
              "region": "中国大陆"
          }],
        "displayAlert": "true",
        "message": "获取区域编码成功",
          "msg": "获取区域编码成功",
          "status": 0
        }
    l2= {
            "cacheType": "none",
            "code": 0,
            "data": [{
                "code": "82",
                "id": 15,
                "region": "韩国"
            }, {
                "code": "31",
                "id": 28,
                "region": "荷兰"
            }, {
                "code": "1",
                "id": 27,
                "region": "加拿大"
            }, {
                "code": "39",
                "id": 26,
                "region": "意大利"
            }, {
                "code": "358",
                "id": 25,
                "region": "芬兰"
            }, {
                "code": "413",
                "id": 23,
                "region": "智利"
            }, {
                "code": "855",
                "id": 22,
                "region": "柬埔寨"
            }, {
                "code": "244",
                "id": 21,
                "region": "安哥拉"
            }, {
                "code": "351",
                "id": 20,
                "region": "葡萄牙"
            }, {
                "code": "49",
                "id": 19,
                "region": "德国"
            }, {
                "code": "55",
                "id": 18,
                "region": "巴西"
            }, {
                "code": "66",
                "id": 17,
                "region": "泰国"
            }, {
                "code": "34",
                "id": 16,
                "region": "西班牙"
            }, {
                "code": "33",
                "id": 14,
                "region": "法国"
            }, {
                "code": "94",
                "id": 13,
                "region": "斯里兰卡"
            }, {
                "code": "47",
                "id": 12,
                "region": "挪威"
            }, {
                "code": "95",
                "id": 11,
                "region": "缅甸"
            }, {
                "code": "61",
                "id": 10,
                "region": "澳大利亚"
            }, {
                "code": "44",
                "id": 9,
                "region": "英国"
            }, {
                "code": "81",
                "id": 7,
                "region": "日本"
            }, {
                "code": "60",
                "id": 5,
                "region": "马来西亚"
            }, {
                "code": "1",
                "id": 4,
                "region": "美国"
            }, {
                "code": "65",
                "id": 3,
                "region": "新加坡"
            }, {
                "code": "64",
                "id": 24,
                "region": "新西兰"
            }, {
                "code": "886",
                "id": 8,
                "region": "中国台湾"
            }, {
                "code": "853",
                "id": 6,
                "region": "中国澳门"
            }, {
                "code": "852",
                "id": 2,
                "region": "中国香港"
            }, {
                "code": "86",
                "id": 1,
                "region": "中国大陆"
            }],
            "displayAlert": "true",
            "displayTip": "true",
            "hashData": "",
            "info": [{
                "code": "82",
                "id": 15,
                "region": "韩国"
            }, {
                "code": "31",
                "id": 28,
                "region": "荷兰"
            }, {
                "code": "1",
                "id": 27,
                "region": "加拿大"
            }, {
                "code": "39",
                "id": 26,
                "region": "意大利"
            }, {
                "code": "358",
                "id": 25,
                "region": "芬兰"
            }, {
                "code": "413",
                "id": 23,
                "region": "智利"
            }, {
                "code": "855",
                "id": 22,
                "region": "柬埔寨"
            }, {
                "code": "244",
                "id": 21,
                "region": "安哥拉"
            }, {
                "code": "351",
                "id": 20,
                "region": "葡萄牙"
            }, {
                "code": "49",
                "id": 19,
                "region": "德国"
            }, {
                "code": "55",
                "id": 18,
                "region": "巴西"
            }, {
                "code": "66",
                "id": 17,
                "region": "泰国"
            }, {
                "code": "34",
                "id": 16,
                "region": "西班牙"
            }, {
                "code": "33",
                "id": 14,
                "region": "法国"
            }, {
                "code": "94",
                "id": 13,
                "region": "斯里兰卡"
            }, {
                "code": "47",
                "id": 12,
                "region": "挪威"
            }, {
                "code": "95",
                "id": 11,
                "region": "缅甸"
            }, {
                "code": "61",
                "id": 10,
                "region": "澳大利亚"
            }, {
                "code": "44",
                "id": 9,
                "region": "英国"
            }, {
                "code": "81",
                "id": 7,
                "region": "日本"
            }, {
                "code": "60",
                "id": 5,
                "region": "马来西亚"
            }, {
                "code": "1",
                "id": 4,
                "region": "美国"
            }, {
                "code": "65",
                "id": 3,
                "region": "新加坡"
            }, {
                "code": "64",
                "id": 24,
                "region": "新西兰"
            }, {
                "code": "886",
                "id": 8,
                "region": "中国台湾"
            }, {
                "code": "853",
                "id": 6,
                "region": "中国澳门"
            }, {
                "code": "852",
                "id": 2,
                "region": "中国香港"
            }, {
                "code": "86",
                "id": 1,
                "region": "中国大陆"
            }],
            "message": "获取区域编码成功",
            "msg": "获取区域编码成功",
            "status": 0
        }
    check_json_data(l1, l2)
