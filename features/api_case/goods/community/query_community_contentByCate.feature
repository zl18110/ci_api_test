# Created by shenping at 2020/4/7
Feature: 获取买家秀接口测试用例

  Scenario: [0]获取买家秀
    * 请求"query_community_contentByCate_url"接口，获取买家秀
    """
      {'link_url':'?pageSize=14&page=1&categoryId=0&type=3',
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
        "msg": "获取内容列表成功！",
        "message": "获取内容列表成功！"
      }
    """