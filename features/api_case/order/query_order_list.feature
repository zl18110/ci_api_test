# Created by shenping at 2020/3/17
Feature: #获取用户订单列表接口测试
  # /a/api/ordersys/index.php/v3/order/lists
  Background: 初始化测试数据
    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":"2638265"}
      """
  Scenario:[1] 查询用户全部订单
    * 运行以下sql,添加测试数据
      """
        "INSERT INTO `ordertest`.`od_orders` (`id`, `pid`, `orders_sn`, `orders_uid`, `orders_add_user`, `orders_createtime`, `orders_uptime`, `orders_paytime`, `orders_star`, `app_show`, `is_delete`, `orders_type`, `total_price`, `discount_price`, `member_discount`, `discount_goods_price`, `actual_price`, `coin`, `status`, `paid_money`, `extra`, `job_number`, `referrer_id`, `is_vip`, `del_state`, `is_mock`, `asyn`, `unique_sequence`, `good_sn`, `live_member_id`, `server_id`, `orders_refundtime`, `source_sign`, `item_sum`, `pay_money`, `clear`, `asyn_remark`, `is_dbzc`, `goods_id`, `r_cancellation`, `platform`, `activityId`, `group_id`, `refund_flg`) VALUES ('14085', '0', 'YK203280952587470123', '2638265', '90', '2020-03-28 09:52:59', '2020-03-28 09:52:58', '2020-03-28 09:52:58', '0', '1', '0', '16', '99.00', '0.00', '0.00', '0.00', '99.00', '0', '3', '0.00', '{\"rewards_on\":1}', NULL, '0', '0', '0', '0', 'Y', '14085', NULL, NULL, NULL, NULL, NULL, '99.00', '0', '5', NULL, NULL, '313', NULL, NULL, '0', '0', NULL);"
      """
    * 请求"query_order_list_url"接口,查询订单
      """
      {'link_url':'?type=0&page=1&pageSize=10',
        'http_method': 'get',
         "url_params":{
         }
      }
      """
    * 验证接口返回值
      """
        {
            "cacheType": "",
            "code": 0,
            "data": {
                "currentPage": 1,
                "data": [
                    {
                        "accid": "ece6cc4d333e185774ac8e7bea89f60a",
                        "actualPrice": "99.00",
                        "buid": 20,
                        "goodsData": [
                            {
                                "actualPrice": "99.00",
                                "addTime": "2020-03-28 09:52:59",
                                "channelGroupId": 0,
                                "coin": "0.00",
                                "coinDeductionApportion": "0.00",
                                "completeTime": "0000-00-00 00:00:00",
                                "completeUid": 0,
                                "costStatus": 0,
                                "delState": 0,
                                "discount": 0.0,
                                "fee": "0.00",
                                "financeGroupId": 26,
                                "goodsCategoryTag": "",
                                "goodsImgs": "",
                                "goodsLogo": "https://res.jaadee.net/merchantApi/other/2020-03-18/1584502808048-aa3e2fe872fa92c85da0f625bd21cd1f.jpg",
                                "goodsName": "测试拼团二人团",
                                "goodsNum": 1,
                                "goodsOriginalPrice": 99.0,
                                "goodsRefundableTime": 0,
                                "goodsSn": "YK00000313",
                                "goodsSource": 0,
                                "goodsSourceId": 35,
                                "id": 10143,
                                "isDelete": 0,
                                "isPartRefund": 0,
                                "isRefund": 0,
                                "liveInfo": "",
                                "liveMemberId": 338,
                                "liveStream": "",
                                "liverName": "",
                                "memberApportion": "0.00",
                                "ordersAddUser": 90,
                                "ordersDiscountApportion": "0.00",
                                "ordersSn": "YK203280952587470123",
                                "platId": 3,
                                "platformCommission": "0.20",
                                "postage": "0.00",
                                "referrerId": 0,
                                "referrerType": 1,
                                "restPrice": "0.00",
                                "saleGroupId": 24,
                                "salePercent": "0.01",
                                "status": 7,
                                "totalAmount": "99.00"
                            }
                        ],
                        "groupId": 0,
                        "hasAddress": 1,
                        "id": 14085,
                        "mid": 20,
                        "ordersAddUser": 90,
                        "ordersCreatetime": "2020-03-28 09:52:59",
                        "ordersSn": "YK203280952587470123",
                        "ordersStatus": 5,
                        "ordersType": 16,
                        "ordersUid": 2638265,
                        "paidMoney": "0.00",
                        "refundFlag": 0,
                        "remainMoney": "0.00",
                        "remainSecond": 0,
                        "server": {
                            "accid": "ece6cc4d333e185774ac8e7bea89f60a",
                            "avatar": "",
                            "name": ""
                        },
                        "showAfterSale": 0,
                        "status": 3
                    }
                ],
                "lastPage": 1,
                "perPage": 10,
                "total": 1
            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "info": {
                "currentPage": 1,
                "data": [
                    {
                        "accid": "ece6cc4d333e185774ac8e7bea89f60a",
                        "actualPrice": "99.00",
                        "buid": 20,
                        "goodsData": [
                            {
                                "actualPrice": "99.00",
                                "addTime": "2020-03-28 09:52:59",
                                "channelGroupId": 0,
                                "coin": "0.00",
                                "coinDeductionApportion": "0.00",
                                "completeTime": "0000-00-00 00:00:00",
                                "completeUid": 0,
                                "costStatus": 0,
                                "delState": 0,
                                "discount": 0.0,
                                "fee": "0.00",
                                "financeGroupId": 26,
                                "goodsCategoryTag": "",
                                "goodsImgs": "",
                                "goodsLogo": "https://res.jaadee.net/merchantApi/other/2020-03-18/1584502808048-aa3e2fe872fa92c85da0f625bd21cd1f.jpg",
                                "goodsName": "测试拼团二人团",
                                "goodsNum": 1,
                                "goodsOriginalPrice": 99.0,
                                "goodsRefundableTime": 0,
                                "goodsSn": "YK00000313",
                                "goodsSource": 0,
                                "goodsSourceId": 35,
                                "id": 10143,
                                "isDelete": 0,
                                "isPartRefund": 0,
                                "isRefund": 0,
                                "liveInfo": "",
                                "liveMemberId": 338,
                                "liveStream": "",
                                "liverName": "",
                                "memberApportion": "0.00",
                                "ordersAddUser": 90,
                                "ordersDiscountApportion": "0.00",
                                "ordersSn": "YK203280952587470123",
                                "platId": 3,
                                "platformCommission": "0.20",
                                "postage": "0.00",
                                "referrerId": 0,
                                "referrerType": 1,
                                "restPrice": "0.00",
                                "saleGroupId": 24,
                                "salePercent": "0.01",
                                "status": 7,
                                "totalAmount": "99.00"
                            }
                        ],
                        "groupId": 0,
                        "hasAddress": 1,
                        "id": 14085,
                        "mid": 20,
                        "ordersAddUser": 90,
                        "ordersCreatetime": "2020-03-28 09:52:59",
                        "ordersSn": "YK203280952587470123",
                        "ordersStatus": 5,
                        "ordersType": 16,
                        "ordersUid": 2638265,
                        "paidMoney": "0.00",
                        "refundFlag": 0,
                        "remainMoney": "0.00",
                        "remainSecond": 0,
                        "server": {
                            "accid": "ece6cc4d333e185774ac8e7bea89f60a",
                            "avatar": "",
                            "name": ""
                        },
                        "showAfterSale": 0,
                        "status": 3
                    }
                ],
                "lastPage": 1,
                "perPage": 10,
                "total": 1
            },
            "message": "获取订单列表成功",
            "msg": "获取订单列表成功",
            "status": 0
        }

      """

#    Scenario:[2] 查询用户已关闭订单
#    * 请求"query_order_list_url"接口,查询订单
#      """
#      {'link_url':'?type=5&page=1&pageSize=10',
#        'http_method': 'get',
#         "url_params":{
#         }
#      }
#      """
#    * 验证接口返回值
#      """
#        {
#            "cacheType": "",
#            "code": 0,
#            "data": {
#                "currentPage": 1,
#                "data": [
#                    {
#                        "accid": "jaadee006",
#                        "actualPrice": "1.00",
#                        "goodsData": [
#                            {
#                                "actualPrice": "1.00",
#                                "addTime": "2020-03-13 16:52:39",
#                                "channelGroupId": 0,
#                                "coin": "0.00",
#                                "coinDeductionApportion": "0.00",
#                                "completeTime": "0000-00-00 00:00:00",
#                                "completeUid": 0,
#                                "costStatus": 0,
#                                "delState": 0,
#                                "discount": 0.0,
#                                "fee": "0.00",
#                                "financeGroupId": 26,
#                                "goodsCategoryTag": "",
#                                "goodsImgs": "",
#                                "goodsLogo": "https://res.jaadee.net/merchantApi/goods/2020-02-13/1581585556817-e1cc3920e2b4679f48aecef96ed4b729.jpeg",
#                                "goodsName": "杨哥商户名",
#                                "goodsNum": 1,
#                                "goodsOriginalPrice": 1.0,
#                                "goodsRefundableTime": 7,
#                                "goodsSn": "YK00000085",
#                                "goodsSource": 0,
#                                "goodsSourceId": 7,
#                                "id": 8918,
#                                "isDelete": 0,
#                                "isPartRefund": 0,
#                                "isRefund": 0,
#                                "liveInfo": "",
#                                "liveMemberId": 193,
#                                "liveStream": "",
#                                "liverName": "",
#                                "memberApportion": "0.00",
#                                "ordersAddUser": 90,
#                                "ordersDiscountApportion": "0.00",
#                                "ordersSn": "YK203131652390118753",
#                                "platId": 1,
#                                "platformCommission": "0.20",
#                                "postage": "0.00",
#                                "referrerId": 0,
#                                "referrerType": 1,
#                                "restPrice": "0.00",
#                                "saleGroupId": 24,
#                                "salePercent": "0.01",
#                                "status": 7,
#                                "totalAmount": "1.00"
#                            }
#                        ],
#                        "groupId": 0,
#                        "hasAddress": 1,
#                        "id": 12819,
#                        "ordersAddUser": 90,
#                        "ordersCreatetime": "2020-03-13 16:52:39",
#                        "ordersSn": "YK203131652390118753",
#                        "ordersStatus": 5,
#                        "ordersType": 16,
#                        "ordersUid": 2638265,
#                        "paidMoney": "0.00",
#                        "refundFlag": 0,
#                        "remainMoney": "0.00",
#                        "remainSecond": 0,
#                        "server": {
#                            "accid": "jaadee006",
#                            "avatar": "https://appres.jaadee.net/kfpic/avatar/jaadee006.jpg",
#                            "name": "双艳"
#                        },
#                        "status": 3
#                    },
#                    {
#                        "accid": "fcwclin",
#                        "actualPrice": "1.00",
#                        "goodsData": [
#                            {
#                                "actualPrice": "1.00",
#                                "addTime": "2020-03-13 16:39:38",
#                                "channelGroupId": 0,
#                                "coin": "0.00",
#                                "coinDeductionApportion": "0.00",
#                                "completeTime": "0000-00-00 00:00:00",
#                                "completeUid": 0,
#                                "costStatus": 0,
#                                "delState": 0,
#                                "discount": 0.0,
#                                "fee": "0.00",
#                                "financeGroupId": 26,
#                                "goodsCategoryTag": "0",
#                                "goodsImgs": "",
#                                "goodsLogo": "https://res.jaadee.net/appdir/ios/live/images/2020-03-13/20200313163907394-804792.jpeg",
#                                "goodsName": "序号：27062+19",
#                                "goodsNum": 1,
#                                "goodsOriginalPrice": 1.0,
#                                "goodsRefundableTime": 0,
#                                "goodsSn": "T00000169",
#                                "goodsSource": 0,
#                                "goodsSourceId": 35,
#                                "id": 8915,
#                                "isDelete": 0,
#                                "isPartRefund": 0,
#                                "isRefund": 0,
#                                "liveInfo": "",
#                                "liveMemberId": 1,
#                                "liveStream": "battle",
#                                "liverName": "",
#                                "memberApportion": "0.00",
#                                "ordersAddUser": 101,
#                                "ordersDiscountApportion": "0.00",
#                                "ordersSn": "ZB203131639376014799",
#                                "platId": 3,
#                                "platformCommission": "0.20",
#                                "postage": "0.00",
#                                "referrerId": 0,
#                                "referrerType": 1,
#                                "restPrice": "0.00",
#                                "saleGroupId": 24,
#                                "salePercent": "0.01",
#                                "status": 7,
#                                "totalAmount": "1.00"
#                            }
#                        ],
#                        "groupId": 0,
#                        "hasAddress": 1,
#                        "id": 12816,
#                        "ordersAddUser": 101,
#                        "ordersCreatetime": "2020-03-13 16:39:38",
#                        "ordersSn": "ZB203131639376014799",
#                        "ordersStatus": 5,
#                        "ordersType": 2,
#                        "ordersUid": 2638265,
#                        "paidMoney": "0.00",
#                        "refundFlag": 0,
#                        "remainMoney": "0.00",
#                        "remainSecond": 0,
#                        "server": {
#                            "accid": "fcwclin",
#                            "avatar": "https://appmanage.jaadee.com/newupload/rnAdmin/upload/archive/019e623e3ef69f1686fc608914ca0dce/200x200.jpg",
#                            "name": "安安"
#                        },
#                        "status": 3
#                    }
#                ],
#                "lastPage": 1,
#                "perPage": 10,
#                "total": 2
#            },
#            "displayAlert": false,
#            "displayTip": false,
#            "hashData": "",
#            "info": {
#                "currentPage": 1,
#                "data": [
#                    {
#                        "accid": "jaadee006",
#                        "actualPrice": "1.00",
#                        "goodsData": [
#                            {
#                                "actualPrice": "1.00",
#                                "addTime": "2020-03-13 16:52:39",
#                                "channelGroupId": 0,
#                                "coin": "0.00",
#                                "coinDeductionApportion": "0.00",
#                                "completeTime": "0000-00-00 00:00:00",
#                                "completeUid": 0,
#                                "costStatus": 0,
#                                "delState": 0,
#                                "discount": 0.0,
#                                "fee": "0.00",
#                                "financeGroupId": 26,
#                                "goodsCategoryTag": "",
#                                "goodsImgs": "",
#                                "goodsLogo": "https://res.jaadee.net/merchantApi/goods/2020-02-13/1581585556817-e1cc3920e2b4679f48aecef96ed4b729.jpeg",
#                                "goodsName": "杨哥商户名",
#                                "goodsNum": 1,
#                                "goodsOriginalPrice": 1.0,
#                                "goodsRefundableTime": 7,
#                                "goodsSn": "YK00000085",
#                                "goodsSource": 0,
#                                "goodsSourceId": 7,
#                                "id": 8918,
#                                "isDelete": 0,
#                                "isPartRefund": 0,
#                                "isRefund": 0,
#                                "liveInfo": "",
#                                "liveMemberId": 193,
#                                "liveStream": "",
#                                "liverName": "",
#                                "memberApportion": "0.00",
#                                "ordersAddUser": 90,
#                                "ordersDiscountApportion": "0.00",
#                                "ordersSn": "YK203131652390118753",
#                                "platId": 1,
#                                "platformCommission": "0.20",
#                                "postage": "0.00",
#                                "referrerId": 0,
#                                "referrerType": 1,
#                                "restPrice": "0.00",
#                                "saleGroupId": 24,
#                                "salePercent": "0.01",
#                                "status": 7,
#                                "totalAmount": "1.00"
#                            }
#                        ],
#                        "groupId": 0,
#                        "hasAddress": 1,
#                        "id": 12819,
#                        "ordersAddUser": 90,
#                        "ordersCreatetime": "2020-03-13 16:52:39",
#                        "ordersSn": "YK203131652390118753",
#                        "ordersStatus": 5,
#                        "ordersType": 16,
#                        "ordersUid": 2638265,
#                        "paidMoney": "0.00",
#                        "refundFlag": 0,
#                        "remainMoney": "0.00",
#                        "remainSecond": 0,
#                        "server": {
#                            "accid": "jaadee006",
#                            "avatar": "https://appres.jaadee.net/kfpic/avatar/jaadee006.jpg",
#                            "name": "双艳"
#                        },
#                        "status": 3
#                    },
#                    {
#                        "accid": "fcwclin",
#                        "actualPrice": "1.00",
#                        "goodsData": [
#                            {
#                                "actualPrice": "1.00",
#                                "addTime": "2020-03-13 16:39:38",
#                                "channelGroupId": 0,
#                                "coin": "0.00",
#                                "coinDeductionApportion": "0.00",
#                                "completeTime": "0000-00-00 00:00:00",
#                                "completeUid": 0,
#                                "costStatus": 0,
#                                "delState": 0,
#                                "discount": 0.0,
#                                "fee": "0.00",
#                                "financeGroupId": 26,
#                                "goodsCategoryTag": "0",
#                                "goodsImgs": "",
#                                "goodsLogo": "https://res.jaadee.net/appdir/ios/live/images/2020-03-13/20200313163907394-804792.jpeg",
#                                "goodsName": "序号：27062+19",
#                                "goodsNum": 1,
#                                "goodsOriginalPrice": 1.0,
#                                "goodsRefundableTime": 0,
#                                "goodsSn": "T00000169",
#                                "goodsSource": 0,
#                                "goodsSourceId": 35,
#                                "id": 8915,
#                                "isDelete": 0,
#                                "isPartRefund": 0,
#                                "isRefund": 0,
#                                "liveInfo": "",
#                                "liveMemberId": 1,
#                                "liveStream": "battle",
#                                "liverName": "",
#                                "memberApportion": "0.00",
#                                "ordersAddUser": 101,
#                                "ordersDiscountApportion": "0.00",
#                                "ordersSn": "ZB203131639376014799",
#                                "platId": 3,
#                                "platformCommission": "0.20",
#                                "postage": "0.00",
#                                "referrerId": 0,
#                                "referrerType": 1,
#                                "restPrice": "0.00",
#                                "saleGroupId": 24,
#                                "salePercent": "0.01",
#                                "status": 7,
#                                "totalAmount": "1.00"
#                            }
#                        ],
#                        "groupId": 0,
#                        "hasAddress": 1,
#                        "id": 12816,
#                        "ordersAddUser": 101,
#                        "ordersCreatetime": "2020-03-13 16:39:38",
#                        "ordersSn": "ZB203131639376014799",
#                        "ordersStatus": 5,
#                        "ordersType": 2,
#                        "ordersUid": 2638265,
#                        "paidMoney": "0.00",
#                        "refundFlag": 0,
#                        "remainMoney": "0.00",
#                        "remainSecond": 0,
#                        "server": {
#                            "accid": "fcwclin",
#                            "avatar": "https://appmanage.jaadee.com/newupload/rnAdmin/upload/archive/019e623e3ef69f1686fc608914ca0dce/200x200.jpg",
#                            "name": "安安"
#                        },
#                        "status": 3
#                    }
#                ],
#                "lastPage": 1,
#                "perPage": 10,
#                "total": 2
#            },
#            "message": "获取订单列表成功",
#            "msg": "获取订单列表成功",
#            "status": 0
#        }
#      """
#    Scenario:[3] 查询已用户待付款订单
#    * 请求"query_order_list_url"接口,查询订单
#      """
#      {'link_url':'?type=1&page=1&pageSize=10',
#        'http_method': 'get',
#         "url_params":{
#         }
#      }
#      """
#    * 验证接口返回值
#      """
#        {
#            "cacheType": "",
#            "code": 0,
#            "data": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "displayAlert": false,
#            "displayTip": false,
#            "hashData": "",
#            "info": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "message": "获取订单列表成功",
#            "msg": "获取订单列表成功",
#            "status": 0
#        }
#      """
#
#    Scenario:[4] 查询已用户拼团中订单
#    * 请求"query_order_list_url"接口,查询订单
#      """
#      {'link_url':'?type=8&page=1&pageSize=10',
#        'http_method': 'get',
#         "url_params":{
#         }
#      }
#      """
#    * 验证接口返回值
#      """
#        {
#            "cacheType": "",
#            "code": 0,
#            "data": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "displayAlert": false,
#            "displayTip": false,
#            "hashData": "",
#            "info": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "message": "获取订单列表成功",
#            "msg": "获取订单列表成功",
#            "status": 0
#        }
#      """
#
#    Scenario:[5] 查询已用户待发货订单
#    * 请求"query_order_list_url"接口,查询订单
#      """
#      {'link_url':'?type=2&page=1&pageSize=10',
#        'http_method': 'get',
#         "url_params":{
#         }
#      }
#      """
#    * 验证接口返回值
#      """
#        {
#            "cacheType": "",
#            "code": 0,
#            "data": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "displayAlert": false,
#            "displayTip": false,
#            "hashData": "",
#            "info": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "message": "获取订单列表成功",
#            "msg": "获取订单列表成功",
#            "status": 0
#        }
#      """
#
#    Scenario:[6] 查询已用户 待收货 订单
#    * 请求"query_order_list_url"接口,查询订单
#      """
#      {'link_url':'?type=3&page=1&pageSize=10',
#        'http_method': 'get',
#         "url_params":{
#         }
#      }
#      """
#    * 验证接口返回值
#      """
#        {
#            "cacheType": "",
#            "code": 0,
#            "data": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "displayAlert": false,
#            "displayTip": false,
#            "hashData": "",
#            "info": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "message": "获取订单列表成功",
#            "msg": "获取订单列表成功",
#            "status": 0
#        }
#      """
#
#    Scenario:[7] 查询已用户 已完成 订单
#    * 请求"query_order_list_url"接口,查询订单
#      """
#      {'link_url':'?type=4&page=1&pageSize=10',
#        'http_method': 'get',
#         "url_params":{
#         }
#      }
#      """
#    * 验证接口返回值
#      """
#        {
#            "cacheType": "",
#            "code": 0,
#            "data": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "displayAlert": false,
#            "displayTip": false,
#            "hashData": "",
#            "info": {
#                "currentPage": 1,
#                "data": [],
#                "lastPage": 0,
#                "perPage": 10,
#                "total": 0
#            },
#            "message": "获取订单列表成功",
#            "msg": "获取订单列表成功",
#            "status": 0
#        }
#      """