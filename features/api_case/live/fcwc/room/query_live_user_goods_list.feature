# Created by shenping at 2020/4/10
Feature: 用户获取直播间商品列表接口测试用例

  Scenario: [0]用户获取直播间商品列表
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
        {"mid":"3","buid":"3","live_title":"CI_API自动化测试","status":"3"}
      """
    * 请求"query_live_user_goods_list_url"接口，用户获取直播间商品列表
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "liveId": (context.column_result['id']),
            "liveListType": 3
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "message": "暂无商品列表数据",
          "msg": "暂无商品列表数据",
          "status": 0
      }
    """