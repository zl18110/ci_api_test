# Created by shenping at 2020/4/8
Feature: 获取我关注的直播间接口测试用例

  Scenario: [0]获取我关注的直播间列表
    * 请求"query_live_focus_list_url"接口，获取直播间
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "page": 1,
              "pageSize": 20
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "message": "关注直播拉取成功",
          "msg": "关注直播拉取成功",
          "status": 0
      }
    """