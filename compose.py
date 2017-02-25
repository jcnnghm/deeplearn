#! /usr/bin/env python

import urllib2
import json
import yaml
import sys

if len(sys.argv) == 1:
    print "usage: %s service [key=value]..." % sys.argv[0]
    sys.exit(0)

resp = urllib2.urlopen("http://localhost:3476/docker/cli/json").read()

args = json.loads(resp)
args["volumes"] = args.pop("Volumes")
args["devices"] = args.pop("Devices")
args["volume_driver"] = args.pop("VolumeDriver")

doc = {sys.argv[1]: args}
for arg in sys.argv[2:]:
    k, v = arg.split("=")
    args[k] = v

yaml.safe_dump(doc, file('docker-compose.yml', 'w'), default_flow_style=False)
