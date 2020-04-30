# Created by shenping at 2020/4/10
Feature: 获取直播间历史聊天消息接口测试用例

  Scenario: [0]获取历史聊天消息

    * 请求"query_live_chatRoom_msg_history_url"接口，获取历史聊天消息
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "roomId": 172870430,
            "pageSize": 20,
            "timetag": int(round(time.time() * 1000))
         }
      }
    """
    * 接口返回码"200"