# Created by shenping at 2020/4/18
Feature: 通过场景值查询广告接口测试用例


  Scenario: [0]通过场景值查询广告--PersonalCenter
    * 运行以下sql,查询用例base数据
      """
        "SELECT sc.id AS scene_id,sc.scene_name,ad.ads_images,ad.adv_obj,ad.cover,ad.del_state,ad.display_time,ad.end_time,ad.env,ad.env_url,ad.id,ad.is_delete,ad.navigate,ad.newUrl,ad.params,ad.plat_id,ad.position_id,ad.start_time,ad.`status`,ad.title,ad.update_time,ad.url,ad.xcx_url_type FROM newapitest.common_ads_scene sc LEFT JOIN newapitest.common_ads ad ON sc.id=ad.scene_id WHERE ad.`status`=0 AND sc.scene_name='PersonalCenter';"
      """
    * 请求"query_advertisement_byScene_url"接口，查询PersonalCenter广告
    """
      {'link_url':'',
        'http_method': 'post',
        'evn':'CI_ENV',
         'url_params':{
         	"scenes": "PersonalCenter"
         }
      }
    """
    * 验证接口返回值
    """
      {
          "cacheType": "none",
          "code": 0,
          "data": {
              "PersonalCenter": [{
                  "adsImages": (context.base_sql_result[0]['ads_images']),
                  "advObj": (context.base_sql_result[0]['adv_obj']),
                  "cover": (context.base_sql_result[0]['cover']),
                  "del_state": (context.base_sql_result[0]['del_state']),
                  "displayTime": (context.base_sql_result[0]['display_time']),
                  "endTime": (context.base_sql_result[0]['end_time']),
                  "env": (context.base_sql_result[0]['env']),
                  "envUrl": (context.base_sql_result[0]['env_url']),
                  "id": (context.base_sql_result[0]['id']),
                  "isDelete": (context.base_sql_result[0]['is_delete']),
                  "navigate": (context.base_sql_result[0]['navigate']),
                  "newUrl": (context.base_sql_result[0]['newUrl']),
                  "params": (context.base_sql_result[0]['params']),
                  "platId": (context.base_sql_result[0]['plat_id']),
                  "positionId": (context.base_sql_result[0]['position_id']),
                  "sceneId": (context.base_sql_result[0]['scene_id']),
                  "startTime": (context.base_sql_result[0]['start_time']),
                  "status": (context.base_sql_result[0]['status']),
                  "title": (context.base_sql_result[0]['title']),
                  "updateTime": (context.base_sql_result[0]['update_time']),
                  "url": (context.base_sql_result[0]['url']),
                  "xcxUrlType": (context.base_sql_result[0]['xcx_url_type'])
              }]
          },
          "displayAlert": False,
          "displayTip": False,
          "hashData": "",
          "info": {
              "PersonalCenter": [{
                  "adsImages": (context.base_sql_result[0]['ads_images']),
                  "advObj": (context.base_sql_result[0]['adv_obj']),
                  "cover": (context.base_sql_result[0]['cover']),
                  "del_state": (context.base_sql_result[0]['del_state']),
                  "displayTime": (context.base_sql_result[0]['display_time']),
                  "endTime": (context.base_sql_result[0]['end_time']),
                  "env": (context.base_sql_result[0]['env']),
                  "envUrl": (context.base_sql_result[0]['env_url']),
                  "id": (context.base_sql_result[0]['id']),
                  "isDelete": (context.base_sql_result[0]['is_delete']),
                  "navigate": (context.base_sql_result[0]['navigate']),
                  "newUrl": (context.base_sql_result[0]['newUrl']),
                  "params": (context.base_sql_result[0]['params']),
                  "platId": (context.base_sql_result[0]['plat_id']),
                  "positionId": (context.base_sql_result[0]['position_id']),
                  "sceneId": (context.base_sql_result[0]['scene_id']),
                  "startTime": (context.base_sql_result[0]['start_time']),
                  "status": (context.base_sql_result[0]['status']),
                  "title": (context.base_sql_result[0]['title']),
                  "updateTime": (context.base_sql_result[0]['update_time']),
                  "url": (context.base_sql_result[0]['url']),
                  "xcxUrlType": (context.base_sql_result[0]['xcx_url_type'])
              }]
          },
          "message": "获取成功",
          "msg": "获取成功",
          "status": 0
      }
    """