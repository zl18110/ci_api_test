# -*- coding: utf-8 -*-

'''
@author: shenping
'''
from .db_helper import *



class Ordertest(orm_helper):
    def __init__(self, **param):
        self.table = "od_orders"
        self.id = param.get("id", '13680')
        self.pid = param.get("pid", '0')
        self.orders_sn = param.get("orders_sn", "YK203241122476609999")
        self.orders_uid = param.get("orders_uid", "2638122")
        self.orders_add_user = param.get("orders_add_user","90")
        self.orders_createtime = param.get("orders_createtime","2020-03-24 11:00:00")
        self.orders_uptime = param.get("orders_uptime","2020-03-24 11:00:00")
        self.orders_paytime = param.get("orders_paytime","2020-03-24 11:00:01")
        self.orders_star = param.get("orders_star","0")
        self.app_show = param.get("app_show","1")
        self.is_delete = param.get("is_delete","0")
        self.orders_type = param.get("orders_type","16")
        self.total_price = param.get("total_price","99")
        self.discount_price = param.get("discount_price","0")
        self.member_discount = param.get("member_discount","0")
        self.discount_goods_price = param.get("discount_goods_price","0")
        self.actual_price = param.get("actual_price","99")
        self.coin = param.get("coin","0")
        self.status = param.get("status","3")
        self.paid_money = param.get("paid_money","0")
        self.extra = param.get("extra",'{"rewards":1}')
        self.job_number = param.get("job_number","")
        self.referrer_id = param.get("referrer_id","0")
        self.is_vip = param.get("is_vip","0")
        self.del_state = param.get("del_state","0")
        self.is_mock = param.get("is_mock","0")
        self.asyn = param.get("asyn","Y")
        self.unique_sequence = param.get("unique_sequence","333333")
        self.goods_sn = param.get("goods_sn","")
        self.live_member_id = param.get("live_member_id","")
        self.server_id = param.get("server_id","")
        self.orders_refundtime = param.get("orders_refundtime","")
        self.source_sign = param.get("source_sign","")
        self.item_sum = param.get("item_sum","99")
        self.pay_money = param.get("pay_money","0")
        self.clear = param.get("clear","5")
        self.asyn_remark = param.get("asyn_remark","")
        self.is_dbzc = param.get("is_dbzc","0")
        self.goods_id = param.get("goods_id","313")
        self.r_cancellation = param.get("r_cancellation","")
        self.platform = param.get("platform","")
        self.activityId = param.get("activityId","0")
        self.group_id = param.get("group_id","0")


















