#!/bin/bash
PACKAGE_NAME="matrix-task"
VERSION="1.0"
BUILD_DIR="build_package"

mkdir -p $BUILD_DIR/DEBIAN
mkdir -p $BUILD_DIR/usr/bin

cat <<EOF > $BUILD_DIR/DEBIAN/control
Package: PACKAGE_NAME
Version: VERSION
Section: utils
Priority: optional
Architecture: amd64
Maintainer: Misha <email@example.com>
Description: program var 9, lab 2.
EOF

cd src && make clean && make
make install DESTDIR=../$BUILD_DIR

cd ..
dpkg-deb --build $BUILD_DIR
mv ${$BUILD_DIR}.deb ${PACKAGE_NAME}_${VERSION}.deb