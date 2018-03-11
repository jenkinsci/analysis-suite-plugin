#!/bin/bash

if [[ -z "$JENKINS_HOME" ]]; then
    echo "JENKINS_HOME is not defined" 1>&2
    exit 1
fi

mvn install || { echo "Build failed"; exit 1; }

rm -rf $JENKINS_HOME/plugins/analysis-core*
rm -rf $JENKINS_HOME/plugins/warnings*

cp ../analysis-core*/target/*.hpi $JENKINS_HOME/plugins
cp ../warnings*/target/*.hpi $JENKINS_HOME/plugins

cd $JENKINS_HOME
./go.sh


