# Created by shenping at 2020/4/21
Feature: 生成分享链接接口测试用例


  Scenario: [0]生成会员分享链接
    * 请求"create_share_url"接口，生成会员分享
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
              "source_id": 0,
              "type": 100
         }
      }
    """
    * 验证接口body包含
    """
      {
          "cacheType": "",
          "code": 0,
          "data": "2638122_vip_",
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": "2638122_vip_",
          "message": "成功",
          "msg": "成功",
          "status": 0
      }
    """