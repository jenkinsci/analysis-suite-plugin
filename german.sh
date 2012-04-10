#!/bin/bash

mvn stapler:i18n -Dlocale=de || { echo "Build failed"; exit 1; }

