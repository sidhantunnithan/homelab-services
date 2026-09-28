#!/bin/sh -e
# Pre-create the system databases so CouchDB comes up clean as a single node.
#
# Deliberately no [admins] entry: the admin is created at runtime from
# COUCHDB_USER / COUCHDB_PASSWORD. Baking one in here put a generated
# credential into an image layer, and with `sh -x` into the build log too.

cat >/opt/couchdb/etc/local.ini <<INI
[couchdb]
single_node=true
INI

nohup bash -c "/docker-entrypoint.sh /opt/couchdb/bin/couchdb &"
sleep 15

curl -X PUT http://127.0.0.1:5984/_users
curl -X PUT http://127.0.0.1:5984/_replicator
