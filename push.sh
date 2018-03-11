#!/bin/sh

find . -type d -depth 1 -not -path "./.*" -exec git -C '{}' push -v \;
