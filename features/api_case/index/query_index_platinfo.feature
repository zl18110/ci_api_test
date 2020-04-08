# Created by shenping at 2020/4/8
Feature: hu接口测试用例

  Scenario Outline: [0]
    * 请求"query_index_platinfo_url"接口，
    """
      {'link_url':'?platId=<platId>',
        'http_method': 'get',
        'evn':'CI_RNAPI',
        'url_params':{
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      <result>
    """
    Examples:
      |platId |result|
      |1      |{"code":0,"message":"数据获取成功","data":{"platInfo":{"1":{"id":1,"name":"翡翠王朝","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo1.png"},"2":{"id":2,"name":"珠宝乐园","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo2.png"},"3":{"id":3,"name":"南红之谜","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo3.png"},"4":{"id":4,"name":"玉雕界","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo4.png"},"5":{"id":5,"name":"东方格度","template_type":3,"logo":"rndir\/ios\/header\/kflb-logo5.png"},"6":{"id":6,"name":"学玉院","template_type":1,"logo":""},"7":{"id":7,"name":"翠友天地","template_type":1,"logo":""},"8":{"id":8,"name":"热播","template_type":1,"logo":""}},"cateInfo":[{"name":"挂件","plat":"FCWC","catid":"22","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-0-1.jpg"},{"name":"手镯","plat":"FCWC","catid":"19","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-1-1.jpg"},{"name":"饰品","plat":"FCWC","catid":"20","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-2-1.jpg"},{"name":"蛋面","plat":"FCWC","catid":"99","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-3-1.jpg"},{"name":"杂项","plat":"FCWC","catid":"21","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-4-1.jpg"},{"name":"全部","plat":"FCWC","catid":"0","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-5-1.jpg"}]}}|
      |3      |{"code":0,"message":"数据获取成功","data":{"platInfo":{"1":{"id":1,"name":"翡翠王朝","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo1.png"},"2":{"id":2,"name":"珠宝乐园","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo2.png"},"3":{"id":3,"name":"南红之谜","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo3.png"},"4":{"id":4,"name":"玉雕界","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo4.png"},"5":{"id":5,"name":"东方格度","template_type":3,"logo":"rndir\/ios\/header\/kflb-logo5.png"},"6":{"id":6,"name":"学玉院","template_type":1,"logo":""},"7":{"id":7,"name":"翠友天地","template_type":1,"logo":""},"8":{"id":8,"name":"热播","template_type":1,"logo":""}},"cateInfo":[{"name":"挂件","plat":"NHZM","typeid":"1","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-0-3.jpg"},{"name":"手串","plat":"NHZM","typeid":"2","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-1-3.jpg"},{"name":"项链","plat":"NHZM","typeid":"5","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-2-3.jpg"},{"name":"戒指","plat":"NHZM","typeid":"8","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-3-3.jpg"},{"name":"耳饰","plat":"NHZM","typeid":"7","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-4-3.jpg"},{"name":"全部","plat":"NHZM","typeid":"0","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-5-3.jpg"}]}}                                                                                                                                                                                                                                                                                       |
      |2      |{"code":0,"message":"数据获取成功","data":{"platInfo":{"1":{"id":1,"name":"翡翠王朝","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo1.png"},"2":{"id":2,"name":"珠宝乐园","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo2.png"},"3":{"id":3,"name":"南红之谜","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo3.png"},"4":{"id":4,"name":"玉雕界","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo4.png"},"5":{"id":5,"name":"东方格度","template_type":3,"logo":"rndir\/ios\/header\/kflb-logo5.png"},"6":{"id":6,"name":"学玉院","template_type":1,"logo":""},"7":{"id":7,"name":"翠友天地","template_type":1,"logo":""},"8":{"id":8,"name":"热播","template_type":1,"logo":""}},"cateInfo":[{"name":"和田玉","plat":"ZBLY","catid":"3","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-0-2.jpg"},{"name":"祖母绿","plat":"ZBLY","catid":"8","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-8-2.jpg"},{"name":"琥珀蜜蜡","plat":"ZBLY","catid":"2","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-1-2.jpg"},{"name":"蓝宝石","plat":"ZBLY","catid":"9","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-10-2.jpg"},{"name":"红宝石","plat":"ZBLY","catid":"10","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-9-2.jpg"},{"name":"全部","plat":"ZBLY","catid":"0","logo":"https:\/\/appres.jaadee.com\/apps\/cat\/index-5-2.jpg"}]}}                                                                                                                                                                                                                                                            |
      |4      |{"code":0,"message":"数据获取成功","data":{"platInfo":{"1":{"id":1,"name":"翡翠王朝","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo1.png"},"2":{"id":2,"name":"珠宝乐园","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo2.png"},"3":{"id":3,"name":"南红之谜","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo3.png"},"4":{"id":4,"name":"玉雕界","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo4.png"},"5":{"id":5,"name":"东方格度","template_type":3,"logo":"rndir\/ios\/header\/kflb-logo5.png"},"6":{"id":6,"name":"学玉院","template_type":1,"logo":""},"7":{"id":7,"name":"翠友天地","template_type":1,"logo":""},"8":{"id":8,"name":"热播","template_type":1,"logo":""}},"cateInfo":[],"advInfo":[{"id":151,"plat_id":4,"position_id":8,"title":"618每日上新推荐专场","navigate":"H5Page","url":"https:\/\/share.jaadee.net\/h5\/2018618\/ydj618-02\/mydj618.html","cover":"https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/article\/fadc65e55a34c3660dc0371ead933fa2\/raw.jpg","params":[]},{"id":70,"plat_id":4,"position_id":1,"title":"618物慧关公专题","navigate":"H5Page","url":"http:\/\/apptest.jaadee.com\/topic\/m\/23","cover":"https:\/\/res.jaadee.net\/newupload\/rnAdmin\/upload\/manage\/article\/04b3834d043867b8dade6dc7b4bd75ea\/raw.jpg","params":[]}]}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
      |5      |{"code":0,"message":"数据获取成功","data":{"platInfo":{"1":{"id":1,"name":"翡翠王朝","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo1.png"},"2":{"id":2,"name":"珠宝乐园","template_type":1,"logo":"rndir\/ios\/header\/kflb-logo2.png"},"3":{"id":3,"name":"南红之谜","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo3.png"},"4":{"id":4,"name":"玉雕界","template_type":2,"logo":"rndir\/ios\/header\/kflb-logo4.png"},"5":{"id":5,"name":"东方格度","template_type":3,"logo":"rndir\/ios\/header\/kflb-logo5.png"},"6":{"id":6,"name":"学玉院","template_type":1,"logo":""},"7":{"id":7,"name":"翠友天地","template_type":1,"logo":""},"8":{"id":8,"name":"热播","template_type":1,"logo":""}},"cateInfo":[]}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
