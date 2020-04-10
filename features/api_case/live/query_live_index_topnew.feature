# Created by shenping at 2020/4/8
Feature: 获取直播top list 接口测试用例

  Scenario: [0] 获取热播中直播数据
    * 请求"query_live_index_topnew_url"接口，获取热播中列表
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
            "data": {
                "channels": [{
                    "channelName": "热播中",
                    "id": 0,
                    "liveName": "",
                    "shareDesc": "超好看的直播推荐",
                    "shareTitle": "每日精选直播推荐",
                    "url": ""
                }, {
                    "channelName": "翡翠",
                    "id": 2,
                    "liveName": "feicui",
                    "shareDesc": "1231231",
                    "shareTitle": "123123",
                    "url": ""
                }, {
                    "channelName": "至宝甄选",
                    "id": 6,
                    "liveName": "zhibnaozhenxuan",
                    "shareDesc": "至宝甄选",
                    "shareTitle": "至宝甄选",
                    "url": ""
                }, {
                    "channelName": "翠友天地",
                    "id": 7,
                    "liveName": "翠友天地",
                    "shareDesc": "翠友天地",
                    "shareTitle": "翠友天地",
                    "url": ""
                }, {
                    "channelName": "更多",
                    "id": 3,
                    "liveName": "gengduo",
                    "shareDesc": "111111",
                    "shareTitle": "11111",
                    "url": ""
                }],
                "banners": [{
                    "cover": "",
                    "id": 1,
                    "navigate": "",
                    "params": "",
                    "sort": 0,
                    "status": 1,
                    "title": "问卷",
                    "type": 0
                }]
            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "info": {
                "channels": [{
                    "channelName": "热播中",
                    "id": 0,
                    "liveName": "",
                    "shareDesc": "超好看的直播推荐",
                    "shareTitle": "每日精选直播推荐",
                    "url": ""
                }, {
                    "channelName": "翡翠",
                    "id": 2,
                    "liveName": "feicui",
                    "shareDesc": "1231231",
                    "shareTitle": "123123",
                    "url": ""
                }, {
                    "channelName": "至宝甄选",
                    "id": 6,
                    "liveName": "zhibnaozhenxuan",
                    "shareDesc": "至宝甄选",
                    "shareTitle": "至宝甄选",
                    "url": ""
                }, {
                    "channelName": "翠友天地",
                    "id": 7,
                    "liveName": "翠友天地",
                    "shareDesc": "翠友天地",
                    "shareTitle": "翠友天地",
                    "url": ""
                }, {
                    "channelName": "更多",
                    "id": 3,
                    "liveName": "gengduo",
                    "shareDesc": "111111",
                    "shareTitle": "11111",
                    "url": ""
                }],
                "banners": [{
                    "cover": "",
                    "id": 1,
                    "navigate": "",
                    "params": "",
                    "sort": 0,
                    "status": 1,
                    "title": "问卷",
                    "type": 0
                }]
            },
            "message": "直播数据拉取成功",
            "msg": "直播数据拉取成功",
            "status": 0
        }
    """