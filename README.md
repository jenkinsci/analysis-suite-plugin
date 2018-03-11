Static Analysis Suite
=====================

This module provides a common setup for the 
[static analysis plugins](https://wiki.jenkins.io/display/JENKINS/Static+Code+Analysis+Plug-ins) of Jenkins. 
It provides IntelliJ IDEA configuration files for formatter, coding style, inspections and the CheckStyle plug-in. 
Moreover, this module provides an aggregator POM for maven so you can build all the static code analysis plugins
with one call. There are also some small scripts provided that simplify the build process.

See also [the contributing guidelines](CONTRIBUTING.md) if you are planning to write a pull request.
 
All plug-ins are maintained by Ullrich Hafner. For more details please refer to the wiki
page https://wiki.jenkins-ci.org/x/CwDgAQ.

## Getting started

The static analysis suite consists of a couple of sub-modules which are version controlled in different Git
repositories. In order to get started you need to integrate these modules in the working directory using the 
following steps.

1. Run the script `clone.sh`. This basically checks out all modules from GitHub using the following commands 
(Note that you will need a fork of the GitHub modules if you are planning to submit a PR):
```
git clone -b master git@github.com:jenkinsci/analysis-model.git analysis-mode
git clone -b 3.0 git@github.com:jenkinsci/analysis-config-plugin.git analysis-config
git clone -b 3.0 git@github.com:jenkinsci/analysis-pom-plugin.git analysis-pom
git clone -b 3.0 git@github.com:jenkinsci/analysis-core-plugin.git analysis-core
git clone -b 3.0 git@github.com:jenkinsci/warnings-plugin.git warnings-plugin
```
2. Verify that your directory looks like this:
```
-rw-r--r--   1 hafner  staff   5,0K 12 Okt 17:10 CONTRIBUTING.md
-rw-r--r--   1 hafner  staff   2,9K 11 Mär 16:51 README.md
drwxr-xr-x  11 hafner  staff   352B 11 Mär 16:48 analysis-config
drwxr-xr-x  23 hafner  staff   736B 11 Mär 16:49 analysis-core
drwxr-xr-x  17 hafner  staff   544B 11 Mär 16:47 analysis-model
drwxr-xr-x   8 hafner  staff   256B 11 Mär 16:48 analysis-pom
-rw-r--r--   1 hafner  staff   574B 11 Nov 21:32 analysis-suite.iml
-rwxr-xr-x   1 hafner  staff   374B 11 Mär 16:47 clean.sh
-rwxr-xr-x   1 hafner  staff   718B 11 Mär 16:41 clone.sh
-rwxr-xr-x   1 hafner  staff   355B 11 Mär 16:51 compile.sh
-rwxr-xr-x   1 hafner  staff    79B  3 Okt 14:25 german.sh
-rwxr-xr-x   1 hafner  staff   374B 11 Mär 16:51 go.sh
-rwxr-xr-x   1 hafner  staff    42B 17 Okt 11:25 jenkins.sh
-rw-r--r--   1 hafner  staff   1,0K 11 Mär 16:40 pom.xml
-rwxr-xr-x   1 hafner  staff    48B  3 Okt 14:25 pull.sh
-rwxr-xr-x   1 hafner  staff    48B  3 Okt 14:25 push.sh
-rwxr-xr-x   1 hafner  staff   386B 11 Mär 16:51 skip.sh
drwxr-xr-x  16 hafner  staff   512B 11 Mär 16:50 warnings
```
3. Verify the installation by running Maven using the command `mvn verify`. The build will require some time since 
all unit and integration tests are started. The successful output of the command should look like:
```
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO] 
[INFO] Static Analysis Model and Parsers .................. SUCCESS [ 43.356 s]
[INFO] Static Analysis Plug-ins Tools Configuration ....... SUCCESS [  0.563 s]
[INFO] Static Analysis Plug-ins Parent POM ................ SUCCESS [ 20.767 s]
[INFO] Static Analysis Utilities .......................... SUCCESS [02:06 min]
[INFO] Warnings Plug-in ................................... SUCCESS [08:03 min]
[INFO] Jenkins Static Analysis Suite ...................... SUCCESS [  0.012 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```
4. Start IntelliJ and use the `Open...` menu.
5. Select the top level folder 'analysis-suite' and press `Open`
    1. If IntelliJ reports 'Non-managed pom.xml file found': Select the option 'Add as Maven Project'
    2. If IntelliJ reports 'Maven projects need to be imported': Select the Option 'Enable Auto-Import'
    3. If IntelliJ reports 'Unregistered VCS roots detected': select 'Add roots'
    4. Verify that the modules structure looks like the filesystem structure and no module is missing.
    5. Select the module 'analysis-model' and press `Run All Tests`
    6. If IntelliJ reports 'Project SDK not set': set the SDK to a Java 8 JDK on your machine
    7. Additionally set the Project Language Level to Java 8
6. Select the module 'analysis-core' and press `Run All Tests`
7. Select the module 'warnings' and press `Run All Tests`
