#!/bin/sh

if [[ -z "$JENKINS_HOME" ]]; then
    echo "JENKINS_HOME is not defined" 1>&2
    exit 1
fi

mvn clean install -DskipTests || { echo "Build failed"; exit 1; }

rm -rf $JENKINS_HOME/plugins/analysis-core*
rm -rf $JENKINS_HOME/plugins/warnings*

cp -fv analysis-core*/target/*.hpi $JENKINS_HOME/plugins
cp -fv warnings*/target/*.hpi $JENKINS_HOME/plugins

cd $JENKINS_HOME
./go.sh


