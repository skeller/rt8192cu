#!/bin/sh

rm -Rf tmp
rm -f original new

mkdir tmp

echo "Unpacking tarball..."

tar -xvzf ../rtl8188C_8192C_usb_linux*.tar.gz -C ./tmp/ >/dev/null

echo "Creating symlinks..."

ln -s tmp/rtl8188C_8192C_usb_linux*/ original
ln -s ../ new

echo "Generating diff in rt8192cu_diff.patch"

diff -pur -X "exclude.txt" original new >rt8192cu_diff.patch
