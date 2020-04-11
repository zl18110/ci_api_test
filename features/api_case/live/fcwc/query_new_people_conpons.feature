# Created by shenping at 2020/4/8
Feature: 获取新人大礼包接口测试用例

  Scenario: [0] 获取新人大礼包
    * 请求"query_new_people_conpons_url"接口，获取新人大礼包
    """
      {'link_url':'',
        'http_method': 'post',
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
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "新人大礼包获取成功",
          "msg": "新人大礼包获取成功",
          "status": 0
      }
    """