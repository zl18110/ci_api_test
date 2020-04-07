# Created by shenping at 2020/4/7
Feature: 获取鉴宝直播间列表接口测试用例

  Scenario: [0] 获取鉴宝直播间列表
    * 请求"query_jianbao_live_list_url"接口，查询直播间
    """
      {'link_url':'',
        'http_method': 'get',
        'host':'test-auction.jaadee.com',
        'protocol':'http',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"