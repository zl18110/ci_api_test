# Created by shenping at 2020/4/18
Feature: 更新用户性别和个人描述接口测试用例
  Background: 测试数据初始化
    * 运行以下sql,恢复测试数据
    """
      "update jdcustomerstest.cus_user set sex =0,intro ='' where uid = 2638122;"
    """
  Scenario: [0] 更新用户性别设置
    * 请求"update_user_SignAndSex_url"接口，更新性别
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
             "sex": 1
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
          "message": "修改成功",
          "msg": "修改成功",
          "status": 0
      }
    """
    * 使用逻辑"and"查询数据库"jdcustomerstest.cus_user"
    """
      {"uid":"2638122","sex":"1"}
    """
    * 验证数据库返回条数为"1"

  Scenario: [1] 更新用户个人描述
    * 请求"update_user_SignAndSex_url"接口，更新描述
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
         	"intro": "猜猜我是谁"
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
          "message": "修改成功",
          "msg": "修改成功",
          "status": 0
      }
    """
    * 使用逻辑"and"查询数据库"jdcustomerstest.cus_user"
    """
      {"uid":"2638122","intro":"猜猜我是谁"}
    """
    * 验证数据库返回条数为"1"

  Scenario: [2] 恢复测试数据
