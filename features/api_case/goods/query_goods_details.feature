# Created by shenping at 2020/3/24
Feature: 查询商品详情接口测试用例
  # GET /api/Goodsfixedprice/getDetails?goodsId=313 HTTP/1.1

  Scenario: [1] 根据商品id 查询商品详情
    * 请求"query_goods_details_url"接口，查询商品详情
    """
    {'link_url':'?',
        'http_method': 'get',
        'host':'centertest.jaadee.net',
        'protocol':'http',
         "url_params":{
         "goodsId":"401"
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取成功",
          "data": {
              "goods_id": 401,
              "goods_sn": "YK00000401",
              "goods_name": "CI-TEST-GOODS（自动化测试专用）",
              "cover": "https:\/\/res.jaadee.net\/merchantApi\/goods\/2020-03-30\/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
              "market_price": "240.00",
              "shop_price": "100.00",
              "collect_num": 0,
              "is_video": 0,
              "controller_start_time": "2020-03-30 00:00:00",
              "controller_end_time": "2021-03-30 00:00:00",
              "server_type": ["1"],
              "goods_tag": "",
              "owner_uid": 51,
              "owner_bid": 3,
              "owner_mid": 3,
              "cate_id": 59,
              "cate_child_id": 60,
              "cate_data": {
                  "id": 59,
                  "child_id": 60
              },
              "spread": "0.150",
              "images": ["https:\/\/res.jaadee.net\/merchantApi\/goods\/2020-03-30\/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg"],
              "video": [],
              "content": "CI-TEST-DESC",
              "earn_money": "7.50",
              "display": 1,
              "max_num": 999,
              "saleStatus": 0,
              "refundable_time": 0,
              "active_ext": null,
              "active_id": 0,
              "is_delete": 0,
              "advertise": [],
              "xcx_advertise": [],
              "cate_name": "茶叶茶道",
              "cate_child_name": "普洱茶",
              "shop_info": {
                  "name": "杨哥22楼店铺",
                  "cover": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366368408-204b700ce97b4a241a0b867e83f40530.jpg",
                  "avatar": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366373840-2e0b5c48e77cd5844bbd9a0659c72dee.jpg",
                  "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                  "mid": 3,
                  "bid": 3              },
              "content_attribute": [{
                  "main": "分类",
                  "child": "古树茶"
              }],
              "order_chose_attribute": [],
              "share_info": {
                  "name": "CI-TEST-GOODS（自动化测试专用）",
                  "logo": "https:\/\/res.jaadee.net\/merchantApi\/goods\/2020-03-30\/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg?x-oss-process=style\/logo",
                  "url": "",
                  "desc": "CI-TEST-DESC",
                  "miniProgramObj": {
                      "userName": "gh_e43a43c28d43",
                      "path": "\/pages\/cuiyou\/goods\/detail?id=401"
                  }
              },
              "goods_refundable_time": 0,
              "activeData": {}
          }
      }
    """