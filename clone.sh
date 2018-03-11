#!/bin/sh
#
# Clones all static analysis suite modules.
#
# If you are planning to submit a PR you only need to fork the corresponding module and replace the GIT_ORANISATION with
# your user name.
#

PROTOCOL="git@github.com:"
GIT_ORGANISATION="jenkinsci"
MODEL_BRANCH="master"
PLUGIN_BRANCH="3.0"

git clone -b ${MODEL_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-model.git
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-config-plugin.git
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-pom-plugin.git
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/analysis-core-plugin.git
git clone -b ${PLUGIN_BRANCH} ${PROTOCOL}${GIT_ORGANISATION}/warnings-plugin.git
