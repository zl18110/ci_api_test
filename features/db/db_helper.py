# -*- coding: utf-8 -*-
'''
@author: shenping
'''
import pymysql
import psycopg2
import psycopg2.extras
from features.conf.config import db_jdcustomerstest,db_ordertest


def singleton(class_):
    instances = {}

    def getinstance(*args, **kwargs):
        if class_ not in instances:
            instances[class_] = class_(*args, **kwargs)
        return instances[class_]

    return getinstance


@singleton
class DataBase:
    """
    数据库操作类，单例模式
    """

    def __init__(self):
        try:
            self.__db_jdcustomerstest_conn = pymysql.connect(
                host=db_jdcustomerstest["host"],
                port=db_jdcustomerstest["port"],
                user=db_jdcustomerstest["user"],
                passwd=db_jdcustomerstest["passwd"],
                db=db_jdcustomerstest["db"],
                charset=db_jdcustomerstest["charset"])
            self.__db_jdcustomerstest_cur = self.__db_jdcustomerstest_conn.cursor(pymysql.cursors.DictCursor)

            self.__db_ordertest_conn = pymysql.connect(
                host=db_ordertest["host"],
                port=db_ordertest["port"],
                user=db_ordertest["user"],
                passwd=db_ordertest["passwd"],
                db=db_ordertest["db"],
                charset=db_ordertest["charset"])
            self.__db_ordertest_cur = self.__db_ordertest_conn.cursor(
                pymysql.cursors.DictCursor)
        except Exception as e:
            print("创建SQL连接出错")
            print(e)

    def __del__(self):
        try:
            self.__db_jdcustomerstest_conn.close()
            self.__db_jdcustomerstest_cur.close()

            self.__db_ordertest_conn.close()
            self.__db_ordertest_cur.close()
        except Exception as e:
            print("释放SQL连接出错！")
            print(e)

    def run_sql(self, sql, query_num_flag=False, db_info_name=db_jdcustomerstest):
        conn = ''
        cur = ''
        if db_info_name in ["db_jdcustomerstest", db_jdcustomerstest]:
            print('this db is ',db_info_name)
            conn = self.__jdcustomerstest_conn
            cur = self.__jdcustomerstest_cur
        elif db_info_name in ["db_ordertest", db_ordertest]:
            conn = self.__db_ordertest_conn
            cur = self.__db_ordertest_cur
        sql_num = None
        result = None
        try:
            sql_num = cur.execute(sql)
            if not query_num_flag:
                result = cur.fetchall()
                if result:
                    # result = utils.sorted2(list(result))
                    if len(result) > 0:
                        if isinstance(result[0], dict):
                            # 把返回值中的bytes转换成str
                            for item in result:
                                for key in item:
                                    if isinstance(item[key], bytes):
                                        item[key] = item[key].decode('utf8')
            conn.commit()
        except Exception as e:
            print("sql: ", sql)
            print(e)
        if query_num_flag:
            return sql_num
        return result, sql_num


database = DataBase()


def build_insert_sql(table_object):
    insert_template = "insert into %s (%s) values(%s)"
    table_name, obj_attr_dict = retrieve_info(table_object)
    key_str = "`" + "`, `".join(list(obj_attr_dict.keys())) + "`"
    value_str = "'" + "', '".join(list(obj_attr_dict.values())) + "'"
    return insert_template % (table_name, key_str, value_str)


def build_replace_sql(table_object):
    insert_template = "replace into %s (%s) values(%s)"
    table_name, obj_attr_dict = retrieve_info(table_object)
    key_str = "`" + "`, `".join(list(obj_attr_dict.keys())) + "`"
    value_str = "'" + "', '".join(list(obj_attr_dict.values())) + "'"
    return insert_template % (table_name, key_str, value_str)


def build_delete_sql(table_object):
    table_name, obj_attr_dict = retrieve_info(table_object)
    if table_name is "mob_camp_material":
        delete_template = "delete from %s where mat_id = '%s'"
        # print("delete sql111: " + delete_template % (table_name, obj_attr_dict['mat_id']))
        return delete_template % (table_name, obj_attr_dict['mat_id'])
    elif (table_name is "3ss_offer_channel_daily_sum"):
        delete_template = "delete from %s where network = '%s'"
        # print("delete sql111: " + delete_template % (table_name, obj_attr_dict['network']))
        return delete_template % (table_name, obj_attr_dict['network'])
    else:
        delete_template = "delete from %s where id = '%s'"
        # print("delete sql: " + delete_template % (table_name, obj_attr_dict['id']))
        return delete_template % (table_name, obj_attr_dict['id'])


def retrieve_info(table_object):
    obj_attr_dict = dict(table_object.__dict__)
    table_key = 'table'
    table_name = obj_attr_dict[table_key]
    del obj_attr_dict[table_key]
    if 'db' in obj_attr_dict:
        del obj_attr_dict['db']
    return table_name, obj_attr_dict


def delete_history_records(table, field, value):
    sql = "delete from " + table + " where " + field + " like '%" + value + "%'"
    database.run_sql(sql)


def delete_history_records_db(table, field, value, dbname):
    sql = "delete from " + table + " where " + field + " like '%" + value + "%'"
    database.run_sql(sql, db_info_name=str(dbname))


class orm_helper:
    def __init__(self):
        self.table = 'dump'

    def insert_test_record(self):
        if self.table == "3ss_offer_channel_daily_sum":
            if hasattr(self, "db"):
                return database.run_sql(
                    build_insert_sql(self), db_info_name=self.db)
            else:
                return database.run_sql(build_insert_sql(self))
        else:
            self.delete_test_record()
            if hasattr(self, "db"):
                return database.run_sql(
                    build_insert_sql(self), db_info_name=self.db)
            else:
                return database.run_sql(build_insert_sql(self))

    def replace_test_record(self):
        self.delete_test_record()
        if hasattr(self, "db"):
            return database.run_sql(
                build_replace_sql(self), db_info_name=self.db)
        else:
            return database.run_sql(build_replace_sql(self))

    def delete_test_record(self):
        if hasattr(self, "db"):
            return database.run_sql(
                build_delete_sql(self), db_info_name=self.db)
        else:
            return database.run_sql(build_delete_sql(self))


def build_sql_condition(sql_params, logicCondition):
    condition_list = []
    for key, value in list(sql_params.items()):
        if isinstance(value, list) and len(value) > 0:
            condition_list.append(" %s in ('%s') " % (key, "','".join(value)))
        else:
            condition_list.append(" %s = '%s' " % (key, value))

    if len(condition_list) > 0:
        return " where " + str(logicCondition).join(condition_list)
    else:
        return ""
