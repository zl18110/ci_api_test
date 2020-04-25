# Created by shenping at 2020/4/11
Feature: 直播间消息发送接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"newapitest.fcwc_chatroom_history_msg"
    """
      {"create_user_id":"2638122"}
    """
  Scenario: [0]直播间消息发送
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
  * 数据表"newapitest.common_live_list",使用逻辑"and",按字段"id"排序，查询最新记录
    """
      {"mid":"3","buid":"3","status":"3"}
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
          "data": {
              "liveInfo": {
                  "addLikes": 0,
                  "addRank": 0,
                  "cover": (context.column_result['cover']),
                  "createTime": (context.column_result['create_time']),
                  "endTime": 0,
                  "hideGoods": (context.column_result['hide_goods']),
                  "id": (context.column_result['id']),
                  "images": (context.column_result['images']),
                  "images2": (context.column_result['images2']),
                  "isBlack": 0,
                  "isDelete": 0,
                  "isRecommend": (context.column_result['is_recommend']),
                  "isRed": 0,
                  "isRemind": 0,
                  "isYellow": 0,
                  "keyword": (context.column_result['keyword']),
                  "likes": (context.column_result['likes']),
                  "liveChannelId": 58,
                  "liveDesc": (context.column_result['live_desc']),
                  "liveMember": {
                      "accid": "",
                      "announcement": "11111",
                      "avatar": "https://res.jaadee.net/newupload/rnAdmin/upload/manage/anchor/b266bce66fa28ea5de707e8ad0115341/200x200.jpg",
                      "cover": "",
                      "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                      "extend": "",
                      "honor": "翡翠王朝（昆明翡翠）",
                      "id": 0,
                      "isFocus": 0,
                      "likeNum": 0,
                      "liveAddress": "深圳",
                      "liveIntroduction": "11111",
                      "memberConcern": 0,
                      "mid": 3,
                      "nowLiveMemberAvatar": "https://res.jaadee.net/newupload/rnAdmin/upload/manage/live/de71bef84c71495e1d69c00fd226ec01/raw.jpg",
                      "nowLiveMemberDesc": "主播玩的溜",
                      "nowLiveMemberId": 40,
                      "nowLiveMemberName": "韩梅梅",
                      "purchaseNotice": "22222",
                      "streamName": "",
                      "userName": "杨哥22楼",
                      "warmReminder": "自动化测试：欢迎进入直播间，严禁发布广告、联系方式等信息，请文明发言.",
                      "xmppUsername": ""
                  },
                  "liveMemberId": 203,
                  "liveMemberUid": 51,
                  "liveRoomId": (context.column_result['roomid']),
                  "liveTitle": (context.column_result['live_title']),
                  "liveTotalPeople": 0,
                  "liveTotalRecord": 0,
                  "liveType": 3,
                  "liveTypeName": "",
                  "noticeDesc": "",
                  "oldId": 0,
                  "orderby": 0,
                  "port": 0,
                  "portStatus": 0,
                  "recordPath": "",
                  "relay": 0,
                  "roomid": (context.column_result['roomid']),
                  "serverInfo": {
                      "appShow": 0,
                      "avatar": "https://appres.jaadee.net/kfpic/avatar/jaadee006.jpg",
                      "createdTime": 0,
                      "del_state": 0,
                      "id": 332,
                      "intro": "",
                      "online": 0,
                      "order": 0,
                      "platId": 0,
                      "pot_OrtType": "desc",
                      "pot_Page": 0,
                      "pot_PageSize": 20,
                      "qrcode": "",
                      "status": 0,
                      "userId": 0,
                      "username": "双艳",
                      "webShow": 0,
                      "xmppPassword": "",
                      "xmppUsername": "jaadee006"
                  },
                  "startTime": (context.column_result['start_time']),
                  "status": 3,
                  "synchro": 0,
                  "threadCount": 0,
                  "totalPeople": 0,
                  "userLevel": {
                      "honor": "隐士",
                      "level": 0,
                      "nextLevel": 25,
                      "signType": 0,
                      "url": "https://sharetest.jaadee.net/h5/level/detail.html",
                      "welcome": "欢迎 隐士 翠友***6303 进入直播间"
                  }
              },
              "webWxShare": {
                  "desc": (context.column_result['live_desc']),
                  "liveMemberId": 203,
                  "logo": "https://res.jaadee.net/cuiyou/images/2019-12-23/1577080498659-f660925eea08a243de7e182ab86d6848.jpg_appshareLogo",
                  "name": "我在翡翠王朝看【杨哥22楼】直播，行家把关，源头直播。",
                  "utl": ""
              },
              "purchaseGuideShow": 0
          },
          "hashData": "",
          "info": {
              "liveInfo": {
                  "addLikes": 0,
                  "addRank": 0,
                  "cover": (context.column_result['cover']),
                  "createTime": (context.column_result['create_time']),
                  "endTime": 0,
                  "hideGoods": ((context.column_result['hide_goods'])),
                  "id": (context.column_result['id']),
                  "images": (context.column_result['images']),
                  "images2": (context.column_result['images2']),
                  "isBlack": 0,
                  "isDelete": 0,
                  "isFocus": 1,
                  "isRecommend": (context.column_result['is_recommend']),
                  "isRed": 0,
                  "isRemind": 0,
                  "isYellow": 0,
                  "keyword": (context.column_result['keyword']),
                  "likes": (context.column_result['likes']),
                  "liveChannelId": 58,
                  "liveDesc": (context.column_result['live_desc']),
                  "liveMember": {
                      "accid": "",
                      "announcement": "11111",
                      "avatar": "https://res.jaadee.net/newupload/rnAdmin/upload/manage/anchor/b266bce66fa28ea5de707e8ad0115341/200x200.jpg",
                      "cover": "",
                      "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                      "extend": "",
                      "honor": "翡翠王朝（昆明翡翠）",
                      "id": 0,
                      "isFocus": 0,
                      "likeNum": 0,
                      "liveAddress": "深圳",
                      "liveIntroduction": "11111",
                      "memberConcern": 0,
                      "mid": 3,
                      "nowLiveMemberAvatar": "https://res.jaadee.net/newupload/rnAdmin/upload/manage/live/de71bef84c71495e1d69c00fd226ec01/raw.jpg",
                      "nowLiveMemberDesc": "主播玩的溜",
                      "nowLiveMemberId": 40,
                      "nowLiveMemberName": "韩梅梅",
                      "purchaseNotice": "22222",
                      "streamName": "",
                      "userName": "杨哥22楼",
                      "warmReminder": "自动化测试：欢迎进入直播间，严禁发布广告、联系方式等信息，请文明发言.",
                      "xmppUsername": ""
                  },
                  "liveMemberId": 203,
                  "liveMemberUid": 51,
                  "liveRoomId": (context.column_result['roomid']),
                  "liveTitle": (context.column_result['live_title']),
                  "liveTotalPeople": 0,
                  "liveTotalRecord": 0,
                  "liveType": 3,
                  "liveTypeName": "",
                  "noticeDesc": "",
                  "oldId": 0,
                  "orderby": 0,
                  "port": 0,
                  "portStatus": 0,
                  "recordPath": "",
                  "relay": 0,
                  "roomid": (context.column_result['roomid']),
                  "serverInfo": {
                      "appShow": 0,
                      "avatar": "https://appres.jaadee.net/kfpic/avatar/jaadee006.jpg",
                      "createdTime": 0,
                      "del_state": 0,
                      "id": 332,
                      "intro": "",
                      "online": 0,
                      "order": 0,
                      "platId": 0,
                      "pot_OrtType": "desc",
                      "pot_Page": 0,
                      "pot_PageSize": 20,
                      "qrcode": "",
                      "status": 0,
                      "userId": 0,
                      "username": "双艳",
                      "webShow": 0,
                      "xmppPassword": "",
                      "xmppUsername": "jaadee006"
                  },
                  "startTime": (context.column_result['start_time']),
                  "status": 3,
                  "synchro": 0,
                  "threadCount": 0,
                  "totalPeople": 0,
                  "userLevel": {
                      "honor": "隐士",
                      "level": 0,
                      "nextLevel": 25,
                      "signType": 0,
                      "url": "https://sharetest.jaadee.net/h5/level/detail.html",
                      "welcome": "欢迎 隐士 翠友***6303 进入直播间"
                  }
              },
              "webWxShare": {
                  "desc": (context.column_result['live_desc']),
                  "liveMemberId": 203,
                  "logo": "https://res.jaadee.net/cuiyou/images/2019-12-23/1577080498659-f660925eea08a243de7e182ab86d6848.jpg_appshareLogo",
                  "name": "我在翡翠王朝看【杨哥22楼】直播，行家把关，源头直播。",
                  "utl": ""
              },
              "purchaseGuideShow": 0
          },
          "message": "直播详情页获取成功",
          "msg": "直播详情页获取成功",
          "status": 0
      }
    """
    * 请求"live_chatroom_msg_send_url"接口，发送消息
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "roomid": (context.column_result['roomid']),
              "content": "666",
              "liveMemberId": 203,
              "type": "groupchat"
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
          "message": "发送成功",
          "msg": "发送成功",
          "status": 0
      }
    """
    * 使用逻辑"and",查询数据库"newapitest.fcwc_chatroom_history_msg"
    """
      {"create_user_id":"2638122"}
    """
    * 验证数据库返回值
    """
      [{
          'del_state': 0,
          'avatar': 'https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png',
          'content': '666',
          'content_normal': None,
          'create_user_id': 2638122,
          'display': 0,
          'from_account': '882aba83909efb480f1e5c819e9fcfdc',
          'from_client_type': 'OTHER',
          'from_device_id': None,
          'live_member_id': 203,
          'msg_group': 1,
          'msg_type': None,
          'uid': 2638122,
          'update_user_id': None,
          'msg_source': 0,
          'msg_send_source': 0
      }]
    """