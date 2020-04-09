# Created by shenping at 2020/4/8
Feature: 按分类获取新品商品接口测试用例

  Scenario Outline: [1] 按分类获取新品商品列表
    * 请求"query_good_new_url"接口，获取新品商品
    """
      {'link_url':'?cate=<cate>&page=1',
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
        "message": "获取成功"
      }
    """
    Examples:  -- <remarks>
    |cate|remarks|
    |0   |推荐     |
    |1   |挂件     |
    |2   |手镯     |
    |3   |珠串     |
    |4   |镶金首饰   |
    |5   |戒面裸石   |
    |6   |和田玉    |
    |7   |南红     |
    |8   |琥珀蜜蜡   |
    |9   |彩色宝石   |