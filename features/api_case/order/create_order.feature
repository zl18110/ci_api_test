# Created by shenping at 2020/3/24
Feature: #添加订单接口测试用例
  #  /a/api/v1/orders/orders
  Background: 测试数据初始化
    * 运行以下sql,删除测试数据
    """
      "delete from ordertest.od_orders where orders_uid =2638265;"
    """
    * 运行以下sql,删除测试数据
    """
      "delete from ordertest.od_orders_remark where user_remark ='sp_ci_test';"
    """
  Scenario: [1] 集市添加订单
    * 请求"create_order_url"接口，添加订单
    """
      {'link_url':'',
        'http_method': 'post',
         "url_params":{
            "type": 16,
            "goodsId": 313,
            "addressId": 2330,
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
        {"orders_uid":"2638265","goods_id":"313","orders_sn":(context.column_result)}
      """
    * 验证数据库条数为"1"