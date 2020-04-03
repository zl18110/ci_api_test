# Created by shenping at 2020/4/2
Feature: 获取用户红包卡券接口测试用例

  Background: 测试数据初始化
  
  Scenario: [0] 获取用户红包卡券
    * 请求"query_user_info_statistic_url"接口，查询红包卡券
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
              "countRed": 8,
              "countFollow": 0,
              "countCollect": 0,
              "countRecord": 0
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "countRed": 8,
              "countFollow": 0,
              "countCollect": 0,
              "countRecord": 0
          },
          "message": "获取数据成功",
          "msg": "获取数据成功",
          "status": 0
      }
    """