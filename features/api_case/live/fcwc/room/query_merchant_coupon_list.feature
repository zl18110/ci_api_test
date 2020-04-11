# Created by shenping at 2020/4/11
Feature: 获取直播优惠信息接口测试用例

  Scenario: [0]获取直播优惠信息
    * 请求"query_merchant_coupon_list_url"接口，获取信息
    """
      {'link_url':'?liveMemberId=203&pageSize=200',
        'http_method': 'get',
        'evn':'CI_OP',
         'url_params':{
            "uid":(context.fcwcuser['data']['uid'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取成功",
          "data": {
              "total": 1,
              "perPage": "200",
              "currentPage": 1,
              "lastPage": 1,
              "data": [{
                  "id": 510,
                  "type": 2,
                  "name": "满减杨哥",
                  "intro": "满减杨哥直播间",
                  "rate": "0.00",
                  "discount": 40,
                  "ruleMoney": 500,
                  "startTime": "2020.03.21",
                  "endTime": "2029.03.21",
                  "sign": "3-510",
                  "restNum": 970,
                  "received": 0
              }]
          }
      }
    """