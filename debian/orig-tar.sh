#!/bin/sh -e

VERSION=$2
TAR=../tomcat8_$VERSION.orig.tar.xz
DIR=tomcat8-$VERSION
TAG=$(echo TOMCAT_$VERSION | sed -e 's/[\.~]/_/g')

svn export http://svn.apache.org/repos/asf/tomcat/tc8.5.x/tags/$TAG $DIR
tar -c -J -f $TAR --exclude 'taglibs-standard-*.jar' $DIR
rm -rf $DIR ../$TAG $3
