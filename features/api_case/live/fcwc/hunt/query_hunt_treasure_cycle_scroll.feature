# Created by shenping at 2020/4/23
Feature: 获取找货心愿单接口测试用例

  Scenario: [0]获取找货心愿单
    * 请求"query_hunt_treasure_cycle_scroll_url"接口，查询心愿单
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_ENV',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
     {
          "cacheType": "",
          "code": 0,
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "message": "获取找货需求滚动列表成功",
          "msg": "获取找货需求滚动列表成功",
          "status": 0
      }
    """