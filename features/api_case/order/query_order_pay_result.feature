# Created by shenping at 2020/4/2
Feature: 获取订单支付结果接口测试用例

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

  Scenario: [0] 未支付时--获取订单支付结果
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

    * 数据表"ordertest.od_orders" 使用逻辑"and"查询最新记录字段"id"
      """
        {"orders_uid":"2638122","goods_id":"401"}
      """
    * 请求"query_order_pay_result_url"接口，查询订单支付结果
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "outTradeNo": (context.column_result)
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 2005,
          "data": {},
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {},
          "message": "支付记录不存在",
          "msg": "支付记录不存在",
          "status": 2005
      }
    """
  Scenario: [1] 支付成功后--获取订单支付结果
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
    * 等待"1"秒
    * 数据表"ordertest.od_orders" 使用逻辑"and"查询最新记录字段"orders_sn"
      """
        {"orders_uid":"2638122","goods_id":"401"}
      """
    * 验证数据库返回条数为"1"

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
    * 数据表"ordertest.od_orders" 使用逻辑"and"查询最新记录字段"id"
      """
        {"orders_uid":"2638122","goods_id":"401"}
      """
    * 请求"query_order_pay_result_url"接口，查询订单支付结果
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "outTradeNo": (context.column_result)
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": {
              "amount": 100.0,
              "addUser": 0,
              "rebate": "1.5",
              "del_state": 0,
              "type": 0,
              "checkUser": 0,
              "pot_Page": 0,
              "paymentId": 88,
              "pot_OrtType": "desc",
              "pot_PageSize": 20,
              "status": 2
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "amount": 100.0,
              "addUser": 0,
              "rebate": "1.5",
              "del_state": 0,
              "type": 0,
              "checkUser": 0,
              "pot_Page": 0,
              "paymentId": 88,
              "pot_OrtType": "desc",
              "pot_PageSize": 20,
              "status": 2
          },
          "message": "获取支付结果成功",
          "msg": "获取支付结果成功",
          "status": 0
      }
    """

  Scenario: [2] 恢复测试现场