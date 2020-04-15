# Created by shenping at 2020/4/15
Feature: 直播间关注主播接口测试用例

  Scenario: [0]取消关注主播
    * 请求"create_live_focus_url"接口，取消关注主播
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "liveMemberId": 203,
              "act": 2
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "操作成功",
          "msg": "操作成功",
          "status": 0
      }
    """

  Scenario: [0]直播间关注主播
    * 请求"create_live_focus_url"接口，关注主播
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "liveMemberId": 203,
              "act": 1
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "关注成功",
          "msg": "关注成功",
          "status": 0
      }
    """
    * 请求"create_live_focus_url"接口，取消关注主播
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "liveMemberId": 203,
              "act": 2
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "操作成功",
          "msg": "操作成功",
          "status": 0
      }
    """
