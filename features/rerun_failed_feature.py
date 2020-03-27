#!/usr/bin/env python
# coding=UTF-8
"""
Desc：重跑失败的feature
Author：TavisD 
Time：2018-8-30 19:40
"""
import os
import subprocess
from features.conf.config import BEHAVE_REPORT_DIR

project_dir = os.path.dirname(os.path.abspath(__file__))  # 项目根目录

# 删除之前失败的junit xml report
if os.path.exists(os.path.join(project_dir, "rerun_failing.features")):
    print("reading 'rerun_failing.features'")
    new_content = []
    with open(os.path.join(project_dir, "rerun_failing.features"), "r") as f:
        for line in f.readlines():
            if line.strip().startswith("feature"):
                print("line:   " + line.strip())
                new_content.append(line.split(":")[0])
                temp_name = '.'.join(str(line[18:].split(":")[0])[:-8].split("/"))
                report_name = os.path.join(BEHAVE_REPORT_DIR, "TESTS-" + temp_name + ".xml")
                print("checking report " + report_name)
                if os.path.exists(report_name):
                    print("deleting " + report_name)
                    subprocess.Popen("rm -rf {0}".format(report_name), shell=True).wait()

    # 重写rerun_failing.features，去掉行数，从头开始执行feature
    if new_content:
        with open(os.path.join(project_dir, "rerun_failing.features"), "w") as f:
            print("writing new 'rerun_failing.features':  " + str(new_content))
            for new_line in new_content:
                f.write(new_line + "\n")

        # 进行重跑
        print("rerunning failed feature")
        subprocess.Popen(
            "behave @rerun_failing.features -D DB_HOST=127.0.0.1 --junit --junit-directory={0} --tags=-skip || true".format(
                BEHAVE_REPORT_DIR), shell=True).wait()
        # 删除rerun_failing.features文件
        print("deleting 'rerun_failing.features'")
        subprocess.Popen("rm -rf {0}".format(os.path.join(project_dir, "rerun_failing.features")), shell=True).wait()
