#!/bin/sh
#
# Clones all static analysis suite modules.
#
# If you are planning to submit a PR you only need to fork the corresponding module and replace the GIT_ORANISATION with
# your user name.
#

PROTOCOL="git@github.com:"
GIT_ORGANISATION="jenkinsci"
MODEL_BRANCH="hm-edu-testing"
PLUGIN_BRANCH="hm-edu-testing"

git clone -b ${MODEL_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-model.git
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-config-plugin.git analysis-config
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-pom-plugin.git analysis-pom
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-core-plugin.git analysis-core
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/warnings-plugin.git warnings
