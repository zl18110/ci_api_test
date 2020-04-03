# -*- coding: utf-8 -*-
# 接口路径文件

# 翡翠王朝--C端 goods相关
query_goods_details_url = "%s://%s/api/Goodsfixedprice/getDetails"


# 翡翠王朝--C端 order相关
query_order_list_url = "%s://%s/a/api/ordersys/index.php/v3/order/lists"
query_order_status_num_url = "%s://%s/a/api/ordersys/index.php/v3/order/statusNum"
create_order_url = "%s://%s/a/api/v1/orders/orders"
query_order_price_url = "%s://%s/a/api/v1/orders/price"
order_alipay_url = "%s://%s/a/api/ordersys/index.php/v3/order/alipay"
order_pay_result_url = "%s://%s/a/api/ordersys/index.php/v3/order/payResult"
orders_recevie_url = "%s://%s/v1/orders/receive"
query_order_detail_url = "%s://%s/a/api/ordersys/index.php/v1/order/detail"
query_order_pay_result_url = "%s://%s/a/api/ordersys/index.php/v3/order/payResult"
query_order_cancel_reason_url = "%s://%s/a/api/ordersys/cancel/reason/list"
revoke_order_url = "%s://%s/a/api/ordersys/index.php/v1/order/cancel"

# 翡翠王朝--C端 order 售后相关
create_order_return_url = "%s://%s/a/api/order/return/create"
query_order_return_list_url = "%s://%s/a/api/order/return/list"
query_order_return_detail_url = "%s://%s/a/api/order/return/detail"
update_order_return_url = "%s://%s/a/api/order/return/update"
revoke_order_return_url = "%s://%s/a/api/order/return/updateToRevoke"

# 翡翠王朝--C端 user 相关
query_address_list_url = "%s://%s/a/api/usr/index.php/v2/address/getList"
query_user_goods_coupon_url = "%s://%s/a/api/activity/v1/coupon/userCoupons"
query_user_center_info_url = "%s://%s/a/api/usr/index.php/v1/User/getUserCenterInfo"
query_user_info_statistic_url = "%s://%s/a/api/usr/index.php/v3/user/infoStatistic"

# 翡翠王朝--C端 系统相关
login_url = "%s://%s/a/api/usr/index.php/v2/login/user"
query_payment_type_list_url = "%s://%s/p/app/paymentType/list"

# 后台--订单系统 相关
od_login_url = "%s://%s/api/login/sign.html?phone=18313736272&password=536071&clientToken="
goods_send_list_url = "%s://%s/api/Goods/sendList"
add_express_url = "%s://%s/api/Delivery/addExpress"
