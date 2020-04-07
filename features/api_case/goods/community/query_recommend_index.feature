# Created by shenping at 2020/4/7
Feature: 获取翠友天地动态接口测试用例

  Scenario Outline: [0] 获取翠友天地动态
    * 请求"query_recommend_index_url"接口，
    """
      {'link_url':'?limit=14&page=1&cate=<cate>',
        'http_method': 'get',
        'host':'test-auction.jaadee.com',
        'protocol':'http',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    Examples: 获取 <remarks>  列表
      |cate   |remarks        |
      |index  |精选            |
      |7      |达人堂          |
      |8      |名家说          |