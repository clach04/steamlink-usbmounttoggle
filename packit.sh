#!/bin/sh

# tar -c -f archive.tar --owner=0 --group=0 .

name=usbmounttoggle
tar -zcvf $name.tgz --owner=0 --group=0 $name

echo ''
echo now place $name.tgz on to USB drive in directory:
echo ''
echo '           \steamlink\apps  # Windows'
echo '           /steamlink/apps  # Linux/Unix'
