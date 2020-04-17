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


def check_dict(expected, real, msg=""):
    ret, msg = "", msg
    if not expected:
        if not real:
            ret = True
            return ret,msg
        else:
            ret = False
            msg = "expecte data is (%s)\nbut real data is (%s)"%(str(expected),str(real))
            return ret,msg
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
        ret, msg = (edata == rdata) and (True, "") or (False, "Expect value: %s != Real value : %s" % (str(edata), str(rdata)))
    return ret, msg


def check_json_data(expected_data, real_data, msg=""):
    ret, msg = check_data(expected_data, real_data, msg)
    assert_that(ret, msg)


if __name__ == "__main__":
     ls1=[{
          'pid': 0,
          'orders_uid': 2638265,
          'orders_add_user': 90,
          'orders_star': 0,
          'app_show': 1,
          'is_delete': 0,
          'orders_type': 16,
          'total_price': Decimal('100.00'),
          'discount_price': Decimal('0.00'),
          'member_discount': Decimal('0.00'),
          'discount_goods_price': Decimal('0.00'),
          'actual_price': Decimal('100.00'),
          'coin': 0,
          'status': 1,
          'paid_money': Decimal('0.00'),
          'extra': '{"rewards_on":1}',
          'job_number': None,
          'referrer_id': 0,
          'is_vip': 0,
          'del_state': 0,
          'is_mock': 0,
          'asyn': 'Y',
          'good_sn': None,
          'live_member_id': None,
          'server_id': None,
          'orders_refundtime': None,
          'source_sign': None,
          'item_sum': Decimal('100.00'),
          'pay_money': '0',
          'clear': '5',
          'asyn_remark': None,
          'is_dbzc': None,
          'goods_id': 401,
          'r_cancellation': None,
          'platform': None,
          'activityId': 0,
          'group_id': 0,
          'refund_flg': None
      }]
     ls2 =[{
            'id': 14663,
            'pid': 0,
            'orders_sn': 'YK204011147364568894',
            'orders_uid': 2638265,
            'orders_add_user': 90,
            'orders_createtime': datetime.datetime(2020, 4, 1, 11, 47, 36),
            'orders_uptime': datetime.datetime(2020, 4, 1, 11, 47, 36),
            'orders_paytime': datetime.datetime(2020, 4, 1, 11, 47, 36),
            'orders_star': 0,
            'app_show': 1,
            'is_delete': 0,
            'orders_type': 16,
            'total_price': Decimal('100.00'),
            'discount_price': Decimal('0.00'),
            'member_discount': Decimal('0.00'),
            'discount_goods_price': Decimal('0.00'),
            'actual_price': Decimal('100.00'),
            'coin': 0,
            'status': 1,
            'paid_money': Decimal('0.00'),
            'extra': '{"rewards_on":1}',
            'job_number': None,
            'referrer_id': 0,
            'is_vip': 0,
            'del_state': 0,
            'is_mock': 0,
            'asyn': 'Y',
            'unique_sequence': '14663',
            'good_sn': None,
            'live_member_id': None,
            'server_id': None,
            'orders_refundtime': None,
            'source_sign': None,
            'item_sum': Decimal('100.00'),
            'pay_money': '0',
            'clear': '5',
            'asyn_remark': None,
            'is_dbzc': None,
            'goods_id': 401,
            'r_cancellation': None,
            'platform': None,
            'activityId': 0,
            'group_id': 0,
            'refund_flg': None
        }]
     print(check_json_data(ls1,ls2))