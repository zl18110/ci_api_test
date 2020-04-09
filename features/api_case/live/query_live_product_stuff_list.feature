# Created by shenping at 2020/4/8
Feature: 查询直播臻品好货列表接口测试用例


  Scenario: [0]查询臻品好货列表
    * 请求"query_live_product_stuff_list_url"接口，查询臻品好货列表
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "pageNo": 1,
	        "pageSize": 20
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
        "cacheType": "",
        "code": 0,
        "message": "查询商品信息成功",
        "msg": "查询商品信息成功",
        "status": 0
      }
    """