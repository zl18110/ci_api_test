# Created by shenping at 2020/4/8
Feature: 按关键字搜索商品接口测试用例

  Scenario: [0]关键字搜索商品
    * 请求"query_search_dosearch_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_NEWAPI',
         'url_params':{
              "keyword": "红宝石",
              "page": 1,
              "limit": 10
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "status": 0,
          "msg": "返回数据成功",
          "info": {
              "goodsList": {
                  "data": [{
                      "goodsId": 241698,
                      "goodsName": "18K金镶天然红宝石戒指",
                      "goodsSn": "JW055211",
                      "marketPrice": 2200,
                      "shopPrice": 1500,
                      "isSold": 0,
                      "platId": 2,
                      "goodsTag": "戒指,红宝石",
                      "isVideo": 1,
                      "askPrice": 0,
                      "peopleId": 0,
                      "masterData": "",
                      "activeTag": "",
                      "activePrice": 0,
                      "activeLogo": "",
                      "goodsThumb": "\/goods\/thumb\/2-JW055211.jpg"
                  }]
              },
              "articleList": {
                  "data": [{
                      "articleId": 5066,
                      "platId": 1,
                      "articleType": 4,
                      "articleName": "精品红宝石戒指：宝石、钻石、制作工艺绝对都是杠杠的！👍",
                      "articleIntro": "精品红宝石戒指：宝石、钻石、制作工艺绝对都是杠杠的！👍",
                      "logoId": 100002,
                      "createTime": "2020-02-02 15:33:37",
                      "catName": "",
                      "logo": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/362726\/2020-02-02\/1580628816-dt1cj2.jpg"
                  }],
                  "files": {
                      "100008": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/410500\/2019-12-20\/1576843110-j7swff.mp4?x-oss-process=video\/snapshot,t_100,f_jpg,w_0,h_0,m_fast,ar_auto"
                  }
              }
          },
          "hashData": "",
          "cacheType": "none",
          "code": 0,
          "message": "返回数据成功",
          "data": {
              "goodsList": {
                  "data": [{
                      "goodsId": 241698,
                      "goodsName": "18K金镶天然红宝石戒指",
                      "goodsSn": "JW055211",
                      "marketPrice": 2200,
                      "shopPrice": 1500,
                      "isSold": 0,
                      "platId": 2,
                      "goodsTag": "戒指,红宝石",
                      "isVideo": 1,
                      "askPrice": 0,
                      "peopleId": 0,
                      "masterData": "",
                      "activeTag": "",
                      "activePrice": 0,
                      "activeLogo": "",
                      "goodsThumb": "\/goods\/thumb\/2-JW055211.jpg"
                  }]
              },
              "articleList": {
                  "data": [{
                      "articleId": 4211,
                      "platId": 1,
                      "articleType": 2,
                      "articleName": "💞💕18k镶嵌血珀指环，颜色极美圈口17mm红宝石镶嵌点缀。喜欢的不要错过[鼓掌][鼓掌]",
                      "articleIntro": "💞💕18k镶嵌血珀指环，颜色极美圈口17mm红宝石镶嵌点缀。喜欢的不要错过[鼓掌][鼓掌]",
                      "logoId": 100008,
                      "catName": "",
                      "logo": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/410500\/2019-12-20\/1576843110-j7swff.mp4?x-oss-process=video\/snapshot,t_100,f_jpg,w_0,h_0,m_fast,ar_auto"
                  }],
                  "files": {
                      "100008": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/410500\/2019-12-20\/1576843110-j7swff.mp4?x-oss-process=video\/snapshot,t_100,f_jpg,w_0,h_0,m_fast,ar_auto"
                  }
              }
          }
      }
    """