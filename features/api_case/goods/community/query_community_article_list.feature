# Created by shenping at 2020/4/7
Feature: 获取用户图文作品列表接口测试用例
  Background: 测试数据初始化
    * 运行以下sql,删除测试数据
    """
      "delete from `operatemanagetest`.`op_content_topic` where id =9;"
    """
    * 运行以下sql,base测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_topic`(`id`, `topic`, `description`, `cover`, `logo`, `start_time`, `end_time`, `active`, `sort`, `created_at`, `updated_at`, `deleted_at`, `del_state`) VALUES (9, '翡翠的诞生', '翡翠A货：纯天然翡翠。只经过传统温和的表面酸或表面墩蜡处理，其翡翠的结构未受到腐蚀和破坏。翡翠B货：翡翠在加工过程中经过了人工的化学处理，通过酸浸漂白，墩蜡处理来达到去除杂质、去肮点的效果，翡翠内部结构受到很大程度的破坏。翡翠C货：为染色翡翠。不管酸浸漂白与否，充胶与否，人工加色的翡翠称C货。配戴通过化学处理过的B货、C货翡翠对人体会造成潜在的危害。\n而更让人沮丧的是，不少翠友花了A货的价钱却只买了B货或C货的翡翠，一戴多年却浑然不知。当前翡翠造假手段层出不穷，就算是老行家仅凭肉眼有时候也无法分辨翡翠的真假，所以当你对身边的翡翠有任何疑虑时，最好将翡翠送到专业的鉴定机构做鉴别', 'https://res.jaadee.net/cuiyou/images/2019-12-10/1575948330102-2fd2fe2507e6d824de8bf7289b81f44c.jpg', 'https://res.jaadee.net/cuiyou/images/2019-12-10/1575948323114-11abc2d1b48b10e402db519e6b7ba528.jpg', 1575907200, 1607529600, 1, 5, '2019-12-10 11:27:20', '2020-05-09 13:36:55', NULL, 0);"
    """
    * 运行以下sql,删除测试数据
    """
      "delete from `operatemanagetest`.`op_content_info` where id =4018;"
    """

    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_info`(`id`, `user_id`, `type`, `cate_id`, `title`, `tags`, `intro`, `intro_base64`, `content`, `thumb`, `videoUri`, `imagesUri`, `orderSn`, `collect_num`, `click_num`, `share_num`, `is_star`, `is_top`, `is_delete`, `created_at`, `updated_at`, `time`, `formal`, `recommend_group`, `is_home`, `sort`, `thumb_width`, `thumb_height`, `thumb_number`, `comment_number`, `private_top`, `raw`, `video_width`, `video_height`, `del_state`, `click_num_mock`, `collect_num_mock`, `share_num_mock`, `is_big`, `display`, `topic`, `ip`, `district`, `location`, `show_district`) VALUES (4018, 2638122, 2, 37, 'CI_TEST专用', '', 'CI_TEST专用', 'Q0lfVEVTVOS4k+eUqA==', '', 'https://res.jaadee.net/rn/userUpload/community/publish/image/2638122/2020-04-07/1586240373-pukgqh.jpg', 'https://res.jaadee.net/rn/userUpload/community/publish/video/2638122/2020-04-07/1586240372-232gmi.mp4', '', '', 0, 1, 0, 0, 0, 0, 1586240372, 1587020541, 1586240372, 2, 0, 0, 1000, 0, 0, 0, 0, 1, NULL, 272, 480, 0, 129, 120, 53, 0, 1, 9, '', '', '', 0);"
    """

  Scenario: [0] 获取用户图文列表
    * 请求"query_community_article_list_url"接口，查询
    """
      {'link_url':'?uid=2638122&page=1&pageSize=20',
        'http_method': 'get',
        'evn':'CI_OP',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "status": 0,
          "code": 0,
          "msg": "获取动态",
          "message": "获取动态",
          "info": [{
              "id": 4018,
              "topic": 9,
              "privateTop": 1,
              "sourceUrl": null,
              "sourceDescription": null,
              "userId": 2638122,
              "type": 2,
              "cateId": 37,
              "title": "CI_TEST专用",
              "tags": "",
              "intro": "CI_TEST专用",
              "thumb": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "videoUri": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/2638122\/2020-04-07\/1586240372-232gmi.mp4",
              "imagesUri": "",
              "orderSn": "",
              "isStar": 0,
              "isTop": 0,
              "time": 1586240372,
              "ratio": null,
              "commentNumber": 0,
              "date": "2020.04.07",
              "topicName": "翡翠的诞生",
              "author": {
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "typeId": 0,
                  "vip": 0,
                  "name": "翠友***6303"
              },
              "isCollected": false,
              "isConcerned": 0,
              "share": {
                  "userName": "",
                  "path": "",
                  "description": "",
                  "image": ""
              },
              "typeName": "视频"
          }],
          "data": [{
              "id": 4018,
              "topic": 9,
              "privateTop": 1,
              "sourceUrl": null,
              "sourceDescription": null,
              "userId": 2638122,
              "type": 2,
              "cateId": 37,
              "title": "CI_TEST专用",
              "tags": "",
              "intro": "CI_TEST专用",
              "thumb": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "videoUri": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/2638122\/2020-04-07\/1586240372-232gmi.mp4",
              "imagesUri": "",
              "orderSn": "",
              "isStar": 0,
              "isTop": 0,
              "time": 1586240372,
              "ratio": null,
              "commentNumber": 0,
              "date": "2020.04.07",
              "topicName": "翡翠的诞生",
              "author": {
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "typeId": 0,
                  "vip": 0,
                  "name": "翠友***6303"
              },
              "isCollected": false,
              "isConcerned": 0,
              "share": {
                  "userName": "",
                  "path": "",
                  "description": "",
                  "image": ""
              },
              "typeName": "视频"
          }]
      }
    """