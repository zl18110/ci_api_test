# Created by shenping at 2020/4/18
Feature: 设置是否显示等级头衔接口测试用例

  Scenario: [0]设置不显示等级头衔
    * 运行以下sql,base测试数据
    """
      "update jdcustomerstest.cus_user_score set level_display ='1' where uid = 2638122;"
    """
    * 请求"update_user_level_display_url"接口，设置不显示等级头衔
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "display": 0
        }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
        "cacheType": "none",
        "code": 40003,
        "data": [],
        "displayAlert": true,
        "displayTip": true,
        "hashData": "",
        "info": [],
        "message": "获得 传奇 头衔之后可以切换！",
        "msg": "获得 传奇 头衔之后可以切换！",
        "status": 40003
      }
    """
    * 使用逻辑"and"查询数据库"jdcustomerstest.cus_user_score"
    """
      {"uid":"2638122","level_display":"1"}
    """
    * 验证数据库返回条数为"1"

  Scenario: [1]设置显示等级头衔
    * 运行以下sql,base测试数据
    """
      "update jdcustomerstest.cus_user_score set level_display ='0' where uid = 2638122;"
    """
    * 请求"update_user_level_display_url"接口，设置显示等级头衔
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "display": 1
        }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
        "cacheType": "none",
        "code": 40003,
        "data": [],
        "displayAlert": true,
        "displayTip": true,
        "hashData": "",
        "info": [],
        "message": "获得 传奇 头衔之后可以切换！",
        "msg": "获得 传奇 头衔之后可以切换！",
        "status": 40003
      }
    """
    * 使用逻辑"and"查询数据库"jdcustomerstest.cus_user_score"
    """
      {"uid":"2638122","level_display":"0"}
    """
    * 验证数据库返回条数为"1"

    * 运行以下sql,base测试数据
    """
      "update jdcustomerstest.cus_user_score set level_display ='1' where uid = 2638122;"
    """