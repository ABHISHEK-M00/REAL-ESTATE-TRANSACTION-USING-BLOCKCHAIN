#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from flask import Flask, abort, request, send_file,render_template
from flask_script import Manager
from flask_cors import CORS
import os
import requests
import ipfshttpclient
import logging

app = Flask(__name__)
CORS(app)
app.config.from_pyfile('config.py')

manager = Manager(app)

def download(url):
    h = {"Accept-Encoding": "identity"}
    r = requests.get(url, stream=True, verify=False, headers=h)

    try:
        r.raise_for_status()
    except requests.exceptions.HTTPError as e:
        #log.exception("IPFS Server Error! url:{0}, exception:{1}".format(url, str(e)))
        return "IPFS Server Error! \n", 503

    if "content-type" in r.headers:
        return send_file(r.raw, r.headers["content-type"])
    else:
        return send_file(r.raw)


# @app.route("/<path:path>")
@app.route("/down/<path:path>")
def down(path):
    try:
        p = os.path.splitext(path)
        hash = str(p[0])

        if not hash or not hash.startswith('Qm'):
            return "<Invalid Path>", 404

        #log.info("hash:{0}".format(hash), {'app': 'dfile-down-req'})

        url = app.config['IPFS_FILE_URL'] + hash

        return download(url)
    except Exception as e:
        #log.exception("Download Error! path:{0}, exception:{1}".format(path, str(e)))
        return "Download Error! \n", 503


def up():
    try:
       
                client = ipfshttpclient.connect(app.config['IPFS_CONNECT_URL'])
                res = client.add("E:\riss_project\forensic_eviden\forensic_eviden\static\0aba60ef-edc8-4bda-870c-b7fede2f3db0pay_cart.png")

                #log.info("upload res: {}".format(res), {'app': 'dfile-up-res'})
                url = app.config['DOMAIN'] + '/' + str(res['Hash'])
                return url


        # abort(400)

    except Exception as e:
        #log.exception("Upload Error! exception:{}".format(str(e)))
        print(e,"hiiiiiiiiiiiiiiiii")
        return "Upload Error! \n", 503

if __name__ == "__main__":
    app.run(debug=True,port=5000)
    print("DFile is running.")
