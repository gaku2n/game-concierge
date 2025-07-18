#!/bin/sh
# dart-defineの値を抽出してxcconfigファイルに書き込む
# Extract dart-define values and write to xcconfig file

OUTPUT_FILE="${SRCROOT}/Flutter/Dart-Defines.xcconfig"
: > "$OUTPUT_FILE"

function decode_url() { echo "${*}" | base64 --decode; }

if [ -n "$DART_DEFINES" ]; then
    IFS=',' read -r -a define_items <<<"$DART_DEFINES"
    
    for index in "${!define_items[@]}"; do
        item=$(decode_url "${define_items[$index]}")
        lowercase_item=$(echo "$item" | tr '[:upper:]' '[:lower:]')
        if [[ $lowercase_item != flutter* ]]; then
            key=$(echo "$item" | cut -d'=' -f1)
            value=$(echo "$item" | cut -d'=' -f2-)
            echo "$key=$value" >> "$OUTPUT_FILE"
        fi
    done
fi
