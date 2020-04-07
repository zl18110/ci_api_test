# Created by shenping at 2020/4/7
Feature: 按关键字搜索拍卖商品接口测试用例

  Scenario Outline: [0] 搜索拍卖商品
    * 请求"query_search_bykeyword_url"接口，查询商品
    """
      {'link_url':'?limit=10&offset=0&<param_1>=<value_1>',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    Examples: --<param_1>=<value_1>
      |param_1      | value_1    |
      |keyword      |彩宝         |
      |keyword      |平安扣        |
      |price_ordering|0          |
      |status        |pending          |
      |texture       |南红              |
      |category      |戒指              |
