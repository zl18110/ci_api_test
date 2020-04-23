# Created by shenping at 2020/4/9
Feature: 开启直播流程接口测试用例

  Scenario: [0]开启直播流程
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
            "liveLogo": (context.body['data']['nowLiveInfo']['liveLogo']),
            "liveMemberId": (context.body['data']['liveMember']['id']),
            "liveType": (context.body['data']['nowLiveInfo']['liveType']),
            "liveTitle":"(context.body['data']['nowLiveInfo']['liveTitle'])"
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
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "更改成功",
          "data": "40",
          "cache": ""
      }
    """

