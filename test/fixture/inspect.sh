#!/bin/sh
set -x
../../../gtfs-binary/.venv/bin/gtb_inspect ${1:+-b $1} feed.gtb
