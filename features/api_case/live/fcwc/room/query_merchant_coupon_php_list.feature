# Created by shenping at 2020/4/15
Feature: 获取用户优惠信息php接口测试用例
   Background: 测试数据初始化
    * 删除测试数据"operatemanagetest.op_coupon_log"
    """
      {"key_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_rule"
    """
      {"coupon_model_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_model"
    """
      {"op_coupon_model":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_user"
    """
      {"coupon_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_user_copy"
    """
      {"coupon_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_user_history"
    """
      {"coupon_id":"516"}
    """

    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_coupon_log`(`id`, `type`, `key_id`, `uid`, `description`, `content`, `time`) VALUES (689, 'model', 516, 436, '修改', '{\"status\":1}', '2020-04-15 17:12:12');"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_coupon_rule`(`id`, `coupon_model_id`, `name`, `sign`, `nums`, `rule`, `max_num`, `add_time`, `is_delete`, `intro`, `repeat_time`, `del_state`, `use_member`, `end_time_type`, `start_time`, `end_time`, `receive_num`) VALUES (341, 516, '直播商户-杨哥22楼-发放', '3-516', 0, '', 1000, '2020-04-15 17:05:02', 0, '商户创建', 5, 0, 0, 1, '2020-04-15 00:00:00', '2026-04-15 00:00:00', 1);"
    """
    * 运行以下sql,添加测试数据
    """
      "INSERT INTO `operatemanagetest`.`op_coupon_model`(`id`, `is_plat`, `merchant_id`, `merchant_type`, `live_member_id`, `name`, `type`, `rule_money`, `rate`, `discount`, `start_time`, `end_time`, `add_time`, `is_delete`, `intro`, `active_id`, `sign`, `end_time_auto`, `discount_auto`, `max_discount`, `del_state`, `status`, `remark`) VALUES (516, 2, 3, 1, 203, 'CI自动化测试专用满减优惠券', 2, 30, 0.00, 10, NULL, NULL, '2020-04-15 17:05:02', 0, '自动化测试专用优惠券', 84, '3', 30, 0, 0, 0, 1, '');"
    """

  Scenario: [0]获取用户直播优惠信息(PHP接口)
    * 请求"query_merchant_coupon_php_list_url"接口，获取用户优惠信息
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_OP',
         'url_params':{
          "uid":(context.fcwcuser['data']['uid']),
          "liveMemberId":203,
          "pageSize":200
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取成功",
          "data": {
              "total": 1,
              "perPage": "200",
              "currentPage": 1,
              "lastPage": 1,
              "data": [{
                  "id": 516,
                  "type": 2,
                  "status": 1,
                  "name": "CI自动化测试专用满减优惠券",
                  "intro": "自动化测试专用优惠券",
                  "rate": "0.00",
                  "discount": 10,
                  "ruleMoney": 30,
                  "startTime": "2020.04.15",
                  "endTime": "2026.04.15",
                  "sign": "3-516",
                  "restNum": 1000,
                  "received": 0
              }]
          }
      }
    """
    # 测试数据恢复

    * 删除测试数据"operatemanagetest.op_coupon_log"
    """
      {"key_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_rule"
    """
      {"coupon_model_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_model"
    """
      {"op_coupon_model":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_user"
    """
      {"coupon_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_user_copy"
    """
      {"coupon_id":"516"}
    """
    * 删除测试数据"operatemanagetest.op_coupon_user_history"
    """
      {"coupon_id":"516"}
    """