# Created by shenping at 2020/4/8
Feature: 获取分享广告接口测试用例

  Scenario: [0] 获取分享广告
    * 请求"query_advertisement_share_url"接口，获取分享广告
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
          "msg": "分享广告获取成功",
          "info": {
              "navigate": "",
              "url": "jadeking:\/\/Home?index=3&secondIndex=0&thirdIndex=0",
              "cover": "https:\/\/res.jaadee.net\/cuiyou\/images\/2020-02-18\/1582014734613-c76b9b0123b773832b14e8a8ddcd1e7b.png",
              "title": "多赢宝会员分享广告",
              "params": "",
              "env_url": "",
              "xcx_url_type": 0
          },
          "hashData": "",
          "cacheType": "none",
          "code": 0,
          "message": "分享广告获取成功",
          "data": {
              "navigate": "",
              "url": "jadeking:\/\/Home?index=3&secondIndex=0&thirdIndex=0",
              "cover": "https:\/\/res.jaadee.net\/cuiyou\/images\/2020-02-18\/1582014734613-c76b9b0123b773832b14e8a8ddcd1e7b.png",
              "title": "多赢宝会员分享广告",
              "params": "",
              "env_url": "",
              "xcx_url_type": 0
          }
      }
    """