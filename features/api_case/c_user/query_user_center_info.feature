# Created by shenping at 2020/4/2
Feature: 获取用户center信息接口测试用例


  Scenario: [0]获取用户Center Info
    * 请求"query_user_center_info_url"接口，查询用户信息
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": {
              "avatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png?x-oss-process=image/resize,m_mfit,h_120,w_120",
              "birthday": "",
              "intro": "",
              "name": "翠友8276506303",
              "sex": 0,
              "sexDis": "",
              "uid": 2638122
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "avatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png?x-oss-process=image/resize,m_mfit,h_120,w_120",
              "birthday": "",
              "intro": "",
              "name": "翠友8276506303",
              "sex": 0,
              "sexDis": "",
              "uid": 2638122
          },
          "message": "ok",
          "msg": "ok",
          "status": 0
      }
    """