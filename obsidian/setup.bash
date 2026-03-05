# Prepare environment variables.
export hostname=localhost:5984
export username=$OBSIDIAN_COUCHDB_USER
export password=$OBSIDIAN_COUCHDB_PASSWORD

curl -s https://raw.githubusercontent.com/vrtmrz/obsidian-livesync/main/utils/couchdb/couchdb-init.sh | bash
