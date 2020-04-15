# Created by shenping at 2020/4/15
Feature: 获取等级total score接口测试用例
  #这个需要登录正式环境获取token

  Scenario: [0]获取等级total score
    * 请求"query_level_total_score_url"接口，获取总等级
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_SHARE',
         'url_params':{
            "token":(context.fcwcuser['data']['accessToken']),
            "uid":(context.fcwcuser['data']['uid'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      []
    """