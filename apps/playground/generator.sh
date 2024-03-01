#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

script_dir="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

mkdir -p "${script_dir}/source/Generated"

rm "${script_dir}/source/Generated"/* 2>/dev/null || true

echo "Creating ScriptObject.hpp"
cat > "${script_dir}/source/Generated/ScriptObject.hpp" <<< '
#pragma once

class ScriptObject {

    int _x;

public:

    ScriptObject(int x);

    int getX() const { return _x; }
  
};
'
echo "Creating ScriptObject.cpp"
cat > "${script_dir}/source/Generated/ScriptObject.cpp"<<< '
#include "ScriptObject.hpp"

ScriptObject::ScriptObject(int x)
: _x(x) {}
'

if [ $# -eq 1 ] ; then
    echo "Creating dummy.cpp"
    timestamp=$(date +%s)
    echo "//Created swig wrappers with timestamp: ${timestamp}" > "${1}"
fi

