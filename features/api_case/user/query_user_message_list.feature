# Created by shenping at 2020/4/25
Feature: 获取优惠公告接口测试用例

  Background: 测试数据初始化
  
  Scenario: [0]获取优惠公告
    * 请求"query_user_message_list_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "userToken": (context.token),
            "page": 1,
            "pageSize": 10,
            "msgCate": "0",
            "type": 2
          }
      }
    """
    * 接口返回码"200"