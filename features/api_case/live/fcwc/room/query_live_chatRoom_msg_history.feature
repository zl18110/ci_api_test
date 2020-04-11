# Created by shenping at 2020/4/10
Feature: 获取直播间历史聊天消息接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"newapitest.fcwc_chatroom_history_msg"
    """
      {"id":"89729"}
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `newapitest`.`fcwc_chatroom_history_msg`(`id`, `del_state`, `avatar`, `content`, `content_normal`, `create_time`, `create_user_id`, `display`, `from_account`, `from_client_type`, `from_device_id`, `from_nick`, `live_member_id`, `msg_group`, `msg_timestamp`, `msg_type`, `msgid_server`, `room_id`, `uid`, `update_time`, `update_user_id`, `msg_source`, `msg_send_source`) VALUES (89729, 0, 'rn/userUpload/mine/setting/2638320/2020-03-23/1584941954-xzcnfn.jpg?x-oss-process=image/resize,m_mfit,h_750,w_750', '高规格', '高规格', '2020-04-09 18:15:19', 2638320, 0, '0d7cd810261c601ae6f2988eb0890db0', 'IOS', NULL, '三哈', 203, 1, 1586427319158, NULL, '06e1cd26dc9447db915b07d833ed1021', 169179009, 2638320, '2020-04-09 18:15:19', NULL, 0, 0);"
    """
  Scenario: [0]获取历史聊天消息
    * 请求"query_live_chatRoom_msg_history_url"接口，获取历史聊天消息
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "roomId": 169179009,
            "pageSize": 20,
            "timetag": 1586482669307
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": [{
              "avatar": "rn/userUpload/mine/setting/2638320/2020-03-23/1584941954-xzcnfn.jpg?x-oss-process=image/resize,m_mfit,h_750,w_750",
              "content": "高规格",
              "fromAccount": "0d7cd810261c601ae6f2988eb0890db0",
              "fromClientType": "IOS",
              "fromDeviceId": "",
              "fromNick": "三哈",
              "id": 89729,
              "level": 0,
              "liveMemberId": 203,
              "msgGroup": "groupchat",
              "msgSendSource": 0,
              "msgSource": 0,
              "msgTimestamp": 1586427319158,
              "msgType": 0,
              "msgidServer": "06e1cd26dc9447db915b07d833ed1021",
              "roomId": 169179009,
              "uid": 2638320,
              "vipLevel": 0
          }],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [{
              "avatar": "rn/userUpload/mine/setting/2638320/2020-03-23/1584941954-xzcnfn.jpg?x-oss-process=image/resize,m_mfit,h_750,w_750",
              "content": "高规格",
              "fromAccount": "0d7cd810261c601ae6f2988eb0890db0",
              "fromClientType": "IOS",
              "fromDeviceId": "",
              "fromNick": "三哈",
              "id": 89729,
              "level": 0,
              "liveMemberId": 203,
              "msgGroup": "groupchat",
              "msgSendSource": 0,
              "msgSource": 0,
              "msgTimestamp": 1586427319158,
              "msgType": 0,
              "msgidServer": "06e1cd26dc9447db915b07d833ed1021",
              "roomId": 169179009,
              "uid": 2638320,
              "vipLevel": 0
          }],
          "message": "返回成功",
          "msg": "返回成功",
          "status": 0
      }
    """