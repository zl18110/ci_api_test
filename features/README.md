# 开发环境

## 本地PC

    1. git clone https://git.jaadee.com/shenping/ci_api_test.git
    2. 在项目根目录运行pip install -r requirements.txt进行安装依赖库
    4. 本地host加入：
        172.16.0.42  jadecitest.com

    5. 写完Case后，直接Push到git即可，Jenkins Job会自动拉取最新代码。

## 服务器

    1. 目录结构
    /cidata/dev/ci_api_test

    2. 手动更新部署
        cd /cidata/dev/
        git pull;          #更新3ss


# case规范及约束

1. 每个case尽可能包含数据初始化及销毁，测试数据初始化及销毁放在各自的feature文件里，不要放environment.py。为了提高稳定性、准确性，建议先删除测试数据，再新增测试数据。
2. 以''feature的文件名+自定义名字'_'命名方式来隔离数据，feature文件名为'create_orders.feature'
3. 添加、删除测试数据时，尽量直接使用表名，避免来回查询。