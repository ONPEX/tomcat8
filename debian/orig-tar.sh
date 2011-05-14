#!/bin/sh -e

VERSION=$2
TAR=../tomcat6_$VERSION.orig.tar.gz
DIR=tomcat6-$VERSION
TAG=$(echo TOMCAT_$VERSION | sed -e 's/\./_/g')

svn export http://svn.apache.org/repos/asf/tomcat/tc6.0.x/tags/$TAG $DIR
tar -c -z -f $TAR --exclude 'standard.jar' --exclude 'jstl.jar' $DIR
rm -rf $DIR ../$TAG

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi

