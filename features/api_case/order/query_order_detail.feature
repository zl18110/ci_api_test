# Created by shenping at 2020/4/2
Feature: 获取订单详情接口测试用例

  Background: 测试数据初始化
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638122"}
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_goods where goods_sn ='YK00000401';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_remark where orders_sn='YK203301723564999279';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_orders_user where user_id ='2638122';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_goods_lock where orders_sn='YK203301723564999279';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_operator where orders_sn='YK203301723564999279';"
      """
    * 运行以下sql,删除测试数据
      """
        "delete from ordertest.od_order_logs where log like '%YK00000401%';"
      """
  
  Scenario: [0]查询订单详情
    * 运行以下sql,添加测试数据od_orders
      """
        "INSERT INTO `ordertest`.`od_orders` (`id`, `pid`, `orders_sn`, `orders_uid`, `orders_add_user`, `orders_createtime`, `orders_uptime`, `orders_paytime`, `orders_star`, `app_show`, `is_delete`, `orders_type`, `total_price`, `discount_price`, `member_discount`, `discount_goods_price`, `actual_price`, `coin`, `status`, `paid_money`, `extra`, `job_number`, `referrer_id`, `is_vip`, `del_state`, `is_mock`, `asyn`, `unique_sequence`, `good_sn`, `live_member_id`, `server_id`, `orders_refundtime`, `source_sign`, `item_sum`, `pay_money`, `clear`, `asyn_remark`, `is_dbzc`, `goods_id`, `r_cancellation`, `platform`, `activityId`, `group_id`, `refund_flg`) VALUES ('14404', '0', 'YK203301723564999279', '2638122', '90', '2020-03-30 17:23:57', '2020-03-30 17:23:56', '2020-03-30 17:23:56', '0', '1', '0', '16', '100.00', '0.00', '0.00', '0.00', '100.00', '0', '1', '0.00', '{\"rewards_on\":1}', NULL, '0', '0', '0', '0', 'Y', '14404', NULL, NULL, NULL, NULL, NULL, '100.00', '0', '5', NULL, NULL, '401', NULL, NULL, '0', '0', NULL);"
      """
    * 运行以下sql,添加测试数据od_orders_goods
      """
        "INSERT INTO `ordertest`.`od_orders_goods` (`id`, `orders_sn`, `goods_sn`, `goods_logo`, `goods_imgs`, `goods_name`, `goods_original_price`, `discount`, `goods_num`, `goods_source_id`, `sale_group_id`, `orders_add_user`, `finance_group_id`, `channel_group_id`, `goods_refundable_time`, `add_time`, `goods_category_tag`, `live_member_id`, `liver_name`, `live_stream`, `live_info`, `plat_id`, `status`, `cost_status`, `actual_price`, `orders_discount_apportion`, `coin_deduction_apportion`, `member_apportion`, `rest_price`, `postage`, `sale_percent`, `is_delete`, `is_refund`, `referrer_id`, `complete_uid`, `complete_time`, `referrer_type`, `platform_commission`, `is_part_refund`, `fee`, `del_state`, `coin`, `total_amount`, `category_id`, `style_id`, `mid`, `buid`, `goods_attr`, `is_new_user`, `is_first`, `platform`, `goods_source`, `auto_settle`) VALUES ('10457', 'YK203301723564999279', 'YK00000401', 'https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg', '', 'CI-TEST-GOODS（自动化测试专用）', '100.00', '0', '1', '7', '24', '90', '26', '0', '0', '2020-03-30 17:23:57', '', '193', '', '', '', '1', '1', '0', '100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.01', '0', '0', '0', NULL, NULL, '1', '0.20', '0', '0.00', '0', '0.00', '100.00', '0', '0', '3', '3', '[]', '0', '59', NULL, NULL, '1');"
      """
    * 运行以下sql,添加测试数据od_orders_remark
      """
        "INSERT INTO `ordertest`.`od_orders_remark` (`id`, `orders_sn`, `sale_remark`, `sale_remark_pic`, `finance_remark`, `finance_remark_pic`, `goods_remark`, `goods_remark_pic`, `user_remark`, `del_state`, `refund_remark`) VALUES ('6889', 'YK203301723564999279', '【杨哥22楼商户，电话：13099951707,自发货】', '', '', '', '', '', 'ci_api_test', '0', '');"
      """
    * 运行以下sql,添加测试数据od_orders_user
      """
        "NSERT INTO `ordertest`.`od_orders_user` (`id`, `orders_sn`, `user_id`, `phone`, `name`, `nickname`, `province`, `city`, `area`, `address`, `del_state`, `address_id`, `update_limit`, `encrypted`, `ou_encrypted`, `phoneX`, `subs_id`) VALUES ('10380', 'YK203301723564999279', '2638122', 'QkpPekH/5+TpT+fi9YINbiLq6hU1', '绿地', '翠友84088719776', '云南省', '昆明市', '盘龙区', 'QkhzbUecBUe7oelJpw==', '0', '2337', NULL, '0', '1', NULL, NULL);"
      """
    * 运行以下sql,添加测试数据od_goods_lock
      """
        "INSERT INTO `ordertest`.`od_goods_lock` (`id`, `orders_sn`, `goods_sn`, `expire_time`, `control_time`, `del_state`, `sock`) VALUES ('10886', 'YK203301723564999279', '', '2020-03-30 17:53:56', '2020-03-30 17:23:57', '0', NULL);"
      """
    * 运行以下sql,添加测试数据od_operator
      """
        "INSERT INTO `ordertest`.`od_operator` (`orders_sn`, `goods_sn`, `server_id`, `deliver_goods_uid`, `check_goods_uid`, `financial_uid`, `del_state`, `id`) VALUES ('YK203301723564999279', 'YK00000401', '90', '0', '0', '0', '0', '4896');"
      """

    * 请求"query_order_detail_url"接口，查询订单详情
    """
      {'link_url':'?ordersSn=YK203301723564999279',
        'http_method': 'get',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": {
              "accid": "d468c79404d98666ec9d0c0d9246f0c8",
              "actualPrice": "100.00",
              "address": "",
              "addressId": 0,
              "appShow": 1,
              "area": "",
              "asyn": "Y",
              "city": "",
              "coin": 0,
              "couponMoney": 0.0,
              "delState": 0,
              "discountGoodsPrice": "0.00",
              "discountPrice": "0.00",
              "extra": "{\"rewards_on\":1}",
              "feeMoney": 0.0,
              "feeTotal": 0.0,
              "groupId": 0,
              "hasAddress": 1,
              "id": 14404,
              "isDelete": 0,
              "isMock": 0,
              "isVip": 0,
              "is_gift": 0,
              "jobNumber": "",
              "member": [{
                  "goodsData": [{
                      "actualPrice": "100.00",
                      "addTime": "2020-03-30 17:23:57",
                      "channelGroupId": 0,
                      "coin": "0.00",
                      "coinDeductionApportion": "0.00",
                      "completeTime": "0000-00-00 00:00:00",
                      "completeUid": 0,
                      "costStatus": 0,
                      "delState": 0,
                      "deliveryTime": "0000-00-00 00:00:00",
                      "discount": 0.0,
                      "fee": "0.00",
                      "financeGroupId": 26,
                      "finishTime": "0000-00-00 00:00:00",
                      "gid": 401,
                      "goodsCategoryTag": "",
                      "goodsImgs": "",
                      "goodsLogo": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
                      "goodsName": "CI-TEST-GOODS（自动化测试专用）",
                      "goodsNum": 1,
                      "goodsOriginalPrice": 100.0,
                      "goodsRefundableTime": 0,
                      "goodsSn": "YK00000401",
                      "goodsSourceId": 7,
                      "id": 10457,
                      "isDelete": 0,
                      "isPartRefund": 0,
                      "isRefund": 0,
                      "isWool": 0,
                      "liveInfo": "",
                      "liveMemberId": 193,
                      "liveStream": "",
                      "liverName": "",
                      "margin": 0.0,
                      "memberApportion": "0.00",
                      "mid": 3,
                      "ordersAddUser": 90,
                      "ordersDiscountApportion": "0.00",
                      "ordersSn": "YK203301723564999279",
                      "platId": 1,
                      "platformCommission": "0.20",
                      "postage": "0.00",
                      "receiveTime": "0000-00-00 00:00:00",
                      "referrerId": 0,
                      "referrerType": 1,
                      "restPrice": "0.00",
                      "saleGroupId": 24,
                      "salePercent": "0.01",
                      "settlementTime": "0000-00-00 00:00:00",
                      "status": 1,
                      "totalAmount": "100.00"
                  }],
                  "liveMemberId": 193,
                  "memberName": "杨哥22楼店铺",
                  "totalMemberDiscount": 0,
                  "totalNum": 1,
                  "totalPrice": "100.00"
              }],
              "memberDiscount": 0,
              "mid": 3,
              "name": "",
              "ordersAddUser": 90,
              "ordersCreatetime": "2020-03-30 17:23:57",
              "ordersPaytime": "2020-03-30 17:23:56",
              "ordersSn": "YK203301723564999279",
              "ordersStar": 0,
              "ordersStatus": 1,
              "ordersType": 16,
              "ordersUid": 2638122,
              "ordersUptime": "2020-03-30 17:23:56",
              "paidMoney": "0.00",
              "payLog": [],
              "phone": "",
              "pid": 0,
              "province": "",
              "redMoney": 0.0,
              "referrerId": 0,
              "remainMoney": 100.0,
              "remainSecond": 0,
              "server": {
                  "accid": "d468c79404d98666ec9d0c0d9246f0c8",
                  "name": ""
              },
              "serverId": "90",
              "showAfterSale": 0,
              "status": 1,
              "totalPrice": "100.00",
              "uniqueSequence": "14404",
              "userRemark": "ci_api_test"
          },
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "info": {
              "accid": "d468c79404d98666ec9d0c0d9246f0c8",
              "actualPrice": "100.00",
              "address": "",
              "addressId": 0,
              "appShow": 1,
              "area": "",
              "asyn": "Y",
              "city": "",
              "coin": 0,
              "couponMoney": 0.0,
              "delState": 0,
              "discountGoodsPrice": "0.00",
              "discountPrice": "0.00",
              "extra": "{\"rewards_on\":1}",
              "feeMoney": 0.0,
              "feeTotal": 0.0,
              "groupId": 0,
              "hasAddress": 1,
              "id": 14404,
              "isDelete": 0,
              "isMock": 0,
              "isVip": 0,
              "is_gift": 0,
              "jobNumber": "",
              "member": [{
                  "goodsData": [{
                      "actualPrice": "100.00",
                      "addTime": "2020-03-30 17:23:57",
                      "channelGroupId": 0,
                      "coin": "0.00",
                      "coinDeductionApportion": "0.00",
                      "completeTime": "0000-00-00 00:00:00",
                      "completeUid": 0,
                      "costStatus": 0,
                      "delState": 0,
                      "deliveryTime": "0000-00-00 00:00:00",
                      "discount": 0.0,
                      "fee": "0.00",
                      "financeGroupId": 26,
                      "finishTime": "0000-00-00 00:00:00",
                      "gid": 401,
                      "goodsCategoryTag": "",
                      "goodsImgs": "",
                      "goodsLogo": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
                      "goodsName": "CI-TEST-GOODS（自动化测试专用）",
                      "goodsNum": 1,
                      "goodsOriginalPrice": 100.0,
                      "goodsRefundableTime": 0,
                      "goodsSn": "YK00000401",
                      "goodsSourceId": 7,
                      "id": 10457,
                      "isDelete": 0,
                      "isPartRefund": 0,
                      "isRefund": 0,
                      "isWool": 0,
                      "liveInfo": "",
                      "liveMemberId": 193,
                      "liveStream": "",
                      "liverName": "",
                      "margin": 0.0,
                      "memberApportion": "0.00",
                      "mid": 3,
                      "ordersAddUser": 90,
                      "ordersDiscountApportion": "0.00",
                      "ordersSn": "YK203301723564999279",
                      "platId": 1,
                      "platformCommission": "0.20",
                      "postage": "0.00",
                      "receiveTime": "0000-00-00 00:00:00",
                      "referrerId": 0,
                      "referrerType": 1,
                      "restPrice": "0.00",
                      "saleGroupId": 24,
                      "salePercent": "0.01",
                      "settlementTime": "0000-00-00 00:00:00",
                      "status": 1,
                      "totalAmount": "100.00"
                  }],
                  "liveMemberId": 193,
                  "memberName": "杨哥22楼店铺",
                  "totalMemberDiscount": 0,
                  "totalNum": 1,
                  "totalPrice": "100.00"
              }],
              "memberDiscount": 0,
              "mid": 3,
              "name": "",
              "ordersAddUser": 90,
              "ordersCreatetime": "2020-03-30 17:23:57",
              "ordersPaytime": "2020-03-30 17:23:56",
              "ordersSn": "YK203301723564999279",
              "ordersStar": 0,
              "ordersStatus": 1,
              "ordersType": 16,
              "ordersUid": 2638122,
              "ordersUptime": "2020-03-30 17:23:56",
              "paidMoney": "0.00",
              "payLog": [],
              "phone": "",
              "pid": 0,
              "province": "",
              "redMoney": 0.0,
              "referrerId": 0,
              "remainMoney": 100.0,
              "remainSecond": 0,
              "server": {
                  "accid": "d468c79404d98666ec9d0c0d9246f0c8",
                  "name": ""
              },
              "serverId": "90",
              "showAfterSale": 0,
              "status": 1,
              "totalPrice": "100.00",
              "uniqueSequence": "14404",
              "userRemark": "ci_api_test"
          },
          "message": "获取订单详情成功",
          "msg": "获取订单详情成功",
          "status": 0
      }
    """

  Scenario: [1]测试现场恢复
