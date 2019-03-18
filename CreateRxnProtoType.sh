#!/bin/csh
#
# FILE     NewCodePackage
# PACKAGE  Maintenance
# AUTHORS  Andreas Neubacher
#          modified for general code package by Edward S. Blurock
#
# CONTENT
#   Shell script for setting up a new package in a specified environment
#
#c COPYRIGHT (C) 1997 RISC Linz

if( $#argv <  2) then
    echo "Usage: CreateDataProtoType.sh Object SubClass"
    echo "      Object:       The new Object (BaseDataObject)"
    echo "      SubClass:     The super class of the object"
    exit(1)
endif

set OBJECT         = $1
set SUB_CLASS      = $2

set OBJECT_REPLACE    = =Object=
set SUB_CLASS_REPLACE = =SubClass=

set PROTO_TYPE_CC  = $REACTION_BASE/tools/ProtoTypes/RxnClassPrototype.cc
set PROTO_TYPE_HH  = $REACTION_BASE/tools/ProtoTypes/RxnClassPrototype.hh

set CC_FILE        = $OBJECT'.cc'
set HH_FILE        = $OBJECT'.hh'

echo $CC_FILE
echo $HH_FILE


sed "s/$OBJECT_REPLACE/$OBJECT/g;\
     s/$SUB_CLASS_REPLACE/$SUB_CLASS/g"\
     $PROTO_TYPE_CC >! $CC_FILE
sed "s/$OBJECT_REPLACE/$OBJECT/g;\
     s/$SUB_CLASS_REPLACE/$SUB_CLASS/g"\
     $PROTO_TYPE_HH >! $HH_FILE

exit(0)
