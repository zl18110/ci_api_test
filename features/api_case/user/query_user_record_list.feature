# Created by shenping at 2020/4/25
Feature: 获取用户浏览足迹接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"jdcustomerstest.cus_user_record"
      """
        {"user_id":"2638122"}
      """
  
  Scenario: [0]获取用户足迹--宝贝
    * 运行以下sql,base 测试数据
    """
      "INSERT INTO `jdcustomerstest`.`cus_user_record`(`user_id`, `type`, `plat_id`, `logo`, `source_id`, `add_time`, `content`, `del_state`, `delete_time`, `cateId`, `data_version`, `cate_id`) VALUES (2638122, 0, 3, '/goods/thumb/3-NH030497.jpg', 189264, 1586340835, '{\"goodsSn\":\"NH030497\",\"title\":\"【宝玉石级】南红柿子红带黄冻喜上枝头挂件\"}', 0, NULL, NULL, NULL, NULL);"
    """
    * 运行以下sql,base测试数据
    """
      "INSERT INTO `jdcustomerstest`.`cus_user_record`(`user_id`, `type`, `plat_id`, `logo`, `source_id`, `add_time`, `content`, `del_state`, `delete_time`, `cateId`, `data_version`, `cate_id`) VALUES (2638122, 0, 3, '/goods/thumb/3-NH030501.jpg', 189268, 1586340864, '{\"goodsSn\":\"NH030501\",\"title\":\"【宝玉石级】南红玫瑰红镶18K玫瑰金耳坠\"}', 0, NULL, NULL, NULL, NULL);"
    """
    * 请求"query_user_record_list_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "page": 1,
            "pageSize": 10,
            "type": 0
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [{
              "sourceId": 189268,
              "atime": "2020-04-08 18:14:24",
              "goodsSn": "NH030501",
              "retrievalKey": 1,
              "count": 0,
              "orderby": 0,
              "title": "【宝玉石级】南红玫瑰红镶18K玫瑰金耳坠",
              "type": 0,
              "userId": 2638122,
              "content": {
                  "shopPrice": ""
              },
              "platId": 3,
              "shopPrice": 0.0,
              "goodsThumb": "/goods/thumb/3-NH030501.jpg"
          }, {
              "sourceId": 189264,
              "atime": "2020-04-08 18:13:55",
              "goodsSn": "NH030497",
              "retrievalKey": 2,
              "count": 0,
              "orderby": 0,
              "title": "【宝玉石级】南红柿子红带黄冻喜上枝头挂件",
              "type": 0,
              "userId": 2638122,
              "content": {
                  "shopPrice": ""
              },
              "platId": 3,
              "shopPrice": 0.0,
              "goodsThumb": "/goods/thumb/3-NH030497.jpg"
          }],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [{
              "sourceId": 189268,
              "atime": "2020-04-08 18:14:24",
              "goodsSn": "NH030501",
              "retrievalKey": 1,
              "count": 0,
              "orderby": 0,
              "title": "【宝玉石级】南红玫瑰红镶18K玫瑰金耳坠",
              "type": 0,
              "userId": 2638122,
              "content": {
                  "shopPrice": ""
              },
              "platId": 3,
              "shopPrice": 0.0,
              "goodsThumb": "/goods/thumb/3-NH030501.jpg"
          }, {
              "sourceId": 189264,
              "atime": "2020-04-08 18:13:55",
              "goodsSn": "NH030497",
              "retrievalKey": 2,
              "count": 0,
              "orderby": 0,
              "title": "【宝玉石级】南红柿子红带黄冻喜上枝头挂件",
              "type": 0,
              "userId": 2638122,
              "content": {
                  "shopPrice": ""
              },
              "platId": 3,
              "shopPrice": 0.0,
              "goodsThumb": "/goods/thumb/3-NH030497.jpg"
          }],
          "message": "足迹获取成功",
          "msg": "足迹获取成功",
          "status": 0
      }
    """

  Scenario: [1]获取用户足迹--内容
    * 运行以下sql,base 测试数据
    """
      "INSERT INTO `jdcustomerstest`.`cus_user_record`(`user_id`, `type`, `plat_id`, `logo`, `source_id`, `add_time`, `content`, `del_state`, `delete_time`, `cateId`, `data_version`, `cate_id`) VALUES (2638122, 1, NULL, 'https://res.jaadee.net/system/admindir/webupload/other/operate/2019-09-16/1568640109600-eee7471e7061c0a7e97832b094d82fe4.jpg', 2417, 1587435514, '{\"articleCatName\":\"\",\"articleIntro\":\"张志苗，云南保山人，云南省中级工艺美术师。2009年毕业于云南大学艺术设计系，2011年寻拜中国玉雕大师王朝阳门下学习玉石雕刻，2015年成立张志苗玉雕艺术研究室，2016年荣获云南玉雕师荣誉。\",\"clickViews\":1037,\"title\":\"玉雕人张志苗：力争与翡翠志同道合！\"}', 0, NULL, 20, NULL, NULL);"
    """
    * 运行以下sql,base测试数据
    """
      "INSERT INTO `jdcustomerstest`.`cus_user_record`(`user_id`, `type`, `plat_id`, `logo`, `source_id`, `add_time`, `content`, `del_state`, `delete_time`, `cateId`, `data_version`, `cate_id`) VALUES (2638122, 1, NULL, 'https://res.jaadee.net/system/admindir/webupload/other/operate/2019-10-19/1571467760333-e4b5ca0fdecf1101927115a2e1644ab8.jpg', 3586, 1587093340, '{\"articleCatName\":\"\",\"articleIntro\":\"\",\"clickViews\":2025,\"title\":\"#琢越杯评选——《观自在》种水、造型一绝！\"}', 0, NULL, 34, NULL, NULL);"
    """
    * 请求"query_user_record_list_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
            "page": 1,
            "pageSize": 10,
            "type": 1
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": [{
              "articleLogo": "https://res.jaadee.net/system/admindir/webupload/other/operate/2019-09-16/1568640109600-eee7471e7061c0a7e97832b094d82fe4.jpg",
              "sourceId": 2417,
              "atime": "2020-04-21 10:18:34",
              "retrievalKey": 1,
              "count": 0,
              "orderby": 0,
              "clickViews": "1037",
              "title": "玉雕人张志苗：力争与翡翠志同道合！",
              "type": 1,
              "userId": 2638122,
              "articleIntro": "张志苗，云南保山人，云南省中级工艺美术师。2009年毕业于云南大学艺术设计系，2011年寻拜中国玉雕大师王朝阳门下学习玉石雕刻，2015年成立张志苗玉雕艺术研究室，2016年荣获云南玉雕师荣誉。",
              "articleCatName": "",
              "shopPrice": 0.0
          }, {
              "articleLogo": "https://res.jaadee.net/system/admindir/webupload/other/operate/2019-10-19/1571467760333-e4b5ca0fdecf1101927115a2e1644ab8.jpg",
              "sourceId": 3586,
              "atime": "2020-04-17 11:15:40",
              "retrievalKey": 2,
              "count": 0,
              "orderby": 0,
              "clickViews": "2025",
              "title": "#琢越杯评选——《观自在》种水、造型一绝！",
              "type": 1,
              "userId": 2638122,
              "articleIntro": "",
              "articleCatName": "",
              "shopPrice": 0.0
          }],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [{
              "articleLogo": "https://res.jaadee.net/system/admindir/webupload/other/operate/2019-09-16/1568640109600-eee7471e7061c0a7e97832b094d82fe4.jpg",
              "sourceId": 2417,
              "atime": "2020-04-21 10:18:34",
              "retrievalKey": 1,
              "count": 0,
              "orderby": 0,
              "clickViews": "1037",
              "title": "玉雕人张志苗：力争与翡翠志同道合！",
              "type": 1,
              "userId": 2638122,
              "articleIntro": "张志苗，云南保山人，云南省中级工艺美术师。2009年毕业于云南大学艺术设计系，2011年寻拜中国玉雕大师王朝阳门下学习玉石雕刻，2015年成立张志苗玉雕艺术研究室，2016年荣获云南玉雕师荣誉。",
              "articleCatName": "",
              "shopPrice": 0.0
          }, {
              "articleLogo": "https://res.jaadee.net/system/admindir/webupload/other/operate/2019-10-19/1571467760333-e4b5ca0fdecf1101927115a2e1644ab8.jpg",
              "sourceId": 3586,
              "atime": "2020-04-17 11:15:40",
              "retrievalKey": 2,
              "count": 0,
              "orderby": 0,
              "clickViews": "2025",
              "title": "#琢越杯评选——《观自在》种水、造型一绝！",
              "type": 1,
              "userId": 2638122,
              "articleIntro": "",
              "articleCatName": "",
              "shopPrice": 0.0
          }],
          "message": "足迹获取成功",
          "msg": "足迹获取成功",
          "status": 0
      }
    """