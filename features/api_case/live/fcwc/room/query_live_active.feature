# Created by shenping at 2020/4/15
Feature: 获取直播间活动接口测试用例

  Background: 测试数据初始化
#    * 删除测试数据"operatemanagetest.active_live_list"
#    """
#      {"id":"5"}
#    """
#    * 运行以下sql,添加测试数据
#    """
#      "INSERT INTO `operatemanagetest`.`active_live_list`(`id`, `active_title`, `active_type`, `out_escape`, `url`, `start_time`, `end_time`, `status`, `allow_param`, `is_show_title`, `allow_live_member`, `img_url`, `remark`, `is_delete`, `create_time`, `update_time`, `shop_status`) VALUES (5, 'CI_TEST自动化测试专用', 'liveVote', 1, 'https://test-auction.jaadee.com/activity/share-win-prize?id=9&title=活动大转盘', '2019-11-26 00:00:00', '2030-04-29 00:00:00', 1, 'uid,liveId,roomId,liveMemberId', 1, '203,1,248', 'https://res.jaadee.net/2x.png', 'test1', 0, '2019-11-26 11:51:49', '2020-04-02 11:21:56', 0);"
#    """
    * 数据表"newapitest.common_live_list",使用逻辑"and",按字段"id"排序，查询最新记录
    """
      {"live_member_id":"203"}
    """
  Scenario: [0] 获取直播间波动
    * 请求"query_live_active_url"接口，获取直播间活动
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_OP',
         'url_params':{
            "roomid": 110111,
            "liveId": 110,
            "liveMemberId": 203
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "msg": "数据获取成功",
          "status": 0,
          "info": [{
              "outEscape": true,
              "activeTitle": "CI_TEST自动化测试专用",
              "activeType": "liveVote",
              "Url": "https:\/\/test-auction.jaadee.com\/activity\/share-win-prize?id=9&title=活动大转盘&liveId=110&liveMemberId=203&isShowTitle=true",
              "imgUrl": "https:\/\/res.jaadee.net\/2x.png",
              "startTime": "2019-11-26 00:00:00",
              "endTime": "2030-04-29 00:00:00"
          }]
      }
    """