# Created by shenping at 2020/4/3
Feature: 撤销售后申请订单接口测试用例

  Scenario:  [0]测试数据初始化
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638122"}
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_goods where goods_sn ='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_remark where user_remark='ci_api_test';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_user where user_id='2638122';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_goods_lock where goods_sn='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_operator where goods_sn='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_goods_logistics where logistics_sn ='SF000009';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_order_logs where log like '%YK00000401%';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_goods_return where goods_sn = 'YK00000401';"
      """
    * 请求"create_order_url"接口，添加订单
      """
        {'link_url':'',
          'http_method': 'post',
           "url_params":{
              "type": 16,
              "goodsId": 401,
              "addressId": 2235,
              "coin": 0,
              "redId": 0,
              "couponId": 0,
              "num": 1,
              "attr": "",
              "remark": "ci_api_test"
           }
        }
      """
    * 等待"2"秒
    * 数据表"ordertest.od_orders" 使用逻辑"and"查询最新记录字段"orders_sn"
      """
        {"orders_uid":"2638122","goods_id":"401"}
      """
    * 请求"order_alipay_url"接口，支付订单
      """
        {'link_url':'',
          'http_method': 'post',
           "url_params":{
              "subject": (context.column_result),
              "totalAmount": "100.00",
              "ordersSn": (context.column_result),
              "payType": 88
           }
        }
      """
    * 等待"3"秒

    * 使用逻辑"and"查询数据库"ordertest.od_orders_separate_pay"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'goods_sn': 'YK00000401',
            'money': Decimal('100.00'),
            'per_money': Decimal('100.00'),
            'platform_uid': -666,
            'platform_money': Decimal('10.00'),
            'shop_uid': 51,
            'shop_money': Decimal('80.00'),
            'other_uid': 80000,
            'other_money': Decimal('0.50'),
            'referee_money': Decimal('10.00'),
            'referee_a_uid': 2638121,
            'referee_a_money': Decimal('5.00'),
            'referee_b_uid': 2638119,
            'referee_b_money': Decimal('1.50'),
            'referee_mine': 2638122,
            'referee_mine_money': Decimal('1.50'),
            'referee_s_uid': 2638119,
            'referee_s_money': Decimal('1.50'),
            'type': 0,
            'status': 1,
            'del_state': 0,
            'referee_self_money': Decimal('0.00'),
            'referee_self_uid': 0
        }]
      """
    * 数据表"ordertest.od_orders_goods" 使用逻辑"and"查询最新记录字段"id"
      """
        {"orders_sn":(context.column_result),"goods_sn":"YK00000401","status":2}
      """
    * 请求"add_express_url"后台接口，添加物流发货
    """
      {"link_url":"",
       "http_method": "post",
       "headers":{
            "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"
       },
       "url_params":{'logistics_type': ' 14',
          'logistics_sn': ' SF000009',
          'logistics_price': ' 0',
          'protect_price': ' 0',
          'delivery_time': ' 2020-04-01 10:38:19',
          'remark': 'ci_api_test',
          'id': (context.column_result),
          'type': ' ',
          'clientToken': ''}
      }
    """
    * 等待"2"秒

    * 数据表"ordertest.od_orders" 使用逻辑"and"查询最新记录字段"orders_sn"
      """
        {"orders_uid":"2638122","goods_id":"401"}
      """

    * 请求"create_order_return_url"接口，申请售后
      """
        {'link_url':'',
          'http_method': 'post',
           "url_params":{
              "applicationReason": 1,
              "goodsSn": "YK00000401",
              "num": 1,
              "ordersSn": (context.column_result),
              "postSaleType": 1,
              "remark": "",
              "profs": [],
              "refundContacts": "翠友8276506303",
              "refundContactsInformation": "12888886303"
           }
        }
      """
    * 验证接口返回值
      """
        {
            "cacheType": "",
            "code": 0,
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "message": "申请成功",
            "msg": "申请成功",
            "status": 0
        }
      """

  Scenario: [1] 撤销售后申请订单
    * 数据表"ordertest.od_orders_goods_return" 使用逻辑"and"查询最新记录字段"refund_sn"
      """
        {"uid":"2638122","goods_sn":"YK00000401"}
      """
    * 请求"revoke_order_return_url"接口，撤销售后申请
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "refundSn": (context.column_result)
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "message": "修改成功",
          "msg": "修改成功",
          "status": 0
      }
    """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_goods"
      """
        {"goods_sn":'YK00000401'}
      """
    * 验证数据库返回值
      """
        [{
            'goods_sn': 'YK00000401',
            'goods_logo': 'https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg',
            'goods_imgs': '',
            'goods_name': 'CI-TEST-GOODS（自动化测试专用）',
            'goods_original_price': Decimal('100.00'),
            'discount': 0.0,
            'goods_num': 1,
            'goods_source_id': 7,
            'channel_group_id': 0,
            'goods_refundable_time': 0,
            'goods_category_tag': '',
            'live_member_id': 193,
            'liver_name': '',
            'live_stream': '',
            'live_info': '',
            'plat_id': 1,
            'status': 3,
            'cost_status': 0,
            'actual_price': Decimal('100.00'),
            'orders_discount_apportion': Decimal('0.00'),
            'coin_deduction_apportion': Decimal('0.00'),
            'member_apportion': Decimal('0.00'),
            'rest_price': Decimal('0.00'),
            'postage': Decimal('0.00'),
            'sale_percent': Decimal('0.01'),
            'is_delete': 0,
            'is_refund': 0,
            'referrer_id': 2638121,
            'complete_uid': None,
            'complete_time': None,
            'referrer_type': 1,
            'platform_commission': Decimal('0.20'),
            'is_part_refund': 0,
            'fee': Decimal('0.00'),
            'del_state': 0,
            'coin': Decimal('0.00'),
            'total_amount': Decimal('100.00'),
            'category_id': 0,
            'style_id': 0,
            'mid': 3,
            'goods_attr': '[]',
            'is_new_user': 0,
            'is_first': 59,
            'platform': 0,
            'goods_source': 0,
            'auto_settle': 0
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_goods_return"
      """
        {"goods_sn":'YK00000401',"uid":"2638122"}
      """
    * 验证数据库返回值
      """
        [{
            'uid': 2638122,
            'num': 1,
            'type': 1,
            'status': 6,
            'money': Decimal('100.00'),
            'prof': '',
            'add_user': 90,
            'receive_user': 0,
            'verify_uid': 0,
            'refund_uid': 0,
            'reason': '7天无理由退货',
            'remark': '',
            'finance_remark': '线上业务',
            'goods_remark': '',
            'is_delete': 0,
            'pay_way': 0,
            'refund_name': '翠友8276506303',
            'refund_account': '',
            'refund_account_bank': '',
            'refund_way': 3,
            'lost': '',
            'is_reject': 0,
            'del_state': 0,
            'is_mock': 0,
            'buyer_delivery_time': None,
            'mid': 3,
            'post_sale_type': 1,
            'prof2': None,
            'prof3': None,
            'refund_version': 2,
            'revoke_reason': None,
            'seller_agreed_time': None,
            'express_company': None,
            'express_number': None,
            'profs': '[]',
            'platform': 0,
            'seller_receiving_goods_time': None,
            'reject_reason': None,
            'reject_money_time': None,
            'reject_time': None,
            'reject_money_reason': None,
            'refund_remark': None,
            'refund_contacts': '翠友8276506303',
            'refund_contact_information': '12888886303',
            'automatic': None
        }]
      """

  Scenario:  [2]测试现场恢复
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638122"}
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_goods where goods_sn ='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_remark where user_remark='ci_api_test';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_user where user_id='2638122';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_goods_lock where goods_sn='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_operator where goods_sn='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_goods_logistics where logistics_sn ='SF000009';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_order_logs where log like '%YK00000401%';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_goods_return where goods_sn = 'YK00000401';"
      """
