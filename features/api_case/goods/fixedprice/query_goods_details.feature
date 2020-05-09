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
              "cover": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
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
              "images": ["https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg"],
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
                  "cover": "https://res.jaadee.net/merchantApi/other/2020-03-28/1585366368408-204b700ce97b4a241a0b867e83f40530.jpg",
                  "avatar": "https://res.jaadee.net/merchantApi/other/2020-03-28/1585366373840-2e0b5c48e77cd5844bbd9a0659c72dee.jpg",
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
                  "logo": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg?x-oss-process=style/logo",
                  "url": "",
                  "desc": "CI-TEST-DESC",
                  "miniProgramObj": {
                      "userName": "gh_e43a43c28d43",
                      "path": "/pages/cuiyou/goods/detail?id=401"
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
    * 运行以下sql,查询数据库
    """
      "SELECT a.*,b.id,b.attr_names ,b.image AS b_image,b.price AS b_price,b.sale_num AS b_sale_num,b.stock AS b_stock FROM datacentertest.new_goods a LEFT JOIN datacentertest.new_goods_stock b ON a.goods_id=b.goods_id WHERE a.goods_sn='YK00000550' AND b.is_delete=0;"
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
              "cover": "https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598392-06a17bda2eca567a3a1748adba64f4b0.jpeg",
              "market_price": "69.30",
              "shop_price": "33.00",
              "collect_num": (context.base_sql_result[0]['collect_num']),
              "is_video": (context.base_sql_result[0]['is_video']),
              "stock": (context.base_sql_result[0]['stock']),
              "controller_start_time": str((context.base_sql_result[0]['controller_start_time'])),
              "controller_end_time": str(context.base_sql_result[0]['controller_end_time']),
              "server_type": [(context.base_sql_result[0]['server_type'])],
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
              "spread": float((context.base_sql_result[0]['spread'])),
              "images": ["https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598392-06a17bda2eca567a3a1748adba64f4b0.jpeg", "https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598432-5196b7dd3a132f66469ea59f9d2b25a1.jpeg"],
              "video": [],
              "content": "自动化测试规格商品",
              "earn_money": "2.48",
              "display": (context.base_sql_result[0]['display']),
              "max_num": (context.base_sql_result[0]['max_num']),
              "saleStatus": (context.base_sql_result[0]['sale_status']),
              "sale_num": (context.base_sql_result[0]['sale_num']),
              "active_ext": (context.base_sql_result[0]['active_ext']),
              "active_id": (context.base_sql_result[0]['active_id']),
              "is_delete": (context.base_sql_result[0]['is_delete']),
              "status": (context.base_sql_result[0]['status']),
              "content_img": [{
                  "type": "image",
                  "height": 4032,
                  "width": 3024,
                  "url": "https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598382-9b2e02f5d60011c17593ebf87723d4a5.jpeg"
              }, {
                  "type": "image",
                  "height": 4032,
                  "width": 3024,
                  "url": "https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598424-16da9f0623a3df108065d36295ae2d89.jpeg"
              }, {
                  "width": 3024,
                  "url": "https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598477-f52f07a77bc9772fee828f25e4dcadcc.jpeg",
                  "type": "image",
                  "height": 4032
              }],
              "advertise": [],
              "xcx_advertise": [],
              "cate_name": "茶叶茶道",
              "cate_child_name": "绿茶",
              "shop_info": {
                  "name": "杨哥22楼店铺",
                  "cover": "https://res.jaadee.net/merchantApi/other/2020-03-28/1585366368408-204b700ce97b4a241a0b867e83f40530.jpg",
                  "avatar": "https://res.jaadee.net/merchantApi/other/2020-03-28/1585366373840-2e0b5c48e77cd5844bbd9a0659c72dee.jpg",
                  "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                  "mid": 3,
                  "bid": 3
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
                  "id": (context.base_sql_result[0]['id']),
                  "name": (context.base_sql_result[0]['attr_names']),
                  "price": (context.base_sql_result[0]['b_price']),
                  "stock": (context.base_sql_result[0]['b_stock']),
                  "image": (context.base_sql_result[0]['b_image'])
              }, {
                  "id": (context.base_sql_result[1]['id']),
                  "name": (context.base_sql_result[1]['attr_names']),
                  "price": (context.base_sql_result[1]['b_price']),
                  "stock": (context.base_sql_result[1]['b_stock']),
                  "image": (context.base_sql_result[1]['b_image'])
              },  {
                  "id": (context.base_sql_result[2]['id']),
                  "name": (context.base_sql_result[2]['attr_names']),
                  "price": (context.base_sql_result[2]['b_price']),
                  "stock": (context.base_sql_result[2]['b_stock']),
                  "image": (context.base_sql_result[2]['b_image'])
              },{
                  "id": (context.base_sql_result[3]['id']),
                  "name": (context.base_sql_result[3]['attr_names']),
                  "price": (context.base_sql_result[3]['b_price']),
                  "stock": (context.base_sql_result[3]['b_stock']),
                  "image": (context.base_sql_result[3]['b_image'])
              }, {
                  "id": (context.base_sql_result[4]['id']),
                  "name": (context.base_sql_result[4]['attr_names']),
                  "price": (context.base_sql_result[4]['b_price']),
                  "stock": (context.base_sql_result[4]['b_stock']),
                  "image": (context.base_sql_result[4]['b_image'])
              }, {
                  "id": (context.base_sql_result[5]['id']),
                  "name": (context.base_sql_result[5]['attr_names']),
                  "price": (context.base_sql_result[5]['b_price']),
                  "stock": (context.base_sql_result[5]['b_stock']),
                  "image": (context.base_sql_result[5]['b_image'])
              }, {
                  "id": (context.base_sql_result[6]['id']),
                  "name": (context.base_sql_result[6]['attr_names']),
                  "price": (context.base_sql_result[6]['b_price']),
                  "stock": (context.base_sql_result[6]['b_stock']),
                  "image": (context.base_sql_result[6]['b_image'])
              }, {
                  "id": (context.base_sql_result[7]['id']),
                  "name": (context.base_sql_result[7]['attr_names']),
                  "price": (context.base_sql_result[7]['b_price']),
                  "stock": (context.base_sql_result[7]['b_stock']),
                  "image": (context.base_sql_result[7]['b_image'])
              }],
              "share_info": {
                  "name": "CI-TEST专用自动化测试规格商品",
                  "logo": "https://res.jaadee.net/merchantApi/ykj/2020-04-16/1587007598392-06a17bda2eca567a3a1748adba64f4b0.jpeg?x-oss-process=style/logo",
                  "url": "",
                  "desc": "自动化测试规格商品",
                  "miniProgramObj": {
                      "userName": "gh_e43a43c28d43",
                      "path": "/pages/cuiyou/goods/detail?id=550"
                  }
              },
              "goods_refundable_time": (context.base_sql_result[0]['refundable_time']),
              "activeData": {}
          }
      }
    """