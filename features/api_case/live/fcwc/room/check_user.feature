# Created by shenping at 2020/4/10
Feature: 检查用户是否首次进入接口测试用例

  Background: 测试数据初始化
  * 删除测试数据"newapitest.common_live_count"
    """
      {"uid":"2638122"}
    """
  Scenario: [1]检查用户是否首次进入
    * 请求"shop_query_live_identities_url"接口，获取主播身份认证信息成功
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_SUP',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "cache": ""
      }
    """

    * 请求"query_live_start_url"接口，获取确认直播信息成功
    """
      {"link_url":"",
        "http_method": "get",
        "evn":"CI_SUP",
         "url_params":{
            "liveMemberId":(context.body['data']['isLive'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "data": {
              "liveMember": {
                  "id": 203,
                  "userName": "杨哥22楼",
                  "streamName": "yangjuyu",
                  "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/anchor\/b266bce66fa28ea5de707e8ad0115341\/200x200.jpg",
                  "honor": "翡翠王朝（昆明翡翠）",
                  "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                  "auth": 1,
                  "xmppUsername": "jaadee006",
                  "typeInfo": []
              }
          },
          "cache": ""
      }
    """

    * 请求"create_live_url"接口，开启直播成功
    """
      {"link_url":"",
        "http_method": "post",
        "evn":"CI_SUP",
         "url_params":{
            "anchorId": 0,
            "channelId": (context.body['data']['nowLiveInfo']['liveChannelId']),
            "liveId": (context.body['data']['nowLiveInfo']['id']),
            "liveLogo": "https://res.jaadee.net/cuiyou/images/2019-12-23/1577080504098-09e7695be9231aca33d15bf0cff89b36.jpg",
            "liveMemberId": (context.body['data']['liveMember']['id']),
            "liveTitle": "CI_API自动化测试",
            "liveType": (context.body['data']['nowLiveInfo']['liveType'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "cache": ""
      }
    """

  * 请求"update_live_anchor_status_url"接口，更改直播状态成功
    """
      {"link_url":"",
        "http_method": "post",
        "evn":"CI_SUP",
         "url_params":{
            "anchor_id":40,
            "room_id":(context.body['data']['liveInfo']['roomId']),
            "status":1
         }
      }
    """

    * 数据表"newapitest.common_live_list",使用逻辑"and",按字段"id"排序，查询最新记录
    """
      {"mid":"3","buid":"3","live_title":"CI_API自动化测试","status":"3"}
    """

    * 请求"live_details_url"接口，直播详情页获取,加入直播房间成功
    """
      {"link_url":"",
        "http_method": "post",
         "url_params":{
	        "liveId": (context.column_result['id'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "message": "直播详情页获取成功",
          "msg": "直播详情页获取成功",
          "status": 0
      }
    """

    * 请求"check_user_url"接口，检查用户是否首次进入 --首次进入
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "liveId": (context.column_result['id'])
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
              "is_first": true
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "is_first": true
          },
          "message": "获取成功",
          "msg": "获取成功",
          "status": 0
      }
    """
    * 请求"check_user_url"接口，检查用户是否首次进入--非首次进入
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "liveId": (context.column_result['id'])
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
              "is_first": false
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "is_first": false
          },
          "message": "获取成功",
          "msg": "获取成功",
          "status": 0
      }
    """