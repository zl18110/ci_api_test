# Created by shenping at 2020/3/24
Feature: 查询商品详情接口测试用例
  # GET /api/Goodsfixedprice/getDetails?goodsId=313 HTTP/1.1

  Scenario: [1] 根据商品id 查询商品详情
    * 请求"query_goods_details_url"接口，查询商品详情
    """
    {'link_url':'?type=5&page=1&pageSize=10',
        'http_method': 'get',
         "url_params":{
         }
      }

    """