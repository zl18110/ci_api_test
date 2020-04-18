# Created by shenping at 2020/4/18
Feature: 上传用户生日接口测试用例

  Background: 测试数据初始化
    * 运行以下sql,恢复测试数据
    """
      "update jdcustomerstest.cus_user set birthday ='' where uid = 2638122;"
    """
  Scenario: [0]上传用户生日
    * 请求"update_user_birthday_url"接口，保存用户生日
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
              "birthday": "2020-4-18"
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
        "message": "保存用户生日成功",
        "msg": "保存用户生日成功",
        "status": 0
    }
    """
    * 使用逻辑"and"查询数据库"jdcustomerstest.cus_user"
    """
      {"uid":"2638122","birthday":"2020-4-18"}
    """
    * 验证数据库返回条数为"1"

  Scenario: [1] 恢复测试数据