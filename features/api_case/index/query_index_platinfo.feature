# Created by shenping at 2020/4/8
Feature: 接口测试用例

  Scenario: [0]
    * 请求"query_index_platinfo_url"接口，
    """
      {'link_url':'?platId=1',
        'http_method': 'get',
        'evn':'CI_RNAPI',
        'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "数据获取成功",
          "data": {
              "platInfo": {
                  "1": {
                      "id": 1,
                      "name": "翡翠王朝",
                      "template_type": 1,
                      "logo": "rndir\/ios\/header\/kflb-logo1.png"
                  },
                  "2": {
                      "id": 2,
                      "name": "珠宝乐园",
                      "template_type": 1,
                      "logo": "rndir\/ios\/header\/kflb-logo2.png"
                  },
                  "3": {
                      "id": 3,
                      "name": "南红之谜",
                      "template_type": 2,
                      "logo": "rndir\/ios\/header\/kflb-logo3.png"
                  },
                  "4": {
                      "id": 4,
                      "name": "玉雕界",
                      "template_type": 2,
                      "logo": "rndir\/ios\/header\/kflb-logo4.png"
                  },
                  "5": {
                      "id": 5,
                      "name": "东方格度",
                      "template_type": 3,
                      "logo": "rndir\/ios\/header\/kflb-logo5.png"
                  },
                  "6": {
                      "id": 6,
                      "name": "学玉院",
                      "template_type": 1,
                      "logo": ""
                  },
                  "7": {
                      "id": 7,
                      "name": "翠友天地",
                      "template_type": 1,
                      "logo": ""
                  },
                  "8": {
                      "id": 8,
                      "name": "热播",
                      "template_type": 1,
                      "logo": ""
                  }
              },
              "cateInfo": [{
                  "name": "挂件",
                  "plat": "FCWC",
                  "catid": "22",
                  "logo": "https:\/\/appres.jaadee.com\/apps\/cat\/index-0-1.jpg"
              }, {
                  "name": "手镯",
                  "plat": "FCWC",
                  "catid": "19",
                  "logo": "https:\/\/appres.jaadee.com\/apps\/cat\/index-1-1.jpg"
              }, {
                  "name": "饰品",
                  "plat": "FCWC",
                  "catid": "20",
                  "logo": "https:\/\/appres.jaadee.com\/apps\/cat\/index-2-1.jpg"
              }, {
                  "name": "蛋面",
                  "plat": "FCWC",
                  "catid": "99",
                  "logo": "https:\/\/appres.jaadee.com\/apps\/cat\/index-3-1.jpg"
              }, {
                  "name": "杂项",
                  "plat": "FCWC",
                  "catid": "21",
                  "logo": "https:\/\/appres.jaadee.com\/apps\/cat\/index-4-1.jpg"
              }, {
                  "name": "全部",
                  "plat": "FCWC",
                  "catid": "0",
                  "logo": "https:\/\/appres.jaadee.com\/apps\/cat\/index-5-1.jpg"
              }],
              "advInfo": [{
                  "id": 255,
                  "plat_id": 1,
                  "position_id": 7,
                  "title": "东方格度夏季专场",
                  "navigate": "H5Page",
                  "url": "jadeking:\/\/JadeMarketGoodsDetail?goodsId=39",
                  "cover": "https:\/\/res.jaadee.net\/cuiyou\/images\/2020-02-10\/1581321373110-61fbd7da4a9bf18cca5be8880244775a.jpg",
                  "params": []
              }, {
                  "id": 52,
                  "plat_id": 1,
                  "position_id": 2,
                  "title": "每日推荐",
                  "navigate": "H5Page",
                  "url": "https:\/\/share.jaadee.net\/h5\/rntj\/rnlist.html",
                  "cover": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/article\/5a55607940081969debb8b9b7f7b1b27\/raw.jpg",
                  "params": []
              }]
          }
      }
    """