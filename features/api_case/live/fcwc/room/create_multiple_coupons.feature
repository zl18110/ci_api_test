# Created by shenping at 2020/4/15
Feature: 直播间领取优惠券接口测试用例

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
  Scenario: [0]领取直播间优惠券
    * 请求"create_multiple_coupons_url"接口，领取优惠券
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "sign": "3-516",
              "type": "1"
          }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": [],
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": [],
          "message": "发放成功",
          "msg": "发放成功",
          "status": 0
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