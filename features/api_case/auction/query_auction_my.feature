# Created by shenping at 2020/4/7
Feature: 获取我的拍卖接口测试用例

  Scenario Outline: [0] 获取我的拍卖
    * 请求"query_auction_my_url"接口，查询
    """
      {'link_url':'?status=<status>&limit=10&offset=0&user_type=person',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "data": {
              "count": 0,
              "result": []
          },
          "message": "OK",
          "code": 0,
          "status": 200
      }
    """
    Examples: --<remarks>
      |status    |remarks|
      |ongoing   |拍卖中    |
      |remind    |拍卖提醒   |
      |success   |拍卖成功   |
      |failed    |拍卖失败   |