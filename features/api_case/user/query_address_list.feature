# Created by shenping at 2020/4/2
Feature: 查询用户收货地址列表接口测试用例

  Scenario: [0] 获取用户收货地址列表
    * 请求"query_address_list_url"接口，获取收货地址
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{

         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [{
              "address": "百爪挠心在你家对你的",
              "area": "晋江市",
              "city": "泉州市",
              "createTime": 1582119485,
              "default": 1,
              "deleteTime": 0,
              "id": 2235,
              "name": "徐东",
              "phone": "12888886303",
              "province": "福建省",
              "street": "",
              "userId": 2638122,
              "zipcode": ""
          }],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [{
              "address": "百爪挠心在你家对你的",
              "area": "晋江市",
              "city": "泉州市",
              "createTime": 1582119485,
              "default": 1,
              "deleteTime": 0,
              "id": 2235,
              "name": "徐东",
              "phone": "12888886303",
              "province": "福建省",
              "street": "",
              "userId": 2638122,
              "zipcode": ""
          }],
          "message": "收货地址获取成功",
          "msg": "收货地址获取成功",
          "status": 0
      }
    """