# Created by shenping at 2020/4/25
Feature: 获取客服列表接口测试用例


  Scenario: [0]获取客服列表
    * 请求"query_service_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"