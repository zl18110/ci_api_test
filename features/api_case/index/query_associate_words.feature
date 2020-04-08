# Created by shenping at 2020/4/8
Feature: 自定义词语搜索关键字接口测试用例

  Scenario: [0] 获取自定义搜索关键字结果
    * 请求"query_associate_words_url"接口，搜索关键字
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_NEWAPI',
         'url_params':{
              "word": "宝"
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "status": 0,
          "msg": "返回数据成功",
          "info": ["蓝宝石", "红宝石", "宝宝佛", "蓝宝石戒指", "红宝石裸石", "星光蓝宝石", "蓝宝石裸石", "鉴宝", "海蓝宝", "蓝宝石男戒"],
          "hashData": "",
          "cacheType": "none",
          "code": 0,
          "message": "返回数据成功",
          "data": ["蓝宝石", "红宝石", "宝宝佛", "蓝宝石戒指", "红宝石裸石", "星光蓝宝石", "蓝宝石裸石", "鉴宝", "海蓝宝", "蓝宝石男戒"]
      }
    """