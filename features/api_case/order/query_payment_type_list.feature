# Created by shenping at 2020/4/2
Feature: 获取支付列表接口测试用例

  Scenario: [0]获取支付列表
    * 请求"query_payment_type_list_url"接口，获取支付列表
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "pid": "2dea30ae",
            "mag": "tKB7Tm6vzHLgeZylMxe5yA=="
         }
      }
    """
    * 验证接口返回码"200"

    * 验证接口返回值
    """
      {
          "pid": "2dea30ae"
      }
    """