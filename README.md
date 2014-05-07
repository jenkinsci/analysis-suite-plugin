analysis-suite-plugin
=====================

This module combines all static code analysis plugins within a single project. All parts
(checkstyle, PMD, etc.) are referenced with Git submodules. After cloning this suite you
can get the referenced submodules using the following commands:

git submodule init
git submodule update

Then you can build all plug-ins by running mvn install in the toplevel folder. 

All plug-in are maintained by Ullrich Hafner. For more details please refer to the wiki
page https://wiki.jenkins-ci.org/x/CwDgAQ.
