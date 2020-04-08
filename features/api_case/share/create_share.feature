# Created by shenping at 2020/4/8
Feature: 生成分享海报接口测试用例

  Scenario Outline: [0]生成分享海报
    * 请求"create_share_url"接口，生成分享海报
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':<param>
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "status": 0
      }
    """
    Examples: -- <remarks>
      | param                                                     |remarks             |
      |{"type":"4","source_id":"0","extraParams":"","isNews":"1"}       |品牌大厅列表图片生成           |
      |{"type":"6","source_id":"0","isNews":"1","extraParams":"{\"id\":0}"}|一口价活动列表图片缓存获取       |
      |{"source_id":"0","extraParams":"","type":"5","isNews":"1"}          |翠友天地列表图片生成        |
      |{"source_id":"0","type":"3","extraParams":"","isNews":"1"}          |拍卖列表海报生成        |
      |{"type":"1","isNews":"1","extraParams":"","source_id":"0"}          |直播列表海报生成        |