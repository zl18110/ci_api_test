# Created by shenping at 2020/4/1
Feature: 后台添加物流发货接口组合测试用例

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
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_goods_logistics where logistics_sn ='SF000009';"
      """
  
  Scenario: [0]添加物流
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
              "remark": "sp_ci_test"
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
          'remark': ' test',
          'id': (context.column_result),
          'type': ' ',
          'clientToken': ''}
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "msg": "添加物流成功",
          "data": []
      }
    """

  Scenario: [1]测试现场恢复

