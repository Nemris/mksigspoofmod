#!/bin/bash

set -e

scriptdir="$(dirname "$0")"
basedir="$(realpath ".")"
moddir="$basedir/sigspoof"
frameworkdir="$moddir/system/framework"
settingsdir="$moddir/system/priv-app/Settings"

clean_mod_dir() {
    rm -rf "$moddir"
}

unpack_template() {
    unzip -q "$scriptdir/template.zip"
}

place_fileset() {
    cp "$1"/{ext,framework,services}.jar "$frameworkdir"
    cp "$1/Settings.apk" "$settingsdir"
}

pack_module() {
    local modname="SignatureSpoofing-v0.1.0.zip"

    cd "$moddir"
    zip -9rq "../$modname" .

    cd - > /dev/null
}

main() {
    clean_mod_dir
    unpack_template
    place_fileset "$1"
    pack_module
    clean_mod_dir
}

if [ $# -ne 1 ]; then
    echo "Usage: $(basename "$0") fileset" 1>&2
    exit 1
fi

main "$1"
