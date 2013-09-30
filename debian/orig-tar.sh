#!/bin/sh -e

VERSION=$2
TAR=../tomcat8_$VERSION.orig.tar.xz
DIR=tomcat8-$VERSION
TAG=$(echo TOMCAT_$VERSION | sed -e 's/[\.~]/_/g')

svn export http://svn.apache.org/repos/asf/tomcat/tags/$TAG $DIR
tar -c -J -f $TAR --exclude 'standard.jar' --exclude 'jstl.jar' $DIR
rm -rf $DIR ../$TAG $3

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi

