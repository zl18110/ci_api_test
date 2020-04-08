# Created by shenping at 2020/4/3
Feature: 售后订单详情查询接口测试用例

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

  Scenario: [1] 查询售后订单详情
    * 数据表"ordertest.od_orders_goods_return" 使用逻辑"and"查询最新记录字段"refund_sn"
      """
        {"uid":"2638122","goods_sn":"YK00000401"}
      """
    * 请求"query_order_return_detail_url"接口，查询售后订单详情
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
          "data": {
              "buyerDeliveryTime": "",
              "financeRemark": "线上业务",
              "goodsRemark": "",
              "goodsSn": "YK00000401",
              "isMock": 0,
              "isReject": 0,
              "mid": 3,
              "money": 100.0,
              "num": 1,
              "orders": {
                  "goodSn": "",
                  "isDbzc": 0,
                  "isVip": 0,
                  "jobNumber": "",
                  "ordersAddUser": 90,
                  "ordersRefundTime": "",
                  "ordersType": 16,
                  "ordersUid": 2638122,
                  "paidMoney": 100.0,
                  "pid": 0,
                  "serverId": 0
              },
              "ordersGoods": {
                  "actualPrice": 100.0,
                  "coin": 0.0,
                  "discount": 0.0,
                  "goodsCategoryTag": "",
                  "goodsImgs": "",
                  "goodsLogo": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
                  "goodsName": "CI-TEST-GOODS（自动化测试专用）",
                  "goodsNum": 1,
                  "goodsRefundableTime": 0,
                  "goodsSn": "YK00000401",
                  "isPartRefund": 0,
                  "isRefund": 1,
                  "mid": 3,
                  "ordersAddUser": 90,
                  "status": 3
              },
              "postSaleType": "退货退款",
              "postSaleTypeValue": 1,
              "profs": [],
              "reason": "7天无理由退货",
              "refundContacts": "翠友8276506303",
              "refundContactsInformation": "12888886303",
              "refundName": "翠友8276506303",
              "refundRemark": "",
              "refundUid": 0,
              "refundVersion": 2,
              "refundWay": 3,
              "rejectMoneyReason": "",
              "rejectMoneyTime": "",
              "rejectReason": "",
              "rejectTime": "",
              "remark": "",
              "revokeReason": "",
              "revokeTime": "",
              "sellerReceivingGoodsTime": "",
              "status": 0,
              "type": 1,
              "uid": 2638122
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "buyerDeliveryTime": "",
              "financeRemark": "线上业务",
              "goodsRemark": "",
              "goodsSn": "YK00000401",
              "isMock": 0,
              "isReject": 0,
              "mid": 3,
              "money": 100.0,
              "num": 1,
              "orders": {
                  "goodSn": "",
                  "isDbzc": 0,
                  "isVip": 0,
                  "jobNumber": "",
                  "ordersAddUser": 90,
                  "ordersRefundTime": "",
                  "ordersType": 16,
                  "ordersUid": 2638122,
                  "paidMoney": 100.0,
                  "pid": 0,
                  "referrerId": 2638121,
                  "serverId": 0
              },
              "ordersGoods": {
                  "actualPrice": 100.0,
                  "coin": 0.0,
                  "discount": 0.0,
                  "goodsCategoryTag": "",
                  "goodsImgs": "",
                  "goodsLogo": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
                  "goodsName": "CI-TEST-GOODS（自动化测试专用）",
                  "goodsNum": 1,
                  "goodsRefundableTime": 0,
                  "goodsSn": "YK00000401",
                  "isPartRefund": 0,
                  "isRefund": 1,
                  "mid": 3,
                  "ordersAddUser": 90,
                  "status": 3
              },
              "postSaleType": "退货退款",
              "postSaleTypeValue": 1,
              "profs": [],
              "reason": "7天无理由退货",
              "refundContacts": "翠友8276506303",
              "refundContactsInformation": "12888886303",
              "refundName": "翠友8276506303",
              "refundRemark": "",
              "refundUid": 0,
              "refundVersion": 2,
              "refundWay": 3,
              "rejectMoneyReason": "",
              "rejectMoneyTime": "",
              "rejectReason": "",
              "rejectTime": "",
              "remark": "",
              "revokeReason": "",
              "revokeTime": "",
              "sellerReceivingGoodsTime": "",
              "status": 0,
              "type": 1,
              "uid": 2638122
          },
          "message": "ok",
          "msg": "ok",
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