# Created by shenping at 2020/4/8
Feature: 根据频道获取直播数据接口测试用例

  Scenario: [0] 热播中频道获取直播数据
    * 请求"query_live_index_listnew_url"接口，获取直播数据
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "channelId":0
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "message": "根据频道获取直播数据成功",
          "msg": "根据频道获取直播数据成功",
          "status": 0
      }
    """