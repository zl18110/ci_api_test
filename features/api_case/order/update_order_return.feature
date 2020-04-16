# Created by shenping at 2020/4/3
Feature: 修改售后订单接口测试用例

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

  Scenario: [1] 修改售后订单
    * 数据表"ordertest.od_orders_goods_return" 使用逻辑"and"查询最新记录字段"refund_sn"
      """
        {"uid":"2638122","goods_sn":"YK00000401"}
      """
    * 请求"update_order_return_url"接口，修改售后订单
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "applicationReason": 3,
              "postSaleType": 1,
              "remark": "测试",
              "profs": ["rn/userUpload/mine/afterSale/image/2638122/2020-04-03/1585896672-2vtatt.jpg"],
              "refundSn": (context.column_result),
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
          "message": "修改成功",
          "msg": "修改成功",
          "status": 0
      }
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