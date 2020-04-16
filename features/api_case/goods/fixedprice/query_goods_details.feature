# Created by shenping at 2020/3/24
Feature: 查询商品详情接口测试用例
  # GET /api/Goodsfixedprice/getDetails?goodsId=313 HTTP/1.1

  Scenario: [1] 根据商品id 查询商品详情--无规格
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
              "market_price": "300.00",
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
              "max_num": 999999,
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
  Scenario: [2] 根据商品id 查询商品详情--有规格
    * 请求"query_goods_details_url"接口，查询商品详情
    """
    {'link_url':'?',
        'http_method': 'get',
        'evn':'CI_CENTER',
         "url_params":{
         "goodsId":"550"
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取成功",
          "data": {
              "goods_id": 550,
              "goods_sn": "YK00000550",
              "goods_name": "CI-TEST专用自动化测试规格商品",
              "cover": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598392-06a17bda2eca567a3a1748adba64f4b0.jpeg",
              "market_price": "69.30",
              "shop_price": "33.00",
              "click_num": 1,
              "collect_num": 0,
              "is_video": 0,
              "stock": 800000,
              "controller_start_time": "2020-04-16 00:00:00",
              "controller_end_time": "2035-04-16 00:00:00",
              "server_type": ["1"],
              "goods_tag": "自动化测试专用商品规格",
              "owner_uid": 51,
              "owner_bid": 3,
              "owner_mid": 3,
              "cate_id": 59,
              "cate_child_id": 61,
              "cate_data": {
                  "child_id": 61,
                  "id": 59
              },
              "spread": "0.150",
              "images": ["https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598392-06a17bda2eca567a3a1748adba64f4b0.jpeg", "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598432-5196b7dd3a132f66469ea59f9d2b25a1.jpeg"],
              "video": [],
              "content": "自动化测试规格商品",
              "earn_money": "2.47",
              "display": 1,
              "max_num": 0,
              "saleStatus": 0,
              "refundable_time": 7,
              "sale_num": 0,
              "active_ext": null,
              "active_id": 0,
              "is_delete": 0,
              "status": 1,
              "content_img": [{
                  "type": "image",
                  "height": 4032,
                  "width": 3024,
                  "url": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598382-9b2e02f5d60011c17593ebf87723d4a5.jpeg"
              }, {
                  "type": "image",
                  "height": 4032,
                  "width": 3024,
                  "url": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598424-16da9f0623a3df108065d36295ae2d89.jpeg"
              }, {
                  "width": 3024,
                  "url": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598477-f52f07a77bc9772fee828f25e4dcadcc.jpeg",
                  "type": "image",
                  "height": 4032
              }],
              "server_info": {
                  "id": 479,
                  "xmpp_username": "wzz4563",
                  "username": "小伊",
                  "avatar": "https:\/\/appmanage.jaadee.com\/newupload\/rnAdmin\/upload\/archive\/405904b0cc21ab0d0bfab2a9e9bc5ff7\/200x200.jpg",
                  "qrcode": "",
                  "intro": "",
                  "user_id": 2637750,
                  "plat_id": 1,
                  "online": 1,
                  "wx": ""
              },
              "advertise": [],
              "xcx_advertise": [],
              "cate_name": "茶叶茶道",
              "cate_child_name": "绿茶",
              "shop_info": {
                  "name": "杨哥22楼店铺",
                  "cover": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366368408-204b700ce97b4a241a0b867e83f40530.jpg",
                  "avatar": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366373840-2e0b5c48e77cd5844bbd9a0659c72dee.jpg",
                  "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                  "mid": 3,
                  "bid": 3,
                  "focus_count": 1017
              },
              "content_attribute": [{
                  "main": "分类",
                  "child": "龙井茶"
              }],
              "order_chose_attribute": [],
              "content_attribute_v2": [{
                  "main": "分类",
                  "child": "龙井茶"
              }],
              "specifications": [{
                  "id": 832,
                  "name": "散装,1kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598467-aed66f915e21c001da2a3e92fd168d49.jpeg"
              }, {
                  "id": 833,
                  "name": "茶饼,1kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598503-ae8196d8448f75cad96d45c2054d1de6.jpeg"
              }, {
                  "id": 834,
                  "name": "散装,2kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598526-cfb0f5f9a8402b06c77a39f3067f03ac.jpeg"
              }, {
                  "id": 835,
                  "name": "茶饼,2kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598549-ae5b938a13aeeed1c9d47edee2be1bf8.jpeg"
              }, {
                  "id": 836,
                  "name": "散装,3kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598578-99ab56a6ae69b6bc03728842baf41b33.jpeg"
              }, {
                  "id": 837,
                  "name": "茶饼,3kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598600-847e94938c9c09a05d46264680a9d124.jpeg"
              }, {
                  "id": 838,
                  "name": "散装,4kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598623-19fd61e547bcf394c47946c181b339a3.jpeg"
              }, {
                  "id": 839,
                  "name": "茶饼,4kg",
                  "price": "33.00",
                  "stock": 100000,
                  "image": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598646-7a75d06e544e64065b5f2b2b579b5fe7.jpeg"
              }],
              "share_info": {
                  "name": "CI-TEST专用自动化测试规格商品",
                  "logo": "https:\/\/res.jaadee.net\/merchantApi\/ykj\/2020-04-16\/1587007598392-06a17bda2eca567a3a1748adba64f4b0.jpeg?x-oss-process=style\/logo",
                  "url": "",
                  "desc": "自动化测试规格商品",
                  "miniProgramObj": {
                      "userName": "gh_e43a43c28d43",
                      "path": "\/pages\/cuiyou\/goods\/detail?id=550"
                  }
              },
              "goods_refundable_time": 7,
              "activeData": {}
          }
      }
    """