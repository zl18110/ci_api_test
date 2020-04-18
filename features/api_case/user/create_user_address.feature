# Created by shenping at 2020/4/18
Feature: 添加收货地址接口测试用例

  Scenario: [0]添加收货地址
    * 请求"create_user_address_url"接口，添加收货地址
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
              "name": "小四",
              "province": "北京市",
              "city": "北京市",
              "area": "东城区",
              "street": "",
              "address": "猜猜这个是哪个",
              "phone": "12888886303",
              "zipcode": ""
          }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "收货地址添加成功",
          "msg": "收货地址添加成功",
          "status": 0
      }
    """