# Created by shenping at 2020/5/9
Feature: 新增或更新用户标签接口测试用例

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
  
  Scenario: [0]新增或更新用户标签
    * 请求"create_update_user_tag_url"接口，查询
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_OP',
         'url_params':{
            "gender": 1,
            "tags": [1, 2]
        }
      }
    """
    * 验证接口返回值
    """
      {
          "status": 0,
          "code": 0,
          "msg": "保存成功",
          "message": "保存成功",
          "info": [],
          "data": []
      }
    """
    * 使用逻辑"and",查询数据库"operatemanagetest.op_content_user_has_tag"
    """
      {"user_id":"2638122","is_deleted":"0"}
    """
    * 验证数据库返回条数"2"

     * 使用逻辑"and",查询数据库"operatemanagetest.op_content_user_has_tag"
    """
      {"user_id":"2638122","is_deleted":"1"}
    """
    * 验证数据库返回条数"3"

  Scenario: [1]测试现场恢复

