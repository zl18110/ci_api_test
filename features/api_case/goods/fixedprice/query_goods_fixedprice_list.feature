# Created by shenping at 2020/4/7
Feature: 获取集市推荐商品列表接口测试用例

  Background: 测试数据初始化
    * 运行以下sql,删除测试数据
      """
        "delete from datacentertest.new_goods where goods_id =414;"
      """
  Scenario Outline: [1]获取集市推荐商品列表
    * 运行以下sql,添加测试数据
      """
        "INSERT INTO `datacentertest`.`new_goods`(`goods_id`, `goods_name`, `goods_sn`, `market_price`, `shop_price`, `sale_status`, `display`, `click_num`, `collect_num`, `goods_tag`, `stock`, `spread`, `weight`, `cover`, `created_at`, `updated_at`, `up_at`, `owner_uid`, `owner_bid`, `owner_mid`, `is_video`, `status`, `is_delete`, `controller_start_time`, `controller_end_time`, `server_type`, `cate_id`, `cate_child_id`, `cate_data`, `digest`, `max_num`, `refundable_time`, `ip`, `isDelete`, `sale_num`, `active_ext`, `active_id`, `merchant_top`, `top_time`) VALUES (414, 'CI-TEST-GOODS_02（自动化测试专用）', 'YK00000414', 300.00, 100.00, 0, 1, 0, 0, '', 999999, 0.150, 0, 'https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg', '2020-03-30 17:16:20', '2020-04-07 11:29:27', '2020-04-07 11:29:27', 51, 3, 3, 0, 1, 0, '2020-03-30 00:00:00', '2021-03-30 00:00:00', '1,3', <cate_id>, <cate_child_id>, <cate_data>, 1, 999999, 0, '', NULL, 0, NULL, 0, 0, '0000-00-00 00:00:00');"
      """

    * 请求"query_goods_fixed_price_list_url"接口，查询数据
    """
      {'link_url':'?page=1&pageSize=20&recommendSearch=<recommendSearch>',
        'http_method': 'get',
        'host':'centertest.jaadee.net',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "code": 0,
          "message": "获取成功",
          "data": {
              "list": [{
                  "goods_id": 414,
                  "goods_sn": "YK00000414",
                  "goods_name": "CI-TEST-GOODS_02（自动化测试专用）",
                  "cover": "https://res.jaadee.net/merchantApi/goods/2020-03-30/1585559778304-9c202c90dd20885b2d004847396c6f91.jpeg",
                  "market_price": "300.00",
                  "shop_price": "100.00",
                  "click_num": 0,
                  "collect_num": 0,
                  "is_video": 0,
                  "earn_money": "7.50"
              }],
              "page": {
                  "page": 1,
                  "page_size": 20
              }
          }
      }
    """
    Examples: 输入参数：recommendSearch = <recommendSearch> 备注：<remarks>
      |recommendSearch                     |remarks                     |cate_id |cate_child_id| cate_data     |
      |{"category_id":0}                   |获取推荐商品列表             |59      |60           |'{\"id\":59,\"child_id\":60}'|
      |{"type":1,"category_id":59,"depth":1}|获取推荐商品列表            |59      |60           |'{\"id\":59,\"child_id\":60}'|
      |{"type":1,"category_id":2,"depth":2}|获取翡翠商品列表             |1       |2            |'{\"id\":1,\"child_id\":2}'  |
      |{"type":1,"category_id":3,"depth":2}|获取和田玉商品列表           |1       |3            |'{\"id\":1,\"child_id\":3}'  |

  Scenario: [2] 测试现场恢复