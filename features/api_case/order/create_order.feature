# Created by shenping at 2020/3/24
Feature: 添加订单接口测试用例
  #  /a/api/v1/orders/orders
  Background: 测试数据初始化
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638265"}
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
        "delete from ordertest.od_orders_user where orders_uid='2638265';"
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
        "delete from ordertest.od_order_logs where log REGEXP '2638265';"
      """
  Scenario: [1] 集市添加订单
    * 请求"create_order_url"接口，添加订单
    """
      {'link_url':'',
        'http_method': 'post',
         "url_params":{
            "type": 16,
            "goodsId": 401,
            "addressId": 2337,
            "coin": 0,
            "redId": 0,
            "couponId": 0,
            "num": 1,
            "attr": "",
            "remark": "sp_ci_test"
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
          "message": "",
          "msg": "",
          "status": 0
        }
      """
    * 数据表"ordertest.od_orders_remark" 使用逻辑"and"查询最新记录字段"orders_sn"
      """
        {"user_remark":"sp_ci_test"}
      """

    * 使用逻辑"and"查询数据库"ordertest.od_orders"
      """
        {"orders_uid":"2638265","goods_id":"401","orders_sn":(context.column_result)}
      """
    * 验证数据库条数为"1"


    # 测试现场恢复=================================================================
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638265"}
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
        "delete from ordertest.od_orders_user where orders_uid='2638265';"
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
        "delete from ordertest.od_order_logs where log REGEXP '2638265';"
      """
