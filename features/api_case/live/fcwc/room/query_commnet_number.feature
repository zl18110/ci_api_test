# Created by shenping at 2020/4/11
Feature: 获取评论总数接口测试用例

  Scenario: [0]获取评论总数
    * 请求"query_comment_number_url"接口，获取评论总数
    """
      {'link_url':'?moduleId=1&sourceId=203',
        'http_method': 'get',
        'evn':'CI_OP',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "status": 0,
          "code": 0,
          "msg": "评论总数！",
          "message": "评论总数！",
          "info": {
              "moduleId": 1,
              "sourceId": 203
          },
          "data": {
              "moduleId": 1,
              "sourceId": 203
          }
      }
    """