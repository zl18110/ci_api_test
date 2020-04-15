# Created by shenping at 2020/4/3
Feature: 获取取消订单原因列表接口测试用例

  Scenario: [0]查询取消订单原因列表
    * 请求"query_order_cancel_reason_url"接口，查询取消原因
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "platForm": 0
          }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": [{
              "remarks": "",
              "type": 1,
              "value": "不想买了"
          }, {
              "remarks": "",
              "type": 2,
              "value": "信息填写错误，重新拍"
          }, {
              "remarks": "",
              "type": 3,
              "value": "卖家缺货"
          }, {
              "remarks": "",
              "type": 4,
              "value": "其他原因"
          }],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [{
              "remarks": "",
              "type": 1,
              "value": "不想买了"
          }, {
              "remarks": "",
              "type": 2,
              "value": "信息填写错误，重新拍"
          }, {
              "remarks": "",
              "type": 3,
              "value": "卖家缺货"
          }, {
              "remarks": "",
              "type": 4,
              "value": "其他原因"
          }],
          "message": "获取订单取消原因列表成功",
          "msg": "获取订单取消原因列表成功",
          "status": 0
      }
    """