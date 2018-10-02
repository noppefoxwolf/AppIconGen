#!/bin/bash

if [ $# -eq 0 ]; then
    echo "A tag and token argument is needed!(ex: ./release.sh 1.2.3)"
    exit 1
fi

lib_name="appicongen"
tag=$1

podspec_name="AppIconGen.podspec"
cat "$podspec_name.tmp" | sed s/LATEST_RELEASE_VERSION_NUMBER/$tag/ > "$podspec_name"
pod trunk push $podspec_name
rm $podspec_name