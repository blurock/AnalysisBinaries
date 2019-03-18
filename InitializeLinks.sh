#! /usr/bin/tcsh -f
#
# FILE     InitializeLinks.sh
# PACKAGE  Maintenance
# AUTHORS  Edward S. Blurock
#
# CONTENT
#   Initialization of the links to various programs and scripts
#
#c COPYRIGHT (C) 1997 RISC Linz
set verbose on

pushd $ANALYSIS_BASE/bin

ln -s $ANALYSIS_BASE/tools/programs/Initial/InitializeData.sh InitializeData.sh
