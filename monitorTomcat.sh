#!/bin/tcsh
# ---------------------------------------------------------------------------
#   monitor TOMCAT service
#      dependent on the TOMCAT_HOME environment variable
# ---------------------------------------------------------------------------
cd $TOMCAT_HOME/logs
tail -f catalina.out

