# Created by shenping at 2020/5/9
Feature: 获取用户标签接口测试用例

  Background: 测试数据初始化
    * 运行以下sql,删除测试数据
    """
      "delete from operatemanagetest.op_content_user_tag where id in ('1','2','3','4','5','6');"
    """
    * 运行以下sql,删除测试数据
    """
      "delete  from operatemanagetest.op_content_user_has_tag where user_id =2638122;"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_tag`(`id`, `name`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (1, '手镯', 1000, '2020-05-07 10:23:01', '2020-05-07 10:23:01', NULL);"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_tag`(`id`, `name`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (2, '戒面', 1000, '2020-05-07 10:23:26', '2020-05-07 10:23:26', NULL);"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_tag`(`id`, `name`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (3, '和田玉', 1000, '2020-05-07 10:23:38', '2020-05-07 10:23:38', NULL);"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_tag`(`id`, `name`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (4, '料子', 1000, '2020-05-07 10:23:56', '2020-05-07 10:23:56', NULL);"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_tag`(`id`, `name`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (5, '琥珀', 1000, '2020-05-07 10:24:03', '2020-05-07 10:24:03', NULL);"
    """
     * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_tag`(`id`, `name`, `sort`, `created_at`, `updated_at`, `deleted_at`) VALUES (6, '色彩宝石', 1000, '2020-05-07 10:24:10', '2020-05-07 10:24:10', NULL);"
    """

    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_has_tag`(`user_id`, `user_tag_id`, `is_deleted`) VALUES (2638122, 1, 0);"
    """

    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_has_tag`(`user_id`, `user_tag_id`, `is_deleted`) VALUES (2638122, 2, 0);"
    """

    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_content_user_has_tag`(`user_id`, `user_tag_id`, `is_deleted`) VALUES (2638122, 3, 0);"
    """

  Scenario: [0]获取用户标签
    * 请求"query_community_user_tag_list_url"接口，查询
    """
      {'link_url':'',
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
          "msg": "成功",
          "message": "成功",
          "info": {
              "list": [{
                  "id": 1,
                  "name": "手镯",
                  "selected": true
              }, {
                  "id": 2,
                  "name": "戒面",
                  "selected": true
              }, {
                  "id": 3,
                  "name": "和田玉",
                  "selected": true
              }, {
                  "id": 4,
                  "name": "料子",
                  "selected": false
              }, {
                  "id": 5,
                  "name": "琥珀",
                  "selected": false
              }, {
                  "id": 6,
                  "name": "色彩宝石",
                  "selected": false
              }],
              "userTags": [{
                  "userId": 2638122,
                  "userTagId": 1
              }, {
                  "userId": 2638122,
                  "userTagId": 2
              }, {
                  "userId": 2638122,
                  "userTagId": 3
              }],
              "gender": 1
          },
          "data": {
              "list": [{
                  "id": 1,
                  "name": "手镯",
                  "selected": true
              }, {
                  "id": 2,
                  "name": "戒面",
                  "selected": true
              }, {
                  "id": 3,
                  "name": "和田玉",
                  "selected": true
              }, {
                  "id": 4,
                  "name": "料子",
                  "selected": false
              }, {
                  "id": 5,
                  "name": "琥珀",
                  "selected": false
              }, {
                  "id": 6,
                  "name": "色彩宝石",
                  "selected": false
              }],
              "userTags": [{
                  "userId": 2638122,
                  "userTagId": 1
              }, {
                  "userId": 2638122,
                  "userTagId": 2
              }, {
                  "userId": 2638122,
                  "userTagId": 3
              }],
              "gender": 1
          }
      }
    """