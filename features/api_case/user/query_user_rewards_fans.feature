# Created by shenping at 2020/4/25
Feature: 获取用户粉丝接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"jdcustomerstest.cus_user_bind"
    """
      {"uid":"2638122"}
    """
  Scenario: [0]获取粉丝
    * 运行以下sql,base测试数据
    """
      "INSERT INTO `jdcustomerstest`.`cus_user_bind` (`uid`,`usetype`,`bind_uid`,`bind_time`,`del_state`,`pars`,`data_version`) VALUES (2638122,1,2638122,'2020-03-23 11:00:07',0,'',NULL);"
    """
    * 请求"query_user_rewards_fans_url"接口，查询粉丝
    """
      {'link_url':'?fansType=2&page=1&pageSize=20',
        'http_method': 'get',
        'evn':'CI_RNAPI',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "success",
          "data": {
              "exclusive": 0,
              "ordinary": 1,
              "sum": "302.44",
              "list": [{
                  "uid": 2638122,
                  "name": "\u7fe0\u53cb***6303",
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "bindTime": "2020-03-23 11:00",
                  "isMember": 1,
                  "num": 194,
                  "sum": "302.44"
              }, {
                  "uid": 2638122,
                  "name": "\u7fe0\u53cb***6303",
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "bindTime": "2020-02-24 17:41",
                  "isMember": 1,
                  "num": 194,
                  "sum": "302.44"
              }]
          }
      }
    """
  Scenario: [1]测试现场恢复
