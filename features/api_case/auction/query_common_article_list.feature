# Created by shenping at 2020/4/7
Feature: 获取common_article_list接口测试用例

  Scenario Outline: [0] 获取common_article_list
    * 请求"query_common_article_list_url"接口，
    """
      {'link_url':'?label=<label>',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    Examples: --<label>
      |label      |
      |彩宝        |
      |平安扣      |
      |和田玉      |
      |琥珀        |
      |挂件        |
      |戒指        |
      |翡翠        |
      |蜜蜡        |