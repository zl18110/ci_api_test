# Created by shenping at 2020/4/7
Feature: 搜索商品接口测试用例

  Scenario: [0] 输入词汇搜索商品
    * 请求"query_search_list_url"接口，
    """
      {'link_url':'?page=1&pageSize=20&keyword=CI-TEST-GOODS',
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
                "list": [{
                    "goods_id": 401,
                    "goods_sn": "YK00000401",
                    "goods_name": "CI-TEST-GOODS（自动化测试专用）",
                    "cover": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
                    "market_price": "300.00",
                    "shop_price": "100.00",
                    "is_video": 0,
                    "earn_money": "7.50"
                }],
                "page": {
                    "count": 1,
                    "page_count": 1,
                    "page": 1,
                    "page_size": 20
                },
                "shopList": [],
                "shopPage": {
                    "total": 0,
                    "page": 1,
                    "pageSize": 20
                }
            }
        }
    """