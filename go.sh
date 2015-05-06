#!/bin/bash

mvn install || { echo "Build failed"; exit 1; }

rm -rf $JENKINS_HOME/plugins/analysis-*
rm -rf $JENKINS_HOME/plugins/checkstyle*
rm -rf $JENKINS_HOME/plugins/dry*
rm -rf $JENKINS_HOME/plugins/findbugs*
rm -rf $JENKINS_HOME/plugins/pmd*
rm -rf $JENKINS_HOME/plugins/tasks*
rm -rf $JENKINS_HOME/plugins/warnings*

cp */target/*.hpi $JENKINS_HOME/plugins
cp findbugs/plugin/target/*.hpi $JENKINS_HOME/plugins

cd $JENKINS_HOME
./go.sh


