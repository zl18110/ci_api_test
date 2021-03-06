# Created by shenping at 2020/4/10
Feature: 获取当前账号下的主播信息接口测试用例

  Scenario: [0]获取当前账号下的主播信息
    * 请求"query_live_anchor_list_url"接口，获取当前账号下的主播信息
    """
      {"link_url":"",
        "http_method": "get",
        "evn":"CI_SUP",
         "url_params":{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "data": [{
              "id": 30,
              "live_member_id": 203,
              "name": "张三",
              "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/live\/3c238b3fb6da1a18bc0e65594e940662\/raw.jpg",
              "desc": "这是一个悲伤的故事，主播效能收按时大大大奥术大师多群大多所阿斯顿发送到发送到阿达",
              "sort": 13,
              "create_time": 1551421718,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 45,
              "live_member_id": 203,
              "name": "欧阳分清娃",
              "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/live\/5438984d3dc87d4c1b4d801d6463e06d\/360x360.jpg",
              "desc": "这是一个悲伤的故事，主播效能收按时大大大奥术大师多群大多所阿斯顿发送到发送到阿达",
              "sort": 11,
              "create_time": 1552023696,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 39,
              "live_member_id": 203,
              "name": "王麻子",
              "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/live\/94d8ac8ec10ffd84137cdc1e2cb24716\/raw.jpg",
              "desc": "阿萨德gas登记卡山东矿机暗红色的空间哈克斯较低或卡死的客户反馈结合实际等复活卡还是打卡哈萨克奥斯卡的卡卷合适的空间和器物等哈师大卡机卡卷山东矿机暗红色的空间啊哈萨克德哈卡手机端卡坚实的卡号山东矿机安徽",
              "sort": 10,
              "create_time": 1551427168,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 46,
              "live_member_id": 203,
              "name": "hel world",
              "avatar": null,
              "desc": "这是一个悲伤的故事，主播效能收按时大大大奥术大师多群大多所阿斯顿发送到发送到阿达",
              "sort": 7,
              "create_time": 1552023819,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 40,
              "live_member_id": 203,
              "name": "韩梅梅",
              "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/live\/de71bef84c71495e1d69c00fd226ec01\/raw.jpg",
              "desc": "主播玩的溜",
              "sort": 5,
              "create_time": 1551490175,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 31,
              "live_member_id": 203,
              "name": "李四",
              "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/live\/6cea946d85201e049eb6681a01a1191e\/raw.jpg",
              "desc": null,
              "sort": 2,
              "create_time": 1551421757,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 10,
              "live_member_id": 203,
              "name": "yangphp",
              "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/live\/632b596ed4ba6f9d5144891223a3d04f\/raw.jpg",
              "desc": null,
              "sort": 0,
              "create_time": 0,
              "del_state": 0,
              "live_account_id": null
          }, {
              "id": 50,
              "live_member_id": 203,
              "name": "大声道多多",
              "avatar": null,
              "desc": "深圳市version",
              "sort": 0,
              "create_time": 1559009541,
              "del_state": 0,
              "live_account_id": null
          }],
          "cache": ""
      }
    """