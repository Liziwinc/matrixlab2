#!/bin/bash
set -e

PACKAGE_NAME="matrix-task"
VERSION="1.0"
BUILD_DIR="build_package"

echo "Creating package structure..."
mkdir -p $BUILD_DIR/DEBIAN
mkdir -p $BUILD_DIR/usr/bin

cat <<EOF > $BUILD_DIR/DEBIAN/control
Package: $PACKAGE_NAME
Version: $VERSION
Section: utils
Priority: optional
Architecture: amd64
Maintainer: Mikhail
Description: Matrix processing tool for Lab 2.
EOF

echo "Compiling and installing..."
cd src
make clean
make
cp matrix_task ../$BUILD_DIR/usr/bin/
cd ..

echo "Building .deb package..."
dpkg-deb --build $BUILD_DIR
mv ${BUILD_DIR}.deb ${PACKAGE_NAME}_${VERSION}.deb

echo "Done!"
