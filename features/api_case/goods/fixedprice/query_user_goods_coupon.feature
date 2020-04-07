# Created by shenping at 2020/4/2
Feature: 获取用户可用优惠券/红包接口测试用例

  Background: 测试数据初始化
  
  Scenario: [0] 用户无可用优惠券
    * 请求"query_user_goods_coupon_url"接口，
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "type": 0,
            "status": 1,
            "amount": 100,
            "page": 1,
            "pagesize": 10000,
            "isExpire": 0,
            "goodsSn": "YK00000401",
            "sign": 16,
            "liveMemberId": 0
        }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 1,
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "用户优惠券数据为空",
          "msg": "用户优惠券数据为空",
          "status": 1
      }
    """