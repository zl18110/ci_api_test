# Created by shenping at 2020/4/25
Feature: 用户推广收益明细接口测试用例

  Scenario: [0] 获取用户推广收益明细
    * 请求"query_user_rewards_log_url"接口，查询
    """
      {'link_url':'?type=0&page=1&pageSize=20',
        'http_method': 'get',
        'evn':'CI_RNAPI',
         'url_params':{
         }
      }
    """
    * 验证接口body包含以下字段
    """
      {
          "code": 0,
          "message": "success",
          "data": {
              "total": '',
              "perPage": "20",
              "currentPage": 1,
              "lastPage": '',
              "data": [{
                  "uid": 2638122,
                  "coin": "1.50",
                  "type": 1,
                  "operation": "已购买1单",
                  "showName": "翠友***6303",
                  "showAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png"
              }, {
                  "uid": 2638122,
                  "coin": "1.50",
                  "type": 1,
                  "operation": "已购买1单",
                  "showName": "翠友***6303",
                  "showAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png"
              }]
          }
      }
    """