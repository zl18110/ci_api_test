# Created by shenping at 2020/4/25
Feature: 获取用户拍卖保证金接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"auction_db19_test.core_auction_marginrecord"
    """
      {"payer":"2638122"}
    """
  Scenario: [0] 获取用户拍卖保证金
    * 运行以下sql,base测试数据
    """
      "INSERT INTO `auction_db19_test`.`core_auction_marginrecord`(`payer`, `pay_no`, `amount`, `status`, `create_at`, `update_at`, `auction_id`, `refund_no`, `delete`, `deduct_time`, `pay_time`, `return_time`, `violate_time`, `pay_source`) VALUES (2638122, 'BZ2042315453256817', 10, 'return', '2020-04-23 15:45:32.593839', '2020-04-23 15:50:26.352999', 55572, NULL, 0, NULL, '2020-04-23 15:45:57.597163', '2020-04-23 15:50:26.352465', NULL, NULL);"
    """
    * 请求"query_user_margin_url"接口，
    """
      {'link_url':'?limit=10&offset=0',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "message": "OK",
          "code": 0,
          "status": 200,
          "data": {
              "count": 1,
              "amount": null,
              "result": [{
                  "auction_id": 55572,
                  "update_at": 1587628226000,
                  "title": "\u624b\u52a8\u6d4b\u8bd5\u62cd\u5356\u5546\u54c1_505978",
                  "amount": 10.0,
                  "status": "return"
              }]
          }
      }
    """
  Scenario: [1]测试现场恢复