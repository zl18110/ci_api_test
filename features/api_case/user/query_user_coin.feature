# Created by shenping at 2020/4/21
Feature: 查询用户推广费接口测试用例

  Scenario: [0] 查询用户推广收益
    * 请求"query_user_coin_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_RNAPI',
         'url_params':{
         }
      }
    """
    * 运行以下sql,查询用户数据库推广费用数据
    """
      "SELECT a.uid,sum(CASE WHEN a.operation IN (1,5,6) AND a.STATUS=2 AND a.type=1 THEN a.coin ELSE 0 END) AS spreadRewards,sum(CASE WHEN a.operation IN (1,5,6) AND a.STATUS=1 AND a.type=1 THEN a.coin ELSE 0 END) AS freezeRewards,sum(CASE WHEN a.operation=1 AND a.STATUS=2 AND a.type=1 THEN a.coin ELSE 0 END) AS spreadOrderRewards,sum(CASE WHEN a.operation=12 AND a.STATUS=1 AND a.type=2 THEN a.coin ELSE 0 END) AS disavailableRewards,sum(CASE WHEN (a.operation=1 AND del_state=0) THEN 1 ELSE 0 END) AS spreadOrderCount FROM cus_user_coin_logs a WHERE a.uid=2638122;"
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "success",
          "data": {
              "memberType": 1,
              "isMember": True,
              "spreadOrderRewards": float((context.base_sql_result[0]['spreadOrderRewards'])),
              "spreadRewards": float((context.base_sql_result[0]['spreadRewards'])),
              "availableRewards": float((context.base_sql_result[0]['spreadRewards'])-(context.base_sql_result[0]['disavailableRewards'])),
              "spreadOrderCount": float((context.base_sql_result[0]['spreadOrderCount'])),
              "freezeRewards": float((context.base_sql_result[0]['freezeRewards'])),
              "qrcode": ""
          }
      }
    """