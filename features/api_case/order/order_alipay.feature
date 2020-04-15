# Created by shenping at 2020/4/1
Feature: 订单支付接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638122"}
      """
    * 运行以下sql,删除测试数据
      """
        "delete FROM ordertest.od_payment_log WHERE orders_sn in (SELECT orders_sn from  ordertest.od_orders_user where user_id=2638122);"
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
        "delete from ordertest.od_goods_lock where goods_sn='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_operator where goods_sn='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_order_logs where log like '%YK00000401%';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete FROM ordertest.od_orders_separate WHERE orders_sn in (SELECT orders_sn from  ordertest.od_orders_user where user_id=2638122);"
      """
    * 运行以下sql,删除测试数据
      """
        "delete FROM ordertest.od_orders_separate_pay WHERE orders_sn in (SELECT orders_sn from  ordertest.od_orders_user where user_id=2638122);"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_user where user_id='2638122';"
      """

  Scenario: [0] 使用钱包支付待付款订单（会员+直接推荐人+间接推荐人+商户推荐人）
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
    * 等待"2"秒
    * 解绑订单手机号虚拟号
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证接口返回值
      """
        {
            "cacheType": "",
            "code": 0,
            "data": {
                "zeroOrder": 0
            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "info": {
                "zeroOrder": 0
            },
            "message": "",
            "msg": "",
            "status": 0
        }
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders"
      """
        {"orders_uid":"2638122","goods_id":"401","orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'pid': 0,
            'orders_uid': 2638122,
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
            'status': 2,
            'paid_money': Decimal('100.00'),
            'extra': '{"rewards_on":1}',
            'job_number': None,
            'referrer_id': 2638121,
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
            'pay_money': '100',
            'clear': '3',
            'asyn_remark': None,
            'goods_id': 401,
            'r_cancellation': None,
            'platform': 0,
            'activityId': 0,
            'group_id': 0,
            'refund_flg': None
        }]
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
          'status': 2,
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
          'auto_settle': 1
      }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_goods_lock"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        []
      """
    * 使用逻辑"and"查询数据库"ordertest.od_payment_log"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'payment_id': 88,
            'payment_account': '',
            'amount': Decimal('100.00'),
            'add_user': 0,
            'check_user': 0,
            'payment_prof': '',
            'status': 2,
            'type': 0,
            'del_state': 0
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_separate"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'goods_sn': 'YK00000401',
            'platform_uid': -666,
            'platform_rate': Decimal('0.10'),
            'shop_uid': 51,
            'shop_rate': Decimal('0.80'),
            'referee_rate': Decimal('0.10'),
            'other_uid': 80000,
            'other_rate': Decimal('0.00'),
            'referee_rate_a_uid': 2638121,
            'referee_rate_a': Decimal('0.50'),
            'referee_rate_b_uid': 2638119,
            'referee_rate_b': Decimal('0.15'),
            'referee_rate_mine_uid': 2638122,
            'referee_rate_mine': Decimal('0.15'),
            'referee_rate_s_uid': 2638119,
            'referee_rate_s': Decimal('0.15'),
            'point': 0,
            'del_state': 0,
            'referee_rate_self': Decimal('0.00'),
            'referee_self_uid': 0
        }]
      """
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
  Scenario:[1]测试现场恢复