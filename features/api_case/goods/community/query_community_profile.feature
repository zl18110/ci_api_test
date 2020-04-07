# Created by shenping at 2020/4/7
Feature: 获取用户翠友个人信息接口测试用例

  Scenario: [0] 获取用户翠友信息
    * 请求"query_community_profile_url"接口，查询
    """
      {'link_url':'?uid=2638122',
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
          "msg": "获取个人信息成功！",
          "message": "获取个人信息成功！",
          "info": {
              "uid": 2638122,
              "nickname": "翠友***6303",
              "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
              "focusNumber": 1,
              "fansNumber": 0,
              "likeNumber": 0,
              "introduction": "",
              "authenticateId": 0,
              "identity": 0,
              "identityName": "",
              "logo": "",
              "subscript": "",
              "vip": 0,
              "isConcerned": 0
          },
          "data": {
              "uid": 2638122,
              "nickname": "翠友***6303",
              "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
              "focusNumber": 1,
              "fansNumber": 0,
              "likeNumber": 0,
              "introduction": "",
              "authenticateId": 0,
              "identity": 0,
              "identityName": "",
              "logo": "",
              "subscript": "",
              "vip": 0,
              "isConcerned": 0
          }
      }
    """