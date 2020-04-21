# Created by shenping at 2020/4/21
Feature: 获取用户收藏列表接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"jdcustomerstest.cus_user_collect"
    """
      {"user_id":"2638122"}
    """
    * 运行以下sql,base测试数据
    """
      "INSERT INTO `jdcustomerstest`.`cus_user_collect`(`id`, `user_id`, `type`, `plat_id`, `logo`, `source_id`, `add_time`, `content`, `status`, `del_state`, `origin`, `data_version`) VALUES (13, 2638122, 0, 3, 'https://res.jaadee.net//goods/thumb/3-NH030501.jpg', 189268, 1586340819, '{\"goodsSn\":\"NH030501\",\"isSold\":\"0\",\"shopPrice\":\"5780\",\"title\":\"【宝玉石级】南红玫瑰红镶18K玫瑰金耳坠\"}', 0, 0, NULL, NULL);"
    """
  
  Scenario: [0]获取用户收藏列表--宝贝
    * 请求"query_user_collect_list_url"接口，获取用户收藏
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_NEWAPI',
         'url_params':{
            "page": 1,
            "pagesize": 10,
            "type": 0
         }
      }
    """
    * 验证接口返回值
    """
      {
          "status": 0,
          "msg": "收藏数据获取成功",
          "info": {
              "list": [{
                  "id": 13,
                  "userId": 2638122,
                  "type": 0,
                  "platId": 3,
                  "logo": "https:\/\/res.jaadee.net\/\/goods\/thumb\/3-NH030501.jpg",
                  "sourceId": 189268,
                  "addTime": 1586340819,
                  "content": {
                      "goodsSn": "NH030501",
                      "isSold": "0",
                      "shopPrice": "5780",
                      "title": "【宝玉石级】南红玫瑰红镶18K玫瑰金耳坠"
                  },
                  "status": 0,
                  "delState": 0,
                  "origin": null,
                  "dataVersion": null
              }],
              "page": {
                  "currentPage": 1,
                  "pagesize": 10,
                  "totalCount": 1,
                  "perPage": 10,
                  "lastPage": 1
              }
          }
      }
    """

    Scenario: [1] 获取用户收藏列表-内容
      * 运行以下sql,base测试数据
      """
        "INSERT INTO `jdcustomerstest`.`cus_user_collect`(`id`, `user_id`, `type`, `plat_id`, `logo`, `source_id`, `add_time`, `content`, `status`, `del_state`, `origin`, `data_version`) VALUES (21, 2638122, 1, NULL, 'https://res.jaadee.net/system/admindir/webupload/other/operate/2019-09-16/1568640109600-eee7471e7061c0a7e97832b094d82fe4.jpg', 2417, 1587434930, '{\"catName\":\"test\",\"title\":\"玉雕人张志苗：力争与翡翠志同道合！\"}', 0, 0, NULL, NULL);"
      """
      * 请求"query_user_favorites_list_url"接口，获取收藏内容
      """
        {'link_url':'?page=1&pagesize=10&type=1',
          'http_method': 'get',
          'evn':'CI_OP',
           'url_params':{
           }
        }
      """
      * 接口返回码"200"

  Scenario: [2]测试现场恢复