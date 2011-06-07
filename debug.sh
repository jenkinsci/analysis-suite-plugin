#!/bin/bash

rm -rf $HUDSON_HOME/plugins/analysis-*
rm -rf $HUDSON_HOME/plugins/checkstyle*
rm -rf $HUDSON_HOME/plugins/dry*
rm -rf $HUDSON_HOME/plugins/findbugs*
rm -rf $HUDSON_HOME/plugins/pmd*
rm -rf $HUDSON_HOME/plugins/tasks*
rm -rf $HUDSON_HOME/plugins/warnings*

mvn install

cd ../
cp */target/*.hpi $HUDSON_HOME/plugins
cp findbugs/plugin/target/*.hpi $HUDSON_HOME/plugins

cd $HUDSON_HOME
java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=8000,suspend=n -jar jenkins.war


