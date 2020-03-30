# Created by shenping at 2020/3/24
Feature: #/a/api/ordersys/index.php/v3/order/statusNum接口测试用例
  # /a/api/ordersys/index.php/v3/order/statusNum

  Scenario:[1]查询个状态订单角标数
    * 请求"query_order_status_num_url"接口,查询订单
      """
      {'link_url':'',
        'http_method': 'post',
         "url_params":{
         }
      }
      """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": {
              "all": 0,
              "finished": 0,
              "received": 0,
              "refund": 0,
              "refunding": 0,
              "unDeliver": 0,
              "unPay": 0,
              "unReceive": 0
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "all": 0,
              "finished": 0,
              "received": 0,
              "refund": 0,
              "refunding": 0,
              "unDeliver": 0,
              "unPay": 0,
              "unReceive": 0
          },
          "message": "获取订单各个状态总数成功",
          "msg": "获取订单各个状态总数成功",
          "status": 0
      }
    """