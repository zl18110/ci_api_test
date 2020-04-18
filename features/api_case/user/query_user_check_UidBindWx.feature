# Created by shenping at 2020/4/18
Feature: 检查账号是否绑定微信接口测试用例


  Scenario: [0]检查用户是否绑定微信
    * 请求"query_user_check_UidBindWx_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
            "cacheType": "",
            "code": 0,
            "data": {
                "hasBinded": false,
                "unionId": ""
            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "info": {
                "hasBinded": false,
                "unionId": ""
            },
            "message": "没有绑定过",
            "msg": "没有绑定过",
            "status": 0
      }
    """