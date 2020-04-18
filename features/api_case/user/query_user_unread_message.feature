# Created by shenping at 2020/4/18
Feature: 获取用户未读信息接口测试用例


  Scenario: [0] 获取用户未读消息
    * 请求"query_user_unread_message_url"接口，获取未读消息
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"