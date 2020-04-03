# Created by shenping at 2020/4/2
Feature: C端确认收货接口组合测试用例

  Background: 测试数据初始化
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

  Scenario: [0] 确认收货
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
    * 等待"2"秒

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
    * 数据表"ordertest.od_orders" 使用逻辑"and"查询最新记录字段"orders_sn"
      """
        {"orders_uid":"2638122","goods_id":"401"}
      """

    * 请求"orders_recevie_url"接口，确认收货
    """
      {'link_url':'',
        'http_method': 'post',
        'host':'rnapitest.jaadee.net',
        'protocol':'https',
         'url_params':{
            "ordersSn": (context.column_result),
            "goodsSn": "YK00000401"
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "success",
          "data": []
      }
    """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_goods"
      """
        {"orders_sn":(context.column_result)}
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
          'sale_group_id': 24,
          'orders_add_user': 90,
          'finance_group_id': 26,
          'channel_group_id': 0,
          'goods_refundable_time': 0,
          'goods_category_tag': '',
          'live_member_id': 193,
          'liver_name': '',
          'live_stream': '',
          'live_info': '',
          'plat_id': 1,
          'status': 6,
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
          'platform': None,
          'goods_source': None,
          'auto_settle': 1
      }]
    """

  Scenario: [1] 测试现场恢复
