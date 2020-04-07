# Created by shenping at 2020/4/7
Feature: 获取获取关注列表接口测试用例

  Scenario: [0]获取关注列表
    * 请求"query_community_idol_url"接口，获取关注列表
    """
      {'link_url':'?pageSize=4&page=1',
        'http_method': 'get',
        'host':'operatetest.jaadee.net',
        'protocol':'http',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
        "status": 0,
        "code": 0,
        "msg": "获取关注列表",
        "message": "获取关注列表"
      }
    """