# Created by shenping at 2020/4/7
Feature: 获取关注翠友动态接口测试用例

  Scenario: [0] 获取关注人动态
    * 请求"query_community_article_fromIdo_url"接口，
    """
      {'link_url':'?limit=15&page=1',
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
        "msg": "我关注的作者的图文",
        "message": "我关注的作者的图文"
      }
    """