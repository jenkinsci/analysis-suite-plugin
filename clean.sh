#!/bin/bash

mvn clean install || { echo "Build failed"; exit 1; }

rm -rf $JENKINS_HOME/plugins/analysis-core*
rm -rf $JENKINS_HOME/plugins/warnings*

cp ../analysis-core*/target/*.hpi $JENKINS_HOME/plugins
cp ../warnings*/target/*.hpi $JENKINS_HOME/plugins

cd $JENKINS_HOME
./go.sh


