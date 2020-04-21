# Created by shenping at 2020/4/18
Feature: 获取用户等级接口测试用例


  Scenario: [0]获取用户等级
    * 运行以下sql,查询base数据
    """
      "select a.* from jdcustomerstest.cus_user_score  a where a.uid =2638122 limit 1;"
    """
    * 请求"query_user_real_level_url"接口，查询用户等级
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": {
              "score": (context.base_sql_result[0]['available_score']),
              "vipLevel":(context.base_sql_result[0]['rlevel']),
              "level": (context.base_sql_result[0]['level']),
              "levelDisplay": (context.base_sql_result[0]['level_display']),
              "totalScore": (context.base_sql_result[0]['total_score'])
          },
          "displayAlert": False,
          "displayTip": False,
          "hashData": "",
          "info": {
              "score": (context.base_sql_result[0]['available_score']),
              "vipLevel":(context.base_sql_result[0]['rlevel']),
              "level": (context.base_sql_result[0]['level']),
              "levelDisplay": (context.base_sql_result[0]['level_display']),
              "totalScore": (context.base_sql_result[0]['total_score'])
          },
          "message": "数据获取成功",
          "msg": "数据获取成功",
          "status": 0
      }
    """