# Created by shenping at 2020/4/7
Feature: 获取拍卖热门推荐商品列表接口测试用例

  Scenario Outline: [0] 获取拍卖热门推荐商品列表
    * 请求"query_auction_url"接口，获取热门推荐
    """
      {'link_url':'?status=ongoing&limit=10&offset=0&auction_type=<auction_type>',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    Examples: --<auction_type>
      |auction_type      |
      |彩宝                |
      |平安扣               |
      |和田玉               |
      |琥珀                |
      |挂件                |
      |戒指                |
      |翡翠                |
      |蜜蜡                |