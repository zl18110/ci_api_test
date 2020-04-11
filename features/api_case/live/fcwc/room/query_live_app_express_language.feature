# Created by shenping at 2020/4/10
Feature: 获取直播聊天快捷语接口测试用例

  Scenario: [0] 获取直播聊天快捷语
    * 请求"query_live_app_express_language_url"接口,获取直播聊天快捷语
    """
      {"link_url":"",
        "http_method": "get",
         "url_params":{
         }
      }
    """
    * 接口返回码"200"

    * 使用逻辑"and" 查询数据库"newapitest.app_express_language"
    """
      {"status":"1"}
    """

    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [{
              "content": (context.sql_result[0]['content']),
              "createTime": (context.sql_result[0]['createTime']),
              "create_time": (context.sql_result[0]['create_time']),
              "del_state": (context.sql_result[0]['del_state']),
              "id": (context.sql_result[0]['id']),
              "pot_OrtType": "desc",
              "pot_Page": 0,
              "pot_PageSize": 20,
              "sort": (context.sql_result[0]['sort']),
              "status": 1
          },{
              "content": (context.sql_result[1]['content']),
              "createTime": (context.sql_result[1]['createTime']),
              "create_time": (context.sql_result[1]['create_time']),
              "del_state": (context.sql_result[1]['del_state']),
              "id": (context.sql_result[1]['id']),
              "pot_OrtType": "desc",
              "pot_Page": 0,
              "pot_PageSize": 20,
              "sort": (context.sql_result[1]['sort']),
              "status": 1
          }],
          "message": "获取热词成功",
          "msg": "获取热词成功",
          "status": 0
      }
    """


