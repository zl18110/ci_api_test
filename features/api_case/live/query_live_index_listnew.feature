# Created by shenping at 2020/4/8
Feature: 根据频道获取直播数据接口测试用例

  Scenario: [0] 热播中频道获取直播数据
    * 请求"query_live_index_listnew_url"接口，获取直播数据
    """
      {'link_url':'',
        'http_method': 'post',
         'url_params':{
            "channelId": 0
         }
      }
    """
    * 接口返回码"200"
    * 验证接口返回值
    """
      {
            "cacheType": "",
            "code": 0,
            "data": {
                "notices": [{
                    "activeImages": "",
                    "channelInfo": {
                        "channelId": 0,
                        "channelName": "热播中",
                        "liveName": "hotLive",
                        "shareDesc": "13123213123",
                        "shareTitle": "123123213"
                    }
                }],
                "brands": [{
                    "data": {
                        "advertisements": [{
                            "cover": "/newupload/rnAdmin/upload/manage/article/35b762d0bf85838a732a430730aa7fcd/raw.jpg",
                            "id": 289,
                            "navigate": "Classify",
                            "params": "{\"channel\":\"originalgoods\"}",
                            "position_id": 68,
                            "title": "超值严选",
                            "url": ""
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/c7f88bc70a6159aaac74ac84e5ad49f9/raw.jpg",
                            "id": 290,
                            "navigate": "Classify",
                            "params": "{\"channel\":\"enshrinegoods\"}",
                            "position_id": 80,
                            "title": "传家极品",
                            "url": ""
                        }],
                        "cateInfo": [{
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%284%29.png",
                            "name": "挂件",
                            "plat": "NHZM",
                            "typeId": "1"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%285%29.png",
                            "name": "手串",
                            "plat": "NHZM",
                            "typeId": "2"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%286%29.png",
                            "name": "项链",
                            "plat": "NHZM",
                            "typeId": "5"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%287%29.png",
                            "name": "戒指",
                            "plat": "NHZM",
                            "typeId": "8"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%288%29.png",
                            "name": "耳饰",
                            "plat": "NHZM",
                            "typeId": "7"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%289%29.png",
                            "name": "全部",
                            "plat": "NHZM",
                            "typeId": "0"
                        }]
                    },
                    "type": "brand_nanhongzhimi"
                }, {
                    "data": {
                        "advertisements": [{
                            "cover": "/newupload/rnAdmin/upload/manage/article/823f9f162352aa45ec4bda34d23f4cca/raw.jpg",
                            "id": 291,
                            "navigate": "Classify",
                            "params": "{\"platId\":\"4\",\"meterialid\":\"27\"}",
                            "position_id": 70,
                            "title": "超值严选",
                            "url": ""
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/00edfbe0b4433ef4d31476ff5a216a81/raw.jpg",
                            "id": 292,
                            "navigate": "Classify",
                            "params": "{\"catid\":\"8\"}",
                            "position_id": 71,
                            "title": "名间巧匠",
                            "url": ""
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/019bbd5311428768fea043066e91876e/raw.jpg",
                            "id": 293,
                            "navigate": "JadeMaster",
                            "params": "",
                            "position_id": 72,
                            "title": "玉雕名家",
                            "url": ""
                        }]
                    },
                    "type": "brand_yudiaojie"
                }, {
                    "data": {
                        "advertisements": [{
                            "cover": "/newupload/rnAdmin/upload/manage/article/8cd9f013612388ba57ce5a30223ff464/raw.jpg",
                            "id": 295,
                            "navigate": "Classify",
                            "params": "{\"channel\":\"worthgoods\"}",
                            "position_id": 73,
                            "title": "超值推荐",
                            "url": ""
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/3737d63190940f2f89bc7a5ab2d291e9/raw.jpg",
                            "id": 296,
                            "navigate": "H5Page",
                            "params": "",
                            "position_id": 76,
                            "title": "涨姿势",
                            "url": "http://apph5.jaadee.com/app/#/articles/show?isShowTitle=false&articleId=1803&platId=2"
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/07e6af502f8dbb71dfdf74fb353578ec/raw.jpg",
                            "id": 297,
                            "navigate": "H5Page",
                            "params": "",
                            "position_id": 77,
                            "title": "品质保证",
                            "url": "https://app.jaadee.com/app/page/elevenyear.html"
                        }],
                        "cateInfo": [{
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%2811%29.png",
                            "name": "挂件",
                            "plat": "ZBLY",
                            "typeId": "1"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%2812%29.png",
                            "name": "手串",
                            "plat": "ZBLY",
                            "typeId": "2"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%2813%29.png",
                            "name": "项链",
                            "plat": "ZBLY",
                            "typeId": "5"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%2814%29.png",
                            "name": "戒指",
                            "plat": "ZBLY",
                            "typeId": "8"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%2815%29.png",
                            "name": "耳饰",
                            "plat": "ZBLY",
                            "typeId": "7"
                        }, {
                            "logo": "https://all-resources.oss-cn-hangzhou.aliyuncs.com/appHome/%E4%BD%8D%E5%9B%BE%2816%29.png",
                            "name": "全部",
                            "plat": "ZBLY",
                            "typeId": "0"
                        }]
                    },
                    "type": "brand_zhubaoleyuan"
                }, {
                    "data": {
                        "advertisements": [{
                            "cover": "/newupload/rnAdmin/upload/manage/article/cb4979cc76a0377f9e9bbe6e2b426e36/raw.jpg",
                            "id": 300,
                            "navigate": "H5Page",
                            "params": "",
                            "position_id": 82,
                            "title": "设计师张杨",
                            "url": "http://apph5.jaadee.com/bbs/#/detail/251"
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/e673d8bc810e88863dffdbb08e14bd93/raw.jpg",
                            "id": 298,
                            "navigate": "H5Page",
                            "params": "[]",
                            "position_id": 78,
                            "title": "设计师团队",
                            "url": "http://apph5.jaadee.com/app/#/articles/show?isShowTitle=false&articleId=916&platId=5"
                        }, {
                            "cover": "/newupload/rnAdmin/upload/manage/article/0b1cee2ab5b396b41c48530d3927c296/raw.jpg",
                            "id": 299,
                            "navigate": "BrandHallGoodsList",
                            "params": "{\"fromp\":\"5\",\"title\":\"测试\"}",
                            "position_id": 79,
                            "title": "新品上市",
                            "url": ""
                        }]
                    },
                    "type": "brand_dongfanggedu"
                }],
                "list": [{
                    "data": [{
                        "cover": "/newupload/rnAdmin/upload/manage/article/556d5766612824c3113bfc09fdf509c2/raw.jpg",
                        "id": 287,
                        "navigate": "WebPage",
                        "params": "{\"url\":\"https:\\/\\/app.jaadee.com\\/app\\/page\\/vip.html?from=xinbanrebo\",\"title\":\"新人专享大礼包\",\"shareObj\":\"1\"}",
                        "position_id": 65,
                        "title": "VIP专享",
                        "url": ""
                    }, {
                        "cover": "/newupload/rnAdmin/upload/manage/article/6dde3772ccb1c604c86a837cd64988c2/raw.jpg",
                        "id": 288,
                        "navigate": "",
                        "params": "",
                        "position_id": 66,
                        "title": "0元起拍 1元捡漏",
                        "url": "jadeking://Live?liveId=27062"
                    }],
                    "type": "advertisement"
                }, {
                    "data": [],
                    "type": "article"
                }, {
                    "data": [{
                        "cover": "/newupload/rnAdmin/upload/manage/article/c9399b419835c62b9db1b6f1c94d3e33/raw.jpg",
                        "id": 301,
                        "navigate": "WebPage",
                        "params": "",
                        "position_id": 75,
                        "title": "文化空间",
                        "url": "https://sharetest.jaadee.net/active/endyear19/anchorrank.html?inApp=1&title=主播榜活动&shareObj=1&isShowTitle=true"
                    }],
                    "type": "advertisement"
                }]

            },
            "displayAlert": false,
            "displayTip": false,
            "hashData": "",
            "message": "根据频道获取直播数据成功",
            "msg": "根据频道获取直播数据成功",
            "status": 0
        }
    """