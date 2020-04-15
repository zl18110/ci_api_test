# Created by shenping at 2020/4/15
Feature: 获取用户优惠信息php接口测试用例


  Scenario: [0]获取用户直播优惠信息(PHP接口)
    * 请求"query_merchant_coupon_php_list_url"接口，获取用户优惠信息
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_OP',
         'url_params':{
          "uid":(context.fcwcuser['data']['uid']),
          "liveMemberId":203,
          "pageSize":200
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