# Created by shenping at 2020/4/7
Feature: 获取用户图文作品列表接口测试用例

  Scenario: [0] 获取用户图文列表
    * 请求"query_community_article_list_url"接口，查询
    """
      {'link_url':'?uid=2638122&page=1&pageSize=20',
        'http_method': 'get',
        'host':'operatetest.jaadee.net',
        'protocol':'http',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "status": 0,
          "code": 0,
          "msg": "获取动态",
          "message": "获取动态",
          "info": [{
              "id": 4018,
              "topic": 9,
              "privateTop": 1,
              "sourceUrl": null,
              "sourceDescription": null,
              "userId": 2638122,
              "type": 2,
              "cateId": 37,
              "title": "CI_TEST专用",
              "tags": "",
              "intro": "CI_TEST专用",
              "thumb": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "videoUri": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/2638122\/2020-04-07\/1586240372-232gmi.mp4",
              "imagesUri": "",
              "orderSn": "",
              "collectNumber": 0,
              "clickNumber": 0,
              "shareNumber": 0,
              "isStar": 0,
              "isTop": 0,
              "time": 1586240372,
              "ratio": null,
              "commentNumber": 0,
              "formal": 0,
              "date": "2020.04.07",
              "topicName": "翡翠的诞生",
              "author": {
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "typeId": 0,
                  "vip": 0,
                  "name": "翠友***6303"
              },
              "isCollected": false,
              "isConcerned": 0,
              "share": {
                  "userName": "",
                  "path": "",
                  "description": "",
                  "image": ""
              },
              "typeName": "视频"
          }],
          "data": [{
              "id": 4018,
              "topic": 9,
              "privateTop": 1,
              "sourceUrl": null,
              "sourceDescription": null,
              "userId": 2638122,
              "type": 2,
              "cateId": 37,
              "title": "CI_TEST专用",
              "tags": "",
              "intro": "CI_TEST专用",
              "thumb": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "videoUri": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/2638122\/2020-04-07\/1586240372-232gmi.mp4",
              "imagesUri": "",
              "orderSn": "",
              "collectNumber": 0,
              "clickNumber": 0,
              "shareNumber": 0,
              "isStar": 0,
              "isTop": 0,
              "time": 1586240372,
              "ratio": null,
              "commentNumber": 0,
              "formal": 0,
              "date": "2020.04.07",
              "topicName": "翡翠的诞生",
              "author": {
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "typeId": 0,
                  "vip": 0,
                  "name": "翠友***6303"
              },
              "isCollected": false,
              "isConcerned": 0,
              "share": {
                  "userName": "",
                  "path": "",
                  "description": "",
                  "image": ""
              },
              "typeName": "视频"
          }]
      }
    """