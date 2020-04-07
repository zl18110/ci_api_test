# Created by shenping at 2020/4/7
Feature: 获取用户关注店铺列表接口测试用例

  Scenario: [0] 获取用户关注店铺列表
    * 请求"query_focus_list_url"接口，
    """
      {'link_url':'?page=1&pageSize=10',
        'http_method': 'get',
        'host':'rnapitest.jaadee.net',
        'protocol':'https',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
            "code": 0,
            "message": "获取成功",
            "data": {
                "total": 1,
                "perPage": 10,
                "currentPage": 1,
                "lastPage": 1,
                "data": [{
                    "id": 3,
                    "real_name": "杨哥22楼",
                    "name": "杨哥22楼店铺",
                    "cover": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366368408-204b700ce97b4a241a0b867e83f40530.jpg",
                    "avatar": "https:\/\/res.jaadee.net\/merchantApi\/other\/2020-03-28\/1585366373840-2e0b5c48e77cd5844bbd9a0659c72dee.jpg",
                    "focus_num": 789
                }]
            },
            "cache": ""
        }
    """