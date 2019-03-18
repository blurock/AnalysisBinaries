#!/bin/tcsh
# ---------------------------------------------------------------------------
#   start TOMCAT service
#      dependent on the TOMCAT_HOME environment variable
# ---------------------------------------------------------------------------
cd $TOMCAT_HOME/conf
../bin/startup.sh
