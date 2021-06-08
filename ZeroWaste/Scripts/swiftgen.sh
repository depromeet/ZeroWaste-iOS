#!/bin/sh
RESOURCES_DIR_PATH="../ZeroWaste/Resource"
HASH_FILE_PATH="$RESOURCES_DIR_PATH/checksum.md5"

current_resources_hash=`find $RESOURCES_DIR_PATH -type f ! -path "$HASH_FILE_PATH" -print0 | sort -z | xargs -0 md5 | md5`

resources_hash_changed() {
  touch $HASH_FILE_PATH
  old_resources_hash=`cat $HASH_FILE_PATH`
  [ "$old_resources_hash" != "$current_resources_hash" ]
}

if resources_hash_changed
then
  (cd .. && swiftgen)
  echo $current_resources_hash >| $HASH_FILE_PATH
fi

