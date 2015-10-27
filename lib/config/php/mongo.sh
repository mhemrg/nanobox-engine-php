# -*- mode: bash; tab-width: 2; -*-
# vim: ts=2 sw=2 ft=bash noet

create_php_mongo_ini() {
  template \
    "php/php.d/mongo.ini.mustache" \
    "$(payload 'etc_dir')/php.d/mongo.ini" \
    "$(mongo_ini_payload)"
}

mongo_ini_payload() {
  cat <<-END
{
  "mongo_native_long": "$(mongo_native_long)",
  "mongo_allow_empty_keys": "$(mongo_allow_empty_keys)",
  "mongo_cmd": "$(mongo_cmd)",
  "mongo_long_as_object": "$(mongo_long_as_object)"
}
END
}

mongo_native_long() {
  # boxfile php_mongo_native_long
  php_mongo_native_long=$(validate "$(payload boxfile_php_mongo_native_long)" "integer" "1")
  >&2 echo "   Using ${php_mongo_native_long} as Mongo native long"
  echo "$php_mongo_native_long"
}

mongo_allow_empty_keys() {
  # boxfile php_mongo_allow_empty_keys
  php_mongo_allow_empty_keys=$(validate "$(payload boxfile_php_mongo_allow_empty_keys)" "integer" "0")
  >&2 echo "   Using ${php_mongo_allow_empty_keys} as Mongo allow empty keys"
  echo "$php_mongo_allow_empty_keys"
}

mongo_cmd() {
  # boxfile php_mongo_cmd
  php_mongo_cmd=$(validate "$(payload boxfile_php_mongo_cmd)" "string" "\$")
  >&2 echo "   Using ${php_mongo_cmd} as Mongo cmd"
  echo "$php_mongo_cmd"
}

mongo_long_as_object() {
  # boxfile php_mongo_long_as_object
  php_mongo_long_as_object=$(validate "$(payload boxfile_php_mongo_long_as_object)" "integer" "0")
  >&2 echo "   Using ${php_mongo_long_as_object} as Mongo long as object"
  echo "$php_mongo_long_as_object"
}