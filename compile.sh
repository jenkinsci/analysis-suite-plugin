#!/bin/bash

if [[ -z "$JENKINS_HOME" ]]; then
    echo "JENKINS_HOME is not defined" 1>&2
    exit 1
fi

mvn verify || { echo "Build failed"; exit 1; }

rm -rf $JENKINS_HOME/plugins/analysis-core*
rm -rf $JENKINS_HOME/plugins/warnings*

cp -v analysis-core*/target/*.hpi $JENKINS_HOME/plugins
cp -v warnings*/target/*.hpi $JENKINS_HOME/plugins



