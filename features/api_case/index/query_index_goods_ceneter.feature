# Created by shenping at 2020/4/8
Feature: 获取品牌大厅商品列表接口测试用例

  Scenario Outline: [0] 获取品牌大厅商品
    * 请求"query_index_goods_ceneter_url"接口，获取商品
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_NEWAPI',
         'url_params':{
            "fromp": <fromp>,
            "page": 1,
            "hashData": "",
            "pagesize": 10
        }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      <resualt>
    """
    Examples:
      |fromp       |resualt|
      |1           |{"status":0,"msg":"新上商品获取成功","info":[{"goodsId":189272,"oldId":30505,"goodsName":"【宝玉石级】南红柿子红圆珠手串","goodsSn":"NH030505","marketPrice":6480,"shopPrice":"已结缘","isSold":1,"platId":3,"goodsTag":"南红,手串\/手链","isVideo":1,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":"已结缘","activeLogo":"","goodsThumb":"\/goods\/thumb\/3-NH030505.jpg"},{"goodsId":189269,"oldId":30502,"goodsName":"南红冰飘8mm108珠珠串","goodsSn":"NH030502","marketPrice":3456,"shopPrice":"已结缘","isSold":1,"platId":3,"goodsTag":"南红,项链","isVideo":1,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":"已结缘","activeLogo":"","goodsThumb":"\/goods\/thumb\/3-NH030502.jpg"}]}|
      |3           |{"status":0,"msg":"新上商品获取成功","info":[{"goodsId":242877,"goodsName":"【超值推荐】南红火焰红平安扣","goodsSn":"NH040559","marketPrice":6700,"shopPrice":4180,"isSold":0,"platId":3,"goodsTag":"平安扣,火焰红,超值推荐","isVideo":1,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"超值推荐","activePrice":0,"activeLogo":"","goodsThumb":"\/goods\/thumb\/3-NH040559.jpg"}],"hashData":"","code":0,"message":"新上商品获取成功","data":[{"goodsId":242746,"goodsName":"南红冰飘观音挂件","goodsSn":"NH040547","marketPrice":8400,"shopPrice":3980,"isSold":0,"platId":3,"goodsTag":"挂件,冰飘","isVideo":1,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":0,"activeLogo":"","goodsThumb":"\/goods\/thumb\/3-NH040547.jpg"}]}|
      |2           |{"status":0,"msg":"新上商品获取成功","info":[{"goodsId":188958,"oldId":42132,"goodsName":"俄料和田玉关公吊坠","goodsSn":"JW042132","marketPrice":5388,"shopPrice":"已结缘","isSold":1,"platId":2,"goodsTag":"和田玉,吊坠\/项链","isVideo":1,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":"已结缘","activeLogo":"","goodsThumb":"\/goods\/thumb\/2-JW042132.jpg"}],"hashData":"","code":0,"message":"新上商品获取成功","data":[{"goodsId":188958,"oldId":42132,"goodsName":"俄料和田玉关公吊坠","goodsSn":"JW042132","marketPrice":5388,"shopPrice":"已结缘","isSold":1,"platId":2,"goodsTag":"和田玉,吊坠\/项链","isVideo":1,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":"已结缘","activeLogo":"","goodsThumb":"\/goods\/thumb\/2-JW042132.jpg"}]}|
      |4           |{"status":0,"msg":"新上商品获取成功","info":[{"goodsId":189229,"oldId":40064,"goodsName":"甜梦","goodsSn":"YDJ040064","marketPrice":3360,"shopPrice":"已结缘","isSold":1,"platId":4,"goodsTag":"民间巧匠,玛瑙,动物,挂件,摆件,,财源广进,喜气洋洋,闲情逸致","isVideo":0,"askPrice":0,"peopleId":0,"masterData":{"id":0,"name":"民间巧匠","logo":"\/static\/new\/img\/smalla1.png","intro":""},"material":25,"cat_id":8,"activeTag":"","activePrice":"已结缘","activeLogo":"","goodsThumb":"\/goods\/thumb\/4-YDJ040064.jpg"}],"hashData":"","code":0,"message":"新上商品获取成功","data":[{"goodsId":189229,"oldId":40064,"goodsName":"甜梦","goodsSn":"YDJ040064","marketPrice":3360,"shopPrice":"已结缘","isSold":1,"platId":4,"goodsTag":"民间巧匠,玛瑙,动物,挂件,摆件,,财源广进,喜气洋洋,闲情逸致","isVideo":0,"askPrice":0,"peopleId":0,"masterData":{"id":0,"name":"民间巧匠","logo":"\/static\/new\/img\/smalla1.png","intro":""},"material":25,"cat_id":8,"activeTag":"","activePrice":"已结缘","activeLogo":"","goodsThumb":"\/goods\/thumb\/4-YDJ040064.jpg"}]}|
      |5           |{"status":0,"msg":"新上商品获取成功","info":[{"goodsId":245237,"goodsName":"《芙蓉月》18K金镶翡翠耳坠","goodsSn":"NS019686","marketPrice":8700,"shopPrice":4800,"isSold":0,"platId":5,"goodsTag":"翡翠,耳饰","isVideo":0,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":0,"activeLogo":"","goodsThumb":"\/goods\/thumb\/5-NS019686.jpg"}],"hashData":"","code":0,"message":"新上商品获取成功","data":[{"goodsId":245237,"goodsName":"《芙蓉月》18K金镶翡翠耳坠","goodsSn":"NS019686","marketPrice":8700,"shopPrice":4800,"isSold":0,"platId":5,"goodsTag":"翡翠,耳饰","isVideo":0,"askPrice":0,"peopleId":0,"masterData":"","activeTag":"","activePrice":0,"activeLogo":"","goodsThumb":"\/goods\/thumb\/5-NS019686.jpg"}]}                                                                                                                                                                                                                                                                          |
