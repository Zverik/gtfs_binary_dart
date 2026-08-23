#!/bin/sh
GTFS_BINARY=../../../../gtfs-binary/.venv/bin/gtfs_binary

cd feed
zip feed.zip *.txt
$GTFS_BINARY feed.zip -o ../feed.gtb --base-date 2026-06-01
rm feed.zip
