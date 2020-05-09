# -*- coding: utf-8 -*-
# 接口路径文件

# 翡翠王朝--C端 goods一口价相关
query_goods_details_url = "/api/Goodsfixedprice/getDetails"
query_goods_fixed_price_list_url = "/api/Goodsfixedprice/getList"
query_focus_list_url = "/bus/focus/List"
query_merchant_category_list_url = "/bus/merchant/CategoryList"
query_hot_search_word_url = "/api/Goodsfixedprice/getHotSearchWord"
query_search_list_url = "/api/Goodsfixedprice/getSearchList"

# 翡翠王朝--C端 翠友天地相关
query_recommend_index_url = "/operate/v1/recommend/index"
query_community_article_fromIdo_url = "/v1/Community/ArticleFromIdol"
query_community_idol_url = "/index.php/v1/Community/Idol"
query_community_contentByCate_url = "/index.php/v1/Community/ContentByCate"
query_community_profile_url = "/v1/Community/Profile"
query_community_article_list_url = "/v1/Community/ArticleList"
query_community_contentInfoByID_url = "/index.php/v1/Community/ContentInfoById"
query_community_topic_list_url = "/index.php/v1/Community/TopicList"
query_community_user_tag_list_url = "/index.php/v1/Community/UserTagList"
create_update_user_tag_url = "/index.php/v1/Community/UserTag"

# 翡翠王朝--C端 在线鉴定相关
query_jianbao_live_list_url = "/api/jianbao/live/list"
query_jianbao_url = "/api/jianbao/"


# 翡翠王朝--C端 拍卖相关
query_auction_special_list_url = "/api/auction/special"
query_auction_special_url = "/api/auction/special/0"
query_auction_url = "/api/auction/"
query_common_article_list_url = "/api/common/article/list/"
query_search_bykeyword_url = "/api/auction/searchbykeyword"
query_auction_my_url = "/api/auction/my"



# 翡翠王朝--C端 品牌大厅相关
query_index_goods_ceneter_url = "/index.php/v2/Goods/indexGetGoodsCenter.html"
query_index_platinfo_url = "/v1/index/platInfo"
create_share_url = "/a/api/video/share"
query_advertisement_share_url = "/v2/Advertisement/liveShare"
query_goods_filter_url = "/index.php/v2/GoodsFilter/fetchGoodsFilter"
query_goods_category_url = "/index.php/v2/GoodsCategory/fetchGoodsCategory"
query_associate_words_url = "/index.php/v2/Search/fetchAssociateWords"
query_search_dosearch_url = "/index.php/v2/Search/doSearch"

# 翡翠王朝--C端 直播相关
query_first_advertisement_url = "/a/api/usr/index.php/v2/Advertisement/firstAdsByScene"
query_new_people_conpons_url = "/a/api/usr/index.php/v2/newPeople/getNewPeopleConpons"
query_live_index_topnew_url = "/a/api/live/index/listTopNew"
query_live_index_listnew_url = "/a/api/live/index/listNew"
query_live_product_stuff_list_url = "/a/api/live/product/stuff/list"
query_live_focus_list_url = "/a/api/live/v2/Live/focusLiveList"
live_details_url = "/a/api/live/v2/Live/liveDetails"
query_live_app_express_language_url = "/a/api/live/v2/live/expressLanguage"
check_user_url = "/a/api/live/v2/Live/checkUser"
query_live_chatRoom_msg_history_url = "/a/api/live/chatRoom/msg/history"
query_live_user_goods_list_url = "/a/api/live/v1/live/userGoodsList"
query_advertisement_share_words_url = "/index.php/v2//Advertisement/sharedWords"
live_chatroom_msg_send_url = "/a/api/live/chatRoom/msg/send"
query_comment_number_url = "/index.php/v1/Comment/Number"
query_merchant_coupon_list_url = "/v1/MerchantCoupon/couponList"
query_merchant_coupon_php_list_url = "/index.php/v1/MerchantCoupon/couponList"
query_live_active_url = "/index.php/v1/Active/LiveActive"
create_live_focus_url = "/a/api/live/v2/Live/setFocus"
create_multiple_coupons_url = "/a/api/activity/v1/coupon/multipleCoupons"
query_level_user_score_url = "/api/Level/userScore"
query_level_total_score_url = "/api/Level/toatlScore"

# 翡翠王朝--C端 品牌大厅相关
query_hunt_treasure_basic_info_url = "/a/api/live/hunt/treasure/basicInfo"
query_hunt_treasure_cycle_scroll_url = "/a/api/live/hunt/treasure/cycleScroll"
create_hunt_treasure_save_url = "/a/api/live/hunt/treasure/saveOrUpdate"
query_hunt_treasure_list_url = "/a/api/live/hunt/treasure/list"

# B端 商户相关
shop_login_url = "/v1/login/phoneLogin"
shop_query_live_identities_url = "/v1/live/goodLiveIdentities"
query_live_start_url = "/v1/live/start"
create_live_url = "/v1/live/save"
query_live_anchor_list_url = "/v1/liveAnchor/list"
query_live_room_share_url = "/v1/chatRoom/shareHistory"
query_live_goods_list_url = "/v1/liveGood/list"
update_live_anchor_status_url = "/v1/liveAnchor/changeStatus"
create_live_good_url = "/v1/liveGood/add"

# 翡翠王朝--C端 新品相关
query_good_new_cate_url = "/v1/good/newCate"
query_good_new_url = "/v1/good/new"


# 翡翠王朝--C端 order相关
query_order_list_url = "/a/api/ordersys/index.php/v3/order/lists"
query_order_status_num_url = "/a/api/ordersys/index.php/v3/order/statusNum"
create_order_url = "/a/api/v1/orders/orders"
query_order_price_url = "/a/api/v1/orders/price"
order_alipay_url = "/a/api/ordersys/index.php/v3/order/alipay"
order_pay_result_url = "/a/api/ordersys/index.php/v3/order/payResult"
orders_recevie_url = "/v1/orders/receive"
query_order_detail_url = "/a/api/ordersys/index.php/v1/order/detail"
query_order_pay_result_url = "/a/api/ordersys/index.php/v3/order/payResult"
query_order_cancel_reason_url = "/a/api/ordersys/cancel/reason/list"
revoke_order_url = "/a/api/ordersys/index.php/v1/order/cancel"

# 翡翠王朝--C端 order 售后相关
create_order_return_url = "/a/api/order/return/create"
query_order_return_list_url = "/a/api/order/return/list"
query_order_return_detail_url = "/a/api/order/return/detail"
update_order_return_url = "/a/api/order/return/update"
revoke_order_return_url = "/a/api/order/return/updateToRevoke"

# 翡翠王朝--C端 user 相关
query_address_list_url = "/a/api/usr/index.php/v2/address/getList"
query_user_goods_coupon_url = "/a/api/activity/v1/coupon/userCoupons"
query_user_center_info_url = "/a/api/usr/index.php/v1/User/getUserCenterInfo"
query_user_info_statistic_url = "/a/api/usr/index.php/v3/user/infoStatistic"
query_user_rewards_type_url = "/v1/rewards/type"
query_user_rewards_spread_url = "/v1/rewards/spread"
query_user_unread_message_url = "/a/api/msg/userMessage/unReadMsgCount"
query_advertisement_byScene_url = "/a/api/usr/index.php/v2/Advertisement/adsByScene"
query_user_real_level_url = "/a/api/usr/index.php/v2/Member/realLevel"
query_user_check_UidBindWx_url = "/a/api/usr/index.php/v1/User/checkUidBindWx"
update_user_SignAndSex_url = "/a/api/usr/index.php/v2/Member/updateSignAndSex"
update_user_birthday_url = "/a/api/usr/index.php/v2/member/saveUserBirth"
update_user_level_display_url = "/a/api/usr/index.php/v2/Member/LevelDisplay"
create_user_address_url = "/a/api/usr/index.php/v2/address/add"
update_user_address_url = "/a/api/usr/index.php/v2/address/update"
query_user_collect_list_url = "/index.php/v3/Collect/lists"
query_user_favorites_list_url = "/index.php/v1/Community/FavoritesList"
query_user_coin_url = "/v1/rewards/spread"
query_user_rewards_log_url = "/v1/rewards/log"
query_user_rewards_fans_url = "/v1/rewards/fans"
query_user_record_list_url = "/a/api/usr/index.php/v2/Record/recordList"
query_user_margin_url = "/api/auction/my/margin"
query_service_url = "/a/api/live/v3/Service/fetchCustomerServices"
query_user_message_list_url = "/a/api/msg/userMessage/list"

# 翡翠王朝--C端 系统相关
login_url = "/a/api/usr/index.php/v2/login/user"
query_payment_type_list_url = "/p/app/paymentType/list"

# 后台--订单系统 相关
od_login_url = "/api/login/sign.html?phone=18313736272&password=536071&clientToken="
goods_send_list_url = "/api/Goods/sendList"
add_express_url = "/api/Delivery/addExpress"
order_insure_done_url = "/api/orders/insuredone.html"
order_insure_payment_url = "/api/Finance/insurePayment"
# 订单解绑手机号虚拟号
order_unbind_Axn_url = "/biz/ordersys/axn/orderUnBindAxn"
unbind_Axn_url = "/biz/ordersys/axn/unbindX"
release_SecretNo_url = "/biz/ordersys/axn/releaseSecretNo"
