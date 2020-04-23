# Created by shenping at 2020/4/23
Feature: 获取找货历史接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"newapitest.common_live_treasure_hunt"
    """
      {"user_id":"2638122"}
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `newapitest`.`common_live_treasure_hunt`(`user_id`, `phone`, `description`, `remark`, `admin_status`, `status`, `creat_time`, `del_state`, `budget_remark`, `label_ids`, `style_ids`, `bracelet_circle_ids`, `budget_range_ids`, `update_time`, `user_avatar`, `user_name`) VALUES (2638122, '12888886303', '自动化', NULL, 0, 0, 1587632480, 0, '自动化', '1,4,8,15,19', '31', '1', '4', 1587632480, 'https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png', '翠友8276506303');"
    """

  Scenario: [0] 获取找货历史
    * 请求"query_hunt_treasure_list_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "page": 1,
            "pageSize": 15
         }
      }
    """

    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": [{
              "adminStatus": 0,
              "braceletCircleIds": "1",
              "braceletCircleList": [{
                  "circleValue": "52~53毫米",
                  "id": 1
              }],
              "budgetRangeIds": "4",
              "budgetRangeList": [{
                  "id": 4,
                  "rangeValue": "5万~10万"
              }],
              "budgetRemark": "自动化",
              "createTime": 1587632480,
              "description": "自动化",
              "labelIds": "1,4,8,15,19",
              "remark": "",
              "status": 0,
              "styleIds": "31",
              "styleList": [{
                  "categoryId": "6",
                  "id": 31,
                  "styleImgUrl": "https://res.jaadee.net/app/findgoods/style/ic-zalei-03.png",
                  "styleName": "印章"
              }],
              "updateTime": 1587632480,
              "userAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png",
              "userId": 2638122,
              "userName": "翠友8276506303"
          }],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [{
              "adminStatus": 0,
              "braceletCircleIds": "1",
              "braceletCircleList": [{
                  "circleValue": "52~53毫米",
                  "id": 1
              }],
              "budgetRangeIds": "4",
              "budgetRangeList": [{
                  "id": 4,
                  "rangeValue": "5万~10万"
              }],
              "budgetRemark": "自动化",
              "createTime": 1587632480,
              "description": "自动化",
              "labelIds": "1,4,8,15,19",
              "remark": "",
              "status": 0,
              "styleIds": "31",
              "styleList": [{
                  "categoryId": "6",
                  "id": 31,
                  "styleImgUrl": "https://res.jaadee.net/app/findgoods/style/ic-zalei-03.png",
                  "styleName": "印章"
              }],
              "updateTime": 1587632480,
              "userAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png",
              "userId": 2638122,
              "userName": "翠友8276506303"
          }],
          "message": "获取找货需求列表成功",
          "msg": "获取找货需求列表成功",
          "status": 0
      }
    """
  Scenario: [1]测试数据恢复