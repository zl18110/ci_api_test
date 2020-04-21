# Created by shenping at 2020/4/21
Feature: 更新收货地址接口测试用例

  Background: 测试数据初始化
    * 运行以下sql,base测试数据
    """
      "update  jdcustomerstest.cus_user_address set street =''  where user_id =2638122 and id =2235 ;"
    """
  Scenario: [0]更新收货地址
    * 请求"update_user_address_url"接口，更新收货地址
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "addressId": 2235,
            "name": "徐东",
            "province": "福建省",
            "city": "泉州市",
            "area": "晋江市",
            "street": "test",
            "address": "百爪挠心在你家对你的",
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
          "message": "收货地址修改成功",
          "msg": "收货地址修改成功",
          "status": 0
      }
    """
    * 使用逻辑"and",查询数据库"jdcustomerstest.cus_user_address"
    """
      {"user_id":"2638122","id":"2235","street":"test"}
    """
    * 验证数据库返回条数"1"

   Scenario: [1]测试现场恢复
