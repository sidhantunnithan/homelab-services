#!/bin/sh -e
# Configure CouchDB as a single node.
#
# Nothing is started here and no admin is created. CouchDB 3.x refuses to boot
# without an admin, which is why this script used to generate a `dbadmin`
# account at build time - baking a credential into an image layer (and, under
# `sh -x`, into the build log).
#
# With single_node=true the official entrypoint creates the admin from
# COUCHDB_USER / COUCHDB_PASSWORD and provisions _users, _replicator and
# _global_changes on first start, so the build needs no credential at all.

cat >/opt/couchdb/etc/local.ini <<INI
[couchdb]
single_node=true
INI
