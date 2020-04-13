# Created by shenping at 2020/4/13
Feature: 查询评论详情接口测试用例
  Background: 测试数据初始化
    * 删除测试数据"operatemanagetest.op_content_info"
    """
      {"id":"4019"}
    """

    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_info`(`id`, `user_id`, `type`, `cate_id`, `title`, `tags`, `intro`, `intro_base64`, `content`, `thumb`, `videoUri`, `imagesUri`, `orderSn`, `collect_num`, `click_num`, `share_num`, `is_star`, `is_top`, `is_delete`, `created_at`, `updated_at`, `time`, `formal`, `recommend_group`, `is_home`, `sort`, `thumb_width`, `thumb_height`, `thumb_number`, `comment_number`, `private_top`, `raw`, `video_width`, `video_height`, `del_state`, `click_num_mock`, `collect_num_mock`, `share_num_mock`, `is_big`, `display`, `topic`, `ip`, `district`, `location`, `show_district`) VALUES (4019, 2638122, 2, 37, 'CI_TEST专用', '', 'CI_TEST专用', 'Q0lfVEVTVOS4k+eUqA==', NULL, 'https://res.jaadee.net/rn/userUpload/community/publish/image/2638122/2020-04-07/1586240373-pukgqh.jpg', 'https://res.jaadee.net/rn/userUpload/community/publish/video/2638122/2020-04-07/1586240372-232gmi.mp4', NULL, '', 0, 0, 0, 0, 0, 0, 1586240372, 1586240372, 1586240372, 0, 0, 0, 1000, 0, 0, 0, 0, 1, NULL, 272, 480, 0, 0, 0, 0, 0, 1, 9, '', '', '', 0);"
    """
  Scenario: [0]查询评论详情
    * 请求"query_community_contentInfoByID_url"接口，
    """
      {'link_url':'?id=4019',
        'http_method': 'get',
        'evn':'CI_OP',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "status": 0,
          "code": 0,
          "msg": "获取成功！",
          "message": "获取成功！",
          "info": {
              "id": 4019,
              "topic": 9,
              "intro": "CI_TEST专用",
              "tags": "",
              "sort": 1000,
              "privateTop": 1,
              "videoWidth": 272,
              "videoHeight": 480,
              "thumbWidth": 0,
              "thumbHeight": 0,
              "userId": 2638122,
              "title": "CI_TEST专用",
              "cover": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "introBase64": "Q0lfVEVTVOS4k+eUqA==",
              "content": null,
              "collectNumber": 0,
              "shareNumber": 0,
              "isStar": 0,
              "isTop": 0,
              "time": 1586240372,
              "formal": 0,
              "cateId": 37,
              "typeId": 2,
              "commentNumber": 0,
              "videoUri": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/2638122\/2020-04-07\/1586240372-232gmi.mp4",
              "imagesUri": null,
              "share": {
                  "userName": "",
                  "path": "",
                  "description": "",
                  "image": ""
              },
              "thumb": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "date": "2020.04.07",
              "typeName": "视频",
              "author": {
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "type": 0,
                  "vip": 0,
                  "name": "翠友***6303",
                  "nickname": "翠友***6303",
                  "typeId": 0,
                  "identity": 0,
                  "identityName": "普通用户",
                  "logo": "",
                  "subscript": ""
              },
              "cateName": "用户投稿",
              "source": {
                  "url": "",
                  "description": ""
              },
              "nextContent": 0,
              "previous": 0,
              "topicName": "翡翠的诞生",
              "isCollected": false,
              "isConcerned": 0
          },
          "data": {
              "id": 4019,
              "topic": 9,
              "intro": "CI_TEST专用",
              "tags": "",
              "sort": 1000,
              "privateTop": 1,
              "videoWidth": 272,
              "videoHeight": 480,
              "thumbWidth": 0,
              "thumbHeight": 0,
              "userId": 2638122,
              "title": "CI_TEST专用",
              "cover": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "introBase64": "Q0lfVEVTVOS4k+eUqA==",
              "content": null,
              "collectNumber": 0,
              "shareNumber": 0,
              "isStar": 0,
              "isTop": 0,
              "time": 1586240372,
              "formal": 0,
              "cateId": 37,
              "typeId": 2,
              "commentNumber": 0,
              "videoUri": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/video\/2638122\/2020-04-07\/1586240372-232gmi.mp4",
              "imagesUri": null,
              "share": {
                  "userName": "",
                  "path": "",
                  "description": "",
                  "image": ""
              },
              "thumb": "https:\/\/res.jaadee.net\/rn\/userUpload\/community\/publish\/image\/2638122\/2020-04-07\/1586240373-pukgqh.jpg",
              "date": "2020.04.07",
              "typeName": "视频",
              "author": {
                  "avatar": "https:\/\/res.jaadee.net\/appdir\/ios\/user\/images\/2019-10-09\/userDefault.png",
                  "type": 0,
                  "vip": 0,
                  "name": "翠友***6303",
                  "nickname": "翠友***6303",
                  "typeId": 0,
                  "identity": 0,
                  "identityName": "普通用户",
                  "logo": "",
                  "subscript": ""
              },
              "cateName": "用户投稿",
              "source": {
                  "url": "",
                  "description": ""
              },
              "nextContent": 0,
              "previous": 0,
              "topicName": "翡翠的诞生",
              "isCollected": false,
              "isConcerned": 0
          }
      }
    """
    # 现场恢复
    * 删除测试数据"operatemanagetest.op_content_info"
    """
      {"id":"4019"}
    """