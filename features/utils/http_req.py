# -*- coding: utf-8 -*-
'''
@author: redstar
'''
import json
import urllib

import requests


class Request():

    def __init__(self, url, params={}, headers={}, data={}, method="get", verify=False, allow_redirects=False):
        self.url = url
        self.params = params
        self.headers = headers
        self.data = data
        self.method = method
        self.verify = verify
        self.allow_redirects = allow_redirects
        self.response = {
            'http_status': None,
            'body': {},
            'headers': {}
        }

    def __repr__(self):
        return '<SendRequest %r %r %r %r>' % (self.method, self.url, self.params, self.headers)

    def send_request(self, timeout=50.0, max_try=3):
        print("+++++++++++++++++++++++++++++Sending Request+++++++++++++++++++++++++++++\n")
        max_try = max_try
        while (max_try > 0):
            try:
                response = self.urlopen(timeout)
                print("Status: ", response.status_code)
                print("Text: ", str(response.text))
                print("\n\n")
                print("======================")
                self.response['http_status'] = response.status_code
                self.response['headers'] = response.headers
                self.response['body'] = response.text
                self.response['history'] = response.history
                break
            except Exception as e:
                print("\n [Exception]Got Exception Try Again...\n%s\n[URL] %s" % (str(e), self.url + urllib.parse.urlencode(self.params)))
                max_try -= 1

        if max_try <= 0:
            raise Exception("Send http request timeout! Retry failed!")

        for redirect in self.response['history']:
            print("\n [Redirect History] %s\t[Http Status] %s" % (redirect.url, redirect.status_code))

        return self.response

    def urlopen(self, timeout):
        assert self.method in ('get', 'post', 'delete', 'put')

        if 'get' == self.method:
            return requests.get(self.url, params=self.params, headers=self.headers, verify=self.verify,
                                allow_redirects=self.allow_redirects, timeout=timeout)
        else:
            return requests.request(url=self.url, method=self.method, data=json.dumps(self.data), params=self.params,
                                    headers=self.headers, verify=self.verify, allow_redirects=self.allow_redirects,
                                    timeout=timeout)