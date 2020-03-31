# Created by shenping at 2020/3/24
Feature: 查询商品详情接口测试用例
  # GET /api/Goodsfixedprice/getDetails?goodsId=313 HTTP/1.1

  Scenario: [1] 根据商品id 查询商品详情
    * 请求"query_goods_details_url"接口，查询商品详情
    """
    {'link_url':'?',
        'http_method': 'get',
         "url_params":{
         "goodsId":"401"
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "\u83b7\u53d6\u6210\u529f",
          "data": {
              "goods_id": 401,
              "goods_sn": "YK00000401",
              "goods_name": "CI-TEST-GOODS\uff08\u81ea\u52a8\u5316\u6d4b\u8bd5\u4e13\u7528\uff09",
              "cover": "https:\/\/res.jaadee.net\/merchantApi\/goods\/2020-03-30\/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
              "market_price": "240.00",
              "shop_price": "100.00",
              "click_num": 21,
              "collect_num": 0,
              "is_video": 0,
              "stock": 999999,
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
              "sale_num": 1,
              "active_ext": null,
              "active_id": 0,
              "is_delete": 0,
              "server_info": {
                  "xmpp_username": "d468c79404d98666ec9d0c0d9246f0c8"
              },
              "advertise": [],
              "xcx_advertise": [],
              "cate_name": "\u8336\u53f6\u8336\u9053",
              "cate_child_name": "\u666e\u6d31\u8336",
              "shop_info": {
                  "name": "\u6768\u54e522\u697c\u5e97\u94fa",
                  "cover": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366368408-204b700ce97b4a241a0b867e83f40530.jpg",
                  "avatar": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366373840-2e0b5c48e77cd5844bbd9a0659c72dee.jpg",
                  "desc": "\u7a00\u4e16\u73cd\u54c1\u7425\u73c0\u871c\u8721\u76f4\u64ad\u95f4\uff0c\u4e3b\u8425\u866b\u73c0\u3001\u58a8\u897f\u54e5\u84dd\u73c0\u3001\u591a\u7c73\u5c3c\u52a0\u84dd\u73c0\u3001\u539f\u76ae\u624b\u628a\u53ca\u7425\u73c0\u539f\u77f3\u9ad8\u7aef\u5b9a\u5236\u3002\u7425\u73c0\u871c\u8721\u5747\u7531\u4e13\u5bb6\u56e2\u961f\u4e25\u683c\u7b5b\u9009\uff0c\u5e76\u4e3a\u7fe0\u53cb\u4eec\u914d\u5907\u4e13\u4e1a\u7684\u4ee3\u8d2d\u670d\u52a1\uff0c\u8ba9\u60a8\u53ef\u4ee5\u5728\u4f17\u591a\u73cd\u54c1\u4e2d\u9047\u5230\u79f0\u5fc3\u5982\u610f\u7684\u5b83\u3002",
                  "mid": 3,
                  "bid": 3,
                  "focus_count": 586
              },
              "content_attribute": [{
                  "main": "\u5206\u7c7b",
                  "child": "\u53e4\u6811\u8336"
              }],
              "order_chose_attribute": [],
              "share_info": {
                  "name": "CI-TEST-GOODS\uff08\u81ea\u52a8\u5316\u6d4b\u8bd5\u4e13\u7528\uff09",
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