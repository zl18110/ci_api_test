# Created by shenping at 2020/4/11
Feature: 直播间订单支付接口测试用例

  Background: 测试数据初始化
    * 使用逻辑"in"子查询结果delete测试数据"ordertest.od_orders_goods"
      """
        {
            "column": "orders_sn",
            "sun_table": "ordertest.od_orders",
            "sun_column_name": "orders_uid",
            "sun_column_value": (context.fcwcuser['data']['uid'])
        }
      """
    * 删除测试数据"ordertest.od_orders_remark"
      """
        {"user_remark":"ci_api_test"}
      """
    * 删除测试数据"ordertest.od_orders_user"
      """
        {"user_id":(context.fcwcuser['data']['uid'])}
      """
    * 使用逻辑"in"子查询结果delete测试数据"ordertest.od_goods_lock"
      """
        {
            "column": "orders_sn",
            "sun_table": "ordertest.od_orders",
            "sun_column_name": "orders_uid",
            "sun_column_value": (context.fcwcuser['data']['uid'])
        }
      """
    * 使用逻辑"in"子查询结果delete测试数据"ordertest.od_operator"
      """
        {
            "column": "orders_sn",
            "sun_table": "ordertest.od_orders",
            "sun_column_name": "orders_uid",
            "sun_column_value": (context.fcwcuser['data']['uid'])
        }
      """
    * 删除测试数据"ordertest.od_order_logs"
      """
        {"log":(context.fcwcuser['data']['uid'])}
      """
    * 使用逻辑"in"子查询结果delete测试数据"ordertest.od_orders_separate"
      """
        {
            "column": "orders_sn",
            "sun_table": "ordertest.od_orders",
            "sun_column_name": "orders_uid",
            "sun_column_value": (context.fcwcuser['data']['uid'])
        }
      """
    * 使用逻辑"in"子查询结果delete测试数据"ordertest.od_orders_separate_pay"
      """
        {
            "column": "orders_sn",
            "sun_table": "ordertest.od_orders",
            "sun_column_name": "orders_uid",
            "sun_column_value": (context.fcwcuser['data']['uid'])
        }
      """
    * 使用逻辑"in"子查询结果delete测试数据"ordertest.od_payment_log"
      """
        {
            "column": "orders_sn",
            "sun_table": "ordertest.od_orders",
            "sun_column_name": "orders_uid",
            "sun_column_value": (context.fcwcuser['data']['uid'])
        }
      """

    * 删除测试数据"ordertest.od_orders"
      """
        {"orders_uid":(context.fcwcuser['data']['uid'])}
      """
    * 删除测试数据"newapitest.common_live_goods"
      """
        {"for_uid":(context.fcwcuser['data']['uid'])}
      """

  Scenario: [0]添加直播间订单
    * 请求"shop_query_live_identities_url"接口，获取主播身份认证信息成功
    """
      {'link_url':'',
        'http_method': 'get',
        'evn':'CI_SUP',
         'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "cache": ""
      }
    """

    * 请求"query_live_start_url"接口，获取确认直播信息成功
    """
      {"link_url":"",
        "http_method": "get",
        "evn":"CI_SUP",
         "url_params":{
            "liveMemberId":(context.body['data']['isLive'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "data": {
              "liveMember": {
                  "id": 203,
                  "userName": "杨哥22楼",
                  "streamName": "yangjuyu",
                  "avatar": "https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/anchor\/b266bce66fa28ea5de707e8ad0115341\/200x200.jpg",
                  "honor": "翡翠王朝（昆明翡翠）",
                  "desc": "稀世珍品琥珀蜜蜡直播间，主营虫珀、墨西哥蓝珀、多米尼加蓝珀、原皮手把及琥珀原石高端定制。琥珀蜜蜡均由专家团队严格筛选，并为翠友们配备专业的代购服务，让您可以在众多珍品中遇到称心如意的它。",
                  "auth": 1,
                  "xmppUsername": "jaadee006",
                  "typeInfo": []
              }
          },
          "cache": ""
      }
    """

    * 请求"create_live_url"接口，开启直播成功
    """
      {"link_url":"",
        "http_method": "post",
        "evn":"CI_SUP",
         "url_params":{
            "anchorId": 0,
            "channelId": (context.body['data']['nowLiveInfo']['liveChannelId']),
            "liveId": (context.body['data']['nowLiveInfo']['id']),
            "liveLogo": "https://res.jaadee.net/cuiyou/images/2019-12-23/1577080504098-09e7695be9231aca33d15bf0cff89b36.jpg",
            "liveMemberId": (context.body['data']['liveMember']['id']),
            "liveTitle": "CI_API自动化测试",
            "liveType": (context.body['data']['nowLiveInfo']['liveType'])
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取信息成功",
          "cache": ""
      }
    """

    * 请求"update_live_anchor_status_url"接口，更改直播状态成功
      """
        {"link_url":"",
          "http_method": "post",
          "evn":"CI_SUP",
           "url_params":{
              "anchor_id":40,
              "room_id":(context.body['data']['liveInfo']['roomId']),
              "status":1
           }
        }
      """
      * 接口返回码"200"
      * 验证接口返回值
      """
        {
            "code": 0,
            "message": "更改成功",
            "data": "40",
            "cache": ""
        }
      """
    * 数据表"newapitest.common_live_list",使用逻辑"and",按字段"id"排序，查询最新记录
      """
        {"mid":"3","buid":"3","live_title":"CI_API自动化测试","status":"3"}
      """

    * 请求"live_chatroom_msg_send_url"接口，发送消息
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
              "roomid": (context.column_result['roomid']),
              "content": "666",
              "liveMemberId": 203,
              "type": "groupchat"
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
          "message": "发送成功",
          "msg": "发送成功",
          "status": 0
      }
    """
    * 请求"create_live_good_url"接口，添加商品
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_SUP',
        'url_params':{
            'forUid':(context.fcwcuser['data']['uid']),
            'forUinfo':json.dumps({
              "avatar":(context.fcwcuser['data']['avatar']),
              "accid":(context.fcwcuser['data']['accid']),
              "name":(context.fcwcuser['data']['name'])
              }),
            'liveId':(context.column_result['id']),
            'logo':'https://res.jaadee.net/appdir/ios/live/images/2020-04-10/20200410181825436-301639.jpeg',
            'price':111.00,
            'roomId':(context.column_result['roomid'])
        }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "商品发送成功",
          "cache": ""
      }
    """

    * 请求"query_live_user_goods_list_url"接口，用户获取直播间商品列表
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "liveId": (context.column_result['id']),
            "liveListType": 3
         }
      }
    """
    * 接口返回码"200"

    * 数据表"newapitest.common_live_goods",使用逻辑"and",按字段"id"排序，查询最新记录
    """
      {"live_list_id":(context.column_result['id']),"roomid":(context.column_result['roomid']),"for_uid":(context.fcwcuser['data']['uid'])}
    """

    * 验证接口返回值
    """
      {
          "cacheType": "",
          "code": 0,
          "data": [{
              "daiGouPrice": 0.0,
              "forUid": (context.fcwcuser['data']['uid']),
              "goodsId": 0,
              "goodsName": (context.column_result['title']),
              "goodsPrice": 111.00,
              "goodsSn": (context.column_result['goods_sn']),
              "goodsThumb": "https://res.jaadee.net/appdir/ios/live/images/2020-04-10/20200410181825436-301639.jpeg",
              "id": (context.column_result['id']),
              "isSale": (context.column_result['is_sale']),
              "liveListId": (context.column_result['live_list_id']),
              "orderby": (context.column_result['orderby']),
              "platId": (context.column_result['plat_id']),
              "remark": (context.column_result['remark']),
              "roomId": (context.column_result['roomid']),
              "shopPrice": 111.00,
              "talkTime": (context.column_result['talk_time']),
              "totalPrice": 111.00
          }],
          "hashData": "",
          "info": [{
              "daiGouPrice": 0.0,
              "forUid": (context.fcwcuser['data']['uid']),
              "goodsId": 0,
              "goodsName": (context.column_result['title']),
              "goodsPrice": 111.00,
              "goodsSn": (context.column_result['goods_sn']),
              "goodsThumb": "https://res.jaadee.net/appdir/ios/live/images/2020-04-10/20200410181825436-301639.jpeg",
              "id": (context.column_result['id']),
              "isSale": (context.column_result['is_sale']),
              "liveListId": (context.column_result['live_list_id']),
              "orderby": (context.column_result['orderby']),
              "platId": (context.column_result['plat_id']),
              "remark": (context.column_result['remark']),
              "roomId": (context.column_result['roomid']),
              "shopPrice": 111.00,
              "talkTime": (context.column_result['talk_time']),
              "totalPrice": 111.00
          }],
          "message": "获取用户商品列表成功",
          "msg": "获取用户商品列表成功",
          "status": 0
      }
    """

    * 请求"create_order_url"接口，添加直播间订单,成功
    """
      {'link_url':'',
        'http_method': 'post',
         "url_params":{
            "type": 2,
            "goodsSn": (context.column_result['goods_sn']),
            "addressId": 2235,
            "coin": 0,
            "redId": 0,
            "couponId": 0,
            "feeId": 0,
            "remark": "ci_api_test"
         }
      }
    """
    * 等待"3"秒

    * 验证接口返回值
      """
        {
          "cacheType": "",
          "code": 0,
          "displayAlert": false,
          "displayTip": false,
          "hashData": "",
          "message": "",
          "msg": "",
          "status": 0
        }
      """
    * 等待"3"秒

    * 数据表"ordertest.od_orders_remark" 使用逻辑"and"查询最新记录字段"orders_sn"
      """
        {"user_remark":"ci_api_test"}
      """

    * 使用逻辑"and"查询数据库"ordertest.od_orders"
      """
        {"orders_uid":(context.fcwcuser['data']['uid']),"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
    """
      [{
          'pid': 0,
          'orders_uid': (context.fcwcuser['data']['uid']),
          'orders_add_user': 90,
          'orders_star': 0,
          'app_show': 1,
          'is_delete': 0,
          'orders_type': 2,
          'total_price': Decimal('111.00'),
          'discount_price': Decimal('0.00'),
          'member_discount': Decimal('0.00'),
          'discount_goods_price': Decimal('0.00'),
          'actual_price': Decimal('111.00'),
          'coin': 0,
          'status': 1,
          'paid_money': Decimal('0.00'),
          'extra': '{"rewards_on":1}',
          'job_number': None,
          'referrer_id': 2638121,
          'is_vip': 0,
          'del_state': 0,
          'is_mock': 0,
          'asyn': 'Y',
          'good_sn': None,
          'live_member_id': None,
          'server_id': None,
          'orders_refundtime': None,
          'source_sign': None,
          'item_sum': Decimal('111.00'),
          'pay_money': '0',
          'clear': '5',
          'asyn_remark': None,
          'goods_id': 0,
          'r_cancellation': None,
          'platform': 0,
          'activityId': 0,
          'group_id': 0,
          'refund_flg': None
      }]
    """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_goods"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
          'goods_logo': 'https://res.jaadee.net/appdir/ios/live/images/2020-04-10/20200410181825436-301639.jpeg',
          'goods_imgs': '',
          'goods_original_price': Decimal('111.00'),
          'discount': 0.0,
          'goods_num': 1,
          'goods_source_id': 7,
          'sale_group_id': 24,
          'orders_add_user': 90,
          'finance_group_id': 26,
          'channel_group_id': 0,
          'goods_refundable_time': 0,
          'goods_category_tag': 0,
          'live_member_id': 203,
          'liver_name': '',
          'live_stream': 'yangjuyu',
          'live_info': '',
          'plat_id': 1,
          'status': 1,
          'cost_status': 0,
          'actual_price': Decimal('111.00'),
          'orders_discount_apportion': Decimal('0.00'),
          'coin_deduction_apportion': Decimal('0.00'),
          'member_apportion': Decimal('0.00'),
          'rest_price': Decimal('0.00'),
          'postage': Decimal('0.00'),
          'sale_percent': Decimal('0.01'),
          'is_delete': 0,
          'is_refund': 0,
          'referrer_id': 2638121,
          'complete_uid': None,
          'complete_time': None,
          'referrer_type': 1,
          'platform_commission': Decimal('0.20'),
          'is_part_refund': 0,
          'fee': Decimal('0.00'),
          'del_state': 0,
          'coin': Decimal('0.00'),
          'total_amount': Decimal('111.00'),
          'category_id': 0,
          'style_id': 0,
          'mid': 3,
          'buid':3,
          'goods_attr': '[]',
          'is_new_user': 0,
          'is_first': 59,
          'platform': 0,
          'goods_source': 0,
          'auto_settle': 1
      }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_user"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'user_id': 2638122,
            'name': '徐东',
            'nickname': '翠友8276506303',
            'province': '福建省',
            'city': '泉州市',
            'area': '晋江市',
            'del_state': 0,
            'address_id': 2235,
            'update_limit': None,
            'encrypted': 0,
            'ou_encrypted': 1
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_goods_lock"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'orders_sn': (context.column_result),
            'del_state': 0,
            'sock': None
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_operator"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'orders_sn': (context.column_result),
            'server_id': 90,
            'deliver_goods_uid': 0,
            'check_goods_uid': 0,
            'financial_uid': 0,
            'del_state': 0,
        }]
      """

    * 请求"order_alipay_url"接口，支付订单
      """
        {'link_url':'',
          'http_method': 'post',
           "url_params":{
              "subject": (context.column_result),
              "totalAmount": "111.00",
              "ordersSn": (context.column_result),
              "payType": 88
           }
        }
      """
    * 验证接口返回值
      """
        {
            "cacheType": "",
            "code": 0,
            "data": {
                "zeroOrder": 0
            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "info": {
                "zeroOrder": 0
            },
            "message": "",
            "msg": "",
            "status": 0
        }
      """
    * 等待"3"秒
    * 使用逻辑"and"查询数据库"ordertest.od_orders"
      """
        {"orders_uid":(context.fcwcuser['data']['uid']),"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
    """
      [{
          'pid': 0,
          'orders_uid': (context.fcwcuser['data']['uid']),
          'orders_add_user': 90,
          'orders_star': 0,
          'app_show': 1,
          'is_delete': 0,
          'orders_type': 2,
          'total_price': Decimal('111.00'),
          'discount_price': Decimal('0.00'),
          'member_discount': Decimal('0.00'),
          'discount_goods_price': Decimal('0.00'),
          'actual_price': Decimal('111.00'),
          'coin': 0,
          'status': 2,
          'paid_money': Decimal('111.00'),
          'extra': '{"rewards_on":1}',
          'job_number': None,
          'referrer_id': 2638121,
          'is_vip': 0,
          'del_state': 0,
          'is_mock': 0,
          'asyn': 'Y',
          'good_sn': None,
          'live_member_id': None,
          'server_id': None,
          'orders_refundtime': None,
          'source_sign': None,
          'item_sum': Decimal('111.00'),
          'pay_money': '111.0',
          'clear': '3',
          'asyn_remark': None,
          'goods_id': 0,
          'r_cancellation': None,
          'platform': 0,
          'activityId': 0,
          'group_id': 0,
          'refund_flg': None
      }]
    """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_goods"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
          'goods_logo': 'https://res.jaadee.net/appdir/ios/live/images/2020-04-10/20200410181825436-301639.jpeg',
          'goods_imgs': '',
          'goods_original_price': Decimal('111.00'),
          'discount': 0.0,
          'goods_num': 1,
          'goods_source_id': 7,
          'sale_group_id': 24,
          'orders_add_user': 90,
          'finance_group_id': 26,
          'channel_group_id': 0,
          'goods_refundable_time': 0,
          'goods_category_tag': 0,
          'live_member_id': 203,
          'liver_name': '',
          'live_stream': 'yangjuyu',
          'live_info': '',
          'plat_id': 1,
          'status': 2,
          'cost_status': 0,
          'actual_price': Decimal('111.00'),
          'orders_discount_apportion': Decimal('0.00'),
          'coin_deduction_apportion': Decimal('0.00'),
          'member_apportion': Decimal('0.00'),
          'rest_price': Decimal('0.00'),
          'postage': Decimal('0.00'),
          'sale_percent': Decimal('0.01'),
          'is_delete': 0,
          'is_refund': 0,
          'referrer_id': 2638121,
          'complete_uid': None,
          'complete_time': None,
          'referrer_type': 1,
          'platform_commission': Decimal('0.20'),
          'is_part_refund': 0,
          'fee': Decimal('0.00'),
          'del_state': 0,
          'coin': Decimal('0.00'),
          'total_amount': Decimal('111.00'),
          'category_id': 0,
          'style_id': 0,
          'mid': 3,
          'buid':3,
          'goods_attr': '[]',
          'is_new_user': 0,
          'is_first': 59,
          'platform': 0,
          'goods_source': 0,
          'auto_settle': 1
      }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_user"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'user_id': 2638122,
            'name': '徐东',
            'nickname': '翠友8276506303',
            'province': '福建省',
            'city': '泉州市',
            'area': '晋江市',
            'del_state': 0,
            'address_id': 2235,
            'update_limit': None,
            'encrypted': 0,
            'ou_encrypted': 1
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_goods_lock"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        []
      """
    * 使用逻辑"and"查询数据库"ordertest.od_payment_log"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'payment_id': 88,
            'payment_account': '',
            'amount': Decimal('111.00'),
            'add_user': 0,
            'check_user': 0,
            'payment_prof': '',
            'status': 2,
            'type': 0,
            'del_state': 0
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_separate"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'orders_sn': (context.column_result),
            'platform_uid': -666,
            'platform_rate': Decimal('0.10'),
            'shop_uid': 51,
            'shop_rate': Decimal('0.80'),
            'referee_rate': Decimal('0.10'),
            'other_uid': 80000,
            'other_rate': Decimal('0.00'),
            'referee_rate_a_uid': 2638121,
            'referee_rate_a': Decimal('0.50'),
            'referee_rate_b_uid': 2638119,
            'referee_rate_b': Decimal('0.15'),
            'referee_rate_mine_uid': 2638122,
            'referee_rate_mine': Decimal('0.15'),
            'referee_rate_s_uid': 2638119,
            'referee_rate_s': Decimal('0.15'),
            'point': 0,
            'del_state': 0,
            'referee_rate_self': Decimal('0.00'),
            'referee_self_uid': 0
        }]
      """
    * 使用逻辑"and"查询数据库"ordertest.od_orders_separate_pay"
      """
        {"orders_sn":(context.column_result)}
      """
    * 验证数据库返回值
      """
        [{
            'orders_sn': (context.column_result),
            'money': Decimal('111.00'),
            'per_money': Decimal('111.00'),
            'platform_uid': -666,
            'platform_money': Decimal('11.10'),
            'shop_uid': 51,
            'shop_money': Decimal('88.80'),
            'other_uid': 80000,
            'other_money': Decimal('0.57'),
            'referee_money': Decimal('11.10'),
            'referee_a_uid': 2638121,
            'referee_a_money': Decimal('5.55'),
            'referee_b_uid': 2638119,
            'referee_b_money': Decimal('1.66'),
            'referee_mine': 2638122,
            'referee_mine_money': Decimal('1.66'),
            'referee_s_uid': 2638119,
            'referee_s_money': Decimal('1.66'),
            'type': 0,
            'status': 1,
            'del_state': 0,
            'referee_self_money': Decimal('0.00'),
            'referee_self_uid': 0
        }]
      """

  Scenario: [1] 现场恢复