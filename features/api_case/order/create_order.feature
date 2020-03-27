# Created by shenping at 2020/3/24
Feature: #添加订单接口测试用例
  #  /a/api/v1/orders/orders

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
            "remark": "sptest"
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
    * mysql表"ordertest.od_orders_remark" 使用"and"查询最新记录字段"orders_sn"
      """
        {"remark":"sptest"}
      """

    * 使用逻辑"and"查询数据库"ordertest.od_orders"
      """
        {"orders_uid":"2638365","goods_id":"313","addressId":"2330","orders_sn":"<orders_sn>"}
      """
    * 验证接口返回的总条数为1