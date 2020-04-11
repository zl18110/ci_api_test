# Created by shenping at 2020/4/10
Feature: 获取直播间分享提示词接口测试用例

  Scenario: [0]获取直播间分享提示词
    * 请求"query_advertisement_share_words_url"接口，获取分享提示词
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_NEWAPI',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "status": 0,
          "msg": "获取分享提示词成功",
          "info": {
              "sharedWords": "分享直播赚现金，分享多赚钱多"
          },
          "hashData": "",
          "cacheType": "none",
          "code": 0,
          "message": "获取分享提示词成功",
          "data": {
              "sharedWords": "分享直播赚现金，分享多赚钱多"
          }
      }
    """