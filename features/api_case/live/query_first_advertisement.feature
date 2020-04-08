# Created by shenping at 2020/4/8
Feature: 接口测试用例

  Background: 测试数据初始化
  
  Scenario: [0]
    * 请求"query_first_advertisement_url"接口，
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "scenes": "LiveTabNavigator"
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
            "cacheType": "none",
            "code": 0,
            "data": {
                "LiveTabNavigator": {
                    "cover": "https://res.jaadee.net/cuiyou/images/2019-12-31/1577784810570-be5e2fb11cccd94857bed47299c13658.png",
                    "url": "https://test-auction.jaadee.com/choujiang/zero-luck-draw"
                }
            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "info": {
                "LiveTabNavigator": {
                    "cover": "https://res.jaadee.net/cuiyou/images/2019-12-31/1577784810570-be5e2fb11cccd94857bed47299c13658.png",
                    "url": "https://test-auction.jaadee.com/choujiang/zero-luck-draw"
                }
            },
            "message": "获取成功",
            "msg": "获取成功",
            "status": 0
        }
    """