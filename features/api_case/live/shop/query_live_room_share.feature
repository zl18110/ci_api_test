# Created by shenping at 2020/4/10
Feature: 获取直播分享数据接口测试用例

  Scenario: [0]获取分享数据接口
    * 请求"query_live_room_share_url"接口，获取分享数据接口
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_SUP',
         'url_params':{
            'page':'1',
            'pageSize':'300',
            'roomId':'169179009'
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取分享数据成功",
          "cache": ""
      }
    """