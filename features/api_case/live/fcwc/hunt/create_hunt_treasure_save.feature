# Created by shenping at 2020/4/23
Feature: 新增或修改找货需求接口测试用例
  Background: 测试数据初始化
    * 删除测试数据"newapitest.common_live_treasure_hunt"
    """
      {"user_id":"2638122"}
    """

  Scenario: [0]新增找货需求
    * 请求"create_hunt_treasure_save_url"接口，新增
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "braceletCircleIds": 1,
            "budgetRangeIds": 3,
            "budgetRemark": "很好",
            "description": "测试",
            "labelIds": "1,4,8,15,19",
            "styleIds": "1"
         }
      }
    """
    * 数据表"newapitest.common_live_treasure_hunt" 使用逻辑"and"按字段"id"排序，查询最新记录
    """
      {"user_id":"2638122"}
    """

    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": {
              "adminStatus": (context.column_result['admin_status']),
              "braceletCircleIds": (context.column_result['bracelet_circle_ids']),
              "braceletCircleList": [{
                  "circleValue": "52~53毫米",
                  "id": 1
              }],
              "budgetRangeIds": "3",
              "budgetRangeList": [{
                  "id": 3,
                  "rangeValue": "2万~5万"
              }],
              "budgetRemark": "很好",
              "createTime": (context.column_result['creat_time']),
              "description": "测试",
              "huntTime": 86400,
              "id": (context.column_result['id']),
              "labelIds": "1,4,8,15,19",
              "labelList": [{
                  "categoryId": 1,
                  "id": 1,
                  "labelImgUrl": "",
                  "labelName": "男士"
              }, {
                  "categoryId": 2,
                  "id": 4,
                  "labelImgUrl": "",
                  "labelName": "传家"
              }, {
                  "categoryId": 3,
                  "id": 8,
                  "labelImgUrl": "",
                  "labelName": "翡翠"
              }, {
                  "categoryId": 4,
                  "id": 15,
                  "labelImgUrl": "",
                  "labelName": "豪镶"
              }, {
                  "categoryId": 5,
                  "id": 19,
                  "labelImgUrl": "",
                  "labelName": "满绿"
              }],
              "remark": "",
              "status": 0,
              "styleIds": "1",
              "styleList": [{
                  "categoryId": "1",
                  "id": 1,
                  "styleImgUrl": "https://res.jaadee.net/app/findgoods/style/ic-shouzhuo-01.png",
                  "styleName": "圆条镯"
              }],
              "updateTime": (context.column_result['update_time']),
              "userAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png",
              "userId": 2638122,
              "userName": "翠友8276506303"
          },
          "displayAlert": False,
          "displayTip": False,
          "hashData": "",
          "info": {
              "adminStatus": (context.column_result['admin_status']),
              "braceletCircleIds": (context.column_result['bracelet_circle_ids']),
              "braceletCircleList": [{
                  "circleValue": "52~53毫米",
                  "id": 1
              }],
              "budgetRangeIds": "3",
              "budgetRangeList": [{
                  "id": 3,
                  "rangeValue": "2万~5万"
              }],
              "budgetRemark": "很好",
              "createTime": (context.column_result['creat_time']),
              "description": "测试",
              "huntTime": 86400,
              "id": (context.column_result['id']),
              "labelIds": "1,4,8,15,19",
              "labelList": [{
                  "categoryId": 1,
                  "id": 1,
                  "labelImgUrl": "",
                  "labelName": "男士"
              }, {
                  "categoryId": 2,
                  "id": 4,
                  "labelImgUrl": "",
                  "labelName": "传家"
              }, {
                  "categoryId": 3,
                  "id": 8,
                  "labelImgUrl": "",
                  "labelName": "翡翠"
              }, {
                  "categoryId": 4,
                  "id": 15,
                  "labelImgUrl": "",
                  "labelName": "豪镶"
              }, {
                  "categoryId": 5,
                  "id": 19,
                  "labelImgUrl": "",
                  "labelName": "满绿"
              }],
              "remark": "",
              "status": 0,
              "styleIds": "1",
              "styleList": [{
                  "categoryId": "1",
                  "id": 1,
                  "styleImgUrl": "https://res.jaadee.net/app/findgoods/style/ic-shouzhuo-01.png",
                  "styleName": "圆条镯"
              }],
              "updateTime": (context.column_result['update_time']),
              "userAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png",
              "userId": 2638122,
              "userName": "翠友8276506303"
          },
          "message": "保存找货需求成功",
          "msg": "保存找货需求成功",
          "status": 0
      }
    """
  Scenario: [1]修改找货需求
    * 请求"create_hunt_treasure_save_url"接口，新增找货需求
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "braceletCircleIds": 1,
            "budgetRangeIds": 3,
            "budgetRemark": "很好",
            "description": "测试",
            "labelIds": "1,4,8,15,19",
            "styleIds": "1"
         }
      }
    """
    * 验证接口返回码"200"

    * 数据表"newapitest.common_live_treasure_hunt" 使用逻辑"and"按字段"id"排序，查询最新记录
    """
      {"user_id":"2638122"}
    """

    * 请求"create_hunt_treasure_save_url"接口，修改找货需求
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "braceletCircleIds": "",
            "budgetRangeIds": 4,
            "budgetRemark": "自动化",
            "description": "自动化",
            "labelIds": "1,4,8,15,19",
            "styleIds": "31",
            "id": (context.column_result['id'])
         }
      }
    """
    * 数据表"newapitest.common_live_treasure_hunt" 使用逻辑"and"按字段"id"排序，查询最新记录
    """
      {"user_id":"2638122","description":"自动化","budget_remark":"自动化","label_ids":"1,4,8,15,19","budget_range_ids":"4","style_ids":"31"}
    """

    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": {
              "adminStatus": (context.column_result['admin_status']),
              "braceletCircleIds": (context.column_result['bracelet_circle_ids']),
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
              "createTime": (context.column_result['creat_time']),
              "description": "自动化",
              "huntTime": 86400,
              "id": (context.column_result['id']),
              "labelIds": "1,4,8,15,19",
              "labelList": [{
                  "categoryId": 1,
                  "id": 1,
                  "labelImgUrl": "",
                  "labelName": "男士"
              }, {
                  "categoryId": 2,
                  "id": 4,
                  "labelImgUrl": "",
                  "labelName": "传家"
              }, {
                  "categoryId": 3,
                  "id": 8,
                  "labelImgUrl": "",
                  "labelName": "翡翠"
              }, {
                  "categoryId": 4,
                  "id": 15,
                  "labelImgUrl": "",
                  "labelName": "豪镶"
              }, {
                  "categoryId": 5,
                  "id": 19,
                  "labelImgUrl": "",
                  "labelName": "满绿"
              }],
              "remark": "",
              "status": 0,
              "styleIds": "31",
              "styleList": [{
                  "categoryId": "6",
                  "id": 31,
                  "styleImgUrl": "https://res.jaadee.net/app/findgoods/style/ic-zalei-03.png",
                  "styleName": "印章"
              }],
              "updateTime": (context.column_result['update_time']),
              "userAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png",
              "userId": 2638122,
              "userName": "翠友8276506303"
          },
          "displayAlert": False,
          "displayTip": False,
          "hashData": "",
          "info": {
              "adminStatus": (context.column_result['admin_status']),
              "braceletCircleIds": (context.column_result['bracelet_circle_ids']),
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
              "createTime": (context.column_result['creat_time']),
              "description": "自动化",
              "huntTime": 86400,
              "id": (context.column_result['id']),
              "labelIds": "1,4,8,15,19",
              "labelList": [{
                  "categoryId": 1,
                  "id": 1,
                  "labelImgUrl": "",
                  "labelName": "男士"
              }, {
                  "categoryId": 2,
                  "id": 4,
                  "labelImgUrl": "",
                  "labelName": "传家"
              }, {
                  "categoryId": 3,
                  "id": 8,
                  "labelImgUrl": "",
                  "labelName": "翡翠"
              }, {
                  "categoryId": 4,
                  "id": 15,
                  "labelImgUrl": "",
                  "labelName": "豪镶"
              }, {
                  "categoryId": 5,
                  "id": 19,
                  "labelImgUrl": "",
                  "labelName": "满绿"
              }],
              "remark": "",
              "status": 0,
              "styleIds": "31",
              "styleList": [{
                  "categoryId": "6",
                  "id": 31,
                  "styleImgUrl": "https://res.jaadee.net/app/findgoods/style/ic-zalei-03.png",
                  "styleName": "印章"
              }],
              "updateTime": (context.column_result['update_time']),
              "userAvatar": "https://res.jaadee.net/appdir/ios/user/images/2019-10-09/userDefault.png",
              "userId": 2638122,
              "userName": "翠友8276506303"
          },
          "message": "保存找货需求成功",
          "msg": "保存找货需求成功",
          "status": 0
      }
    """
  Scenario: [2]恢复测试数据