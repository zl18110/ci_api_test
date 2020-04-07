# Created by shenping at 2020/4/7
Feature: 获取用户鉴宝记录接口测试用例


  Scenario: [0] 获取用户鉴宝记录
    * 请求"query_jianbao_url"接口，查询鉴宝记录
    """
      {'link_url':'?limit=10&offset=0&user_type=0',
        'http_method': 'get',
        'host':'test-auction.jaadee.com',
        'protocol':'http',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "data": {
              "result": [],
              "total": 0
          },
          "message": "OK",
          "code": 0,
          "status": 200
      }
    """