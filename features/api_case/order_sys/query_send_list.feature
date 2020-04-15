# Created by shenping at 2020/4/1
Feature: 后台订单系统-快捷发货查询所有订单

  Scenario: [0]快捷发货查询所有订单
    * 请求"goods_send_list_url"后台接口，快捷发货查询所有订单
    """
      {'link_url':'?filter=&limit=24&recycle=0&status=0',
        'http_method': 'get',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
      """
        {'code': 0, 'msg': '数据获取成功'}
      """