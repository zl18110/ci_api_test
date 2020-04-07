# Created by shenping at 2020/4/7
Feature: 获取热门搜索词接口测试用例

  Scenario: [0] 获取热门搜索词
    * 请求"query_hot_search_word_url"接口，查询热门搜索词
    """
      {'link_url':'?page=1&pageSize=20',
        'http_method': 'get',
        'host':'centertest.jaadee.net',
        'protocol':'http',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取成功",
          "data": {
              "list": ["翡翠", "和田玉", "蜜蜡"],
              "page": {
                  "count": 3,
                  "page_count": 1,
                  "page": 1,
                  "page_size": 20
              }
          }
      }
    """