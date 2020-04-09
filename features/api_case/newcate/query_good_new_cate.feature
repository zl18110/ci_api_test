# Created by shenping at 2020/4/8
Feature: 获取新品分类列表接口测试用例

  Scenario: [0] 获取新品商品分类
    * 请求"query_good_new_cate_url"接口，获取新品分类
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_RNAPI',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
            "code": 0,
            "message": "获取成功",
            "data": [{
                "id": 1,
                "name": "挂件"
            }, {
                "id": 2,
                "name": "手镯"
            }, {
                "id": 3,
                "name": "珠串"
            }, {
                "id": 4,
                "name": "镶金首饰"
            }, {
                "id": 5,
                "name": "戒面裸石"
            }, {
                "id": 6,
                "name": "和田玉"
            }, {
                "id": 7,
                "name": "南红"
            }, {
                "id": 8,
                "name": "琥珀蜜蜡"
            }, {
                "id": 9,
                "name": "彩色宝石"
            }]
        }
    """