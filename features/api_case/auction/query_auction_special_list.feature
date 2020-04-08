# Created by shenping at 2020/4/7
Feature: 获取拍卖分类接口测试用例

  Scenario: [0]获取推荐拍卖列表
    * 请求"query_auction_special_list_url"接口，查询列表
    """
      {'link_url':'?source_type=3',
        'http_method': 'get',
        'evn':'CI_AUCTION',
         'url_params':{
         }
      }
    """
    * 验证接口返回值
    """
      {
          "data": {
              "count": 6,
              "result": [{
                  "picture": "https://res.jaadee.com/auction/logo/20190809/6kin8dkexud1zqeu7x1jgq.jpg",
                  "title": "新人专享",
                  "special_id": 32,
                  "special_type": 2005,
                  "show_type": 1,
                  "pic_urls": "https://res.jaadee.com/auction/logo/20190809/890xovsp2iovumyc09103.jpg",
                  "sub_title": "0元起拍，1元捡漏"
              }, {
                  "picture": "https://res.jaadee.com/auction/logo/20190828/ou7kp4c5ynszkmg3x01au.png",
                  "title": "即将结拍",
                  "special_id": 37,
                  "special_type": 2006,
                  "show_type": 1,
                  "pic_urls": "",
                  "sub_title": "限制捡漏"
              }, {
                  "picture": "https://res.jaadee.com/auction/logo/20190605/6duxdixl9uycnwi8pa32sf.png",
                  "title": "0元起拍",
                  "special_id": 15,
                  "special_type": 2002,
                  "show_type": 1,
                  "pic_urls": "https://res.jaadee.net/auction/logo/20190509/2z8rHE.jpg,https://res.jaadee.net/auction/logo/20190509/46MnxX.jpg,https://res.jaadee.net/auction/logo/20190509/F42Ynf.jpg",
                  "sub_title": "精选好物捡漏"
              }, {
                  "picture": "https://res.jaadee.com/auction/logo/20190605/zsglao6pbiebzwajs8zus.png",
                  "title": "高货专场",
                  "special_id": 17,
                  "special_type": 2003,
                  "show_type": 1,
                  "pic_urls": "https://res.jaadee.com/auction/logo/20191023/e75bp5av1xfgxfu4vu7w0h.png",
                  "sub_title": "高品质翡翠"
              }, {
                  "picture": "https://res.jaadee.com/live/images/2020/01/20200117100122-61909.png",
                  "title": "最新上架",
                  "special_id": 18,
                  "special_type": 2008,
                  "show_type": 1,
                  "pic_urls": "https://res.jaadee.net/auction/logo/20190508/ZyeHTS.jpg,https://res.jaadee.com/auction/logo/20190622/6y7102hfve9l7cev4v1pu.jpeg,https://res.jaadee.com/auction/logo/20190622/qlqyiwszmfe9qac66jp5.png,https://res.jaadee.com/auction/logo/20190622/9nfjqmp2sqadnotvydqiol.jpeg,https://res.jaadee.com/auction/logo/20190624/df6knpoz18wm777enr517o.jpg,https://res.jaadee.com/auction/logo/20190624/ayf4gyacm5bcoi7lhwkmbl.jpg,https://res.jaadee.com/auction/logo/20190624/tzzaagcmvpbfdehnphkd4.jpg,https://res.jaadee.com/auction/logo/20190624/9vayq52if3jps3pvz3gggs.jpg,https://res.jaadee.com/auction/logo/20190624/7wfver9r46h4mhm4y5bj75.jpg,https://res.jaadee.com/auction/logo/20190624/k13159c2oerg6ihud1fz5.jpg,https://res.jaadee.com/auction/logo/20190624/hw7zet0ds745pmsiant7zk.jpg,https://res.jaadee.com/auction/logo/20190624/98906d3s64z3pp4kegefq.jpg,https://res.jaadee.com/auction/logo/20190624/hg6szx6ynklzk3o9stbk9n.jpg,https://res.jaadee.com/auction/logo/20190624/bl44qyxwvk53hkzzo1tjap.jpg",
                  "sub_title": "不要钱抽奖，就问你来不来"
              }, {
                  "picture": "https://res.jaadee.com/live/images/2020/01/20200117100155-50925.png",
                  "title": "每日抢拍",
                  "special_id": 38,
                  "special_type": 2009,
                  "show_type": 1,
                  "pic_urls": "",
                  "sub_title": "每日抢拍"
              }]
          },
          "message": "OK",
          "code": 0,
          "status": 200
      }
    """