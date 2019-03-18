#!/bin/tcsh
# ---------------------------------------------------------------------------
#   restart TOMCAT service
#      dependent on the TOMCAT_HOME environment variable
# ---------------------------------------------------------------------------
cd $TOMCAT_HOME/conf
../bin/shutdown.sh
../bin/startup.sh
