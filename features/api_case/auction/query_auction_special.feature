# Created by shenping at 2020/4/7
Feature: 获取推荐拍卖商品列表接口测试用例

  Scenario Outline: [0] 获取推荐拍卖商品列表
    * 请求"query_auction_special_url"接口，查询推荐拍卖
    """
      {'link_url':'?limit=3&offset=0&special_type=<special_type>',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    Examples: --<remarks>
      |special_type|remarks                |
      |2002        |0元起拍                 |
      |2005        |新人专享                |
      |2009        |每日抢拍                |
