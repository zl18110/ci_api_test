# Created by shenping at 2020/4/18
Feature: 获取用户rewards type 接口测试用例

  Scenario: [0]获取用户rewards type
    * 请求"query_user_rewards_type_url"接口，查询rewards type
    """
      {'link_url':'',
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
          "message": "success",
          "data": {
              "memberType": 1
          }
      }
    """