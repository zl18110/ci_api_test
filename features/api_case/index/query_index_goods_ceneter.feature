# Created by shenping at 2020/4/8
Feature: 获取品牌大厅商品列表接口测试用例

  Scenario: [0] 获取品牌大厅商品
    * 请求"query_index_goods_ceneter_url"接口，获取商品
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_NEWAPI',
         'url_params':{
            "fromp": 1,
            "page": 1,
            "hashData": "",
            "pagesize": 10
        }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
        "status": 0,
        "msg": "新上商品获取成功",
        "info": [{
            "goodsId": 189272,
            "oldId": 30505,
            "goodsName": "【宝玉石级】南红柿子红圆珠手串",
            "goodsSn": "NH030505",
            "marketPrice": 6480,
            "shopPrice": "已结缘",
            "isSold": 1,
            "platId": 3,
            "goodsTag": "南红,手串\/手链",
            "isVideo": 1,
            "askPrice": 0,
            "peopleId": 0,
            "masterData": "",
            "activeTag": "",
            "activePrice": "已结缘",
            "activeLogo": "",
            "goodsThumb": "\/goods\/thumb\/3-NH030505.jpg"
        }, {
            "goodsId": 189269,
            "oldId": 30502,
            "goodsName": "南红冰飘8mm108珠珠串",
            "goodsSn": "NH030502",
            "marketPrice": 3456,
            "shopPrice": "已结缘",
            "isSold": 1,
            "platId": 3,
            "goodsTag": "南红,项链",
            "isVideo": 1,
            "askPrice": 0,
            "peopleId": 0,
            "masterData": "",
            "activeTag": "",
            "activePrice": "已结缘",
            "activeLogo": "",
            "goodsThumb": "\/goods\/thumb\/3-NH030502.jpg"
        }]
      }
    """