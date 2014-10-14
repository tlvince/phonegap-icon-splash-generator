#!/bin/bash
# Generate PhoneGap icon and splash screens.
# Copyright 2013 Tom Vincent <http://tlvince.com/contact>

usage() { echo "usage: $0 icon colour [dest_dir]"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

devices=android,bada,bada-wac,blackberry,ios,webos,windows-phone
eval mkdir -p "$3/res/{icon,screen}/{$devices}"

# Show the user some progress by outputing all commands being run.
set -x

# Explicitly set background in case image is transparent (see: #3)
convert="convert -background none"
$convert "$1" -resize 128x128 "$3/res/icon/icon.png"

$convert "$1" -resize 36x36 "$3/res/icon/android/icon-36-ldpi.png"
$convert "$1" -resize 72x72 "$3/res/icon/android/icon-72-hdpi.png"
$convert "$1" -resize 48x48 "$3/res/icon/android/icon-48-mdpi.png"
$convert "$1" -resize 96x96 "$3/res/icon/android/icon-96-xhdpi.png"

$convert "$1" -resize 128x128 "$3/res/icon/bada/icon-128.png"

$convert "$1" -resize 48x48 "$3/res/icon/bada-wac/icon-48-type5.png"
$convert "$1" -resize 80x80 "$3/res/icon/bada-wac/icon-80-type4.png"
$convert "$1" -resize 50x50 "$3/res/icon/bada-wac/icon-50-type3.png"

$convert "$1" -resize 80x80 "$3/res/icon/blackberry/icon-80.png"

# iOS 7.0+
# iPhone / iPod Touch
$convert "$1" -resize 60x60 "$3/res/icon/ios/icon-60.png"
$convert "$1" -resize 120x120 "$3/res/icon/ios/icon-60@2x.png"
# iPad
$convert "$1" -resize 76x76 "$3/res/icon/ios/icon-76.png"
$convert "$1" -resize 152x152 "$3/res/icon/ios/icon-76@2.png"
# iOS 6.1
# Spotlight Icon
$convert "$1" -resize 40x40 "$3/res/icon/ios/icon-40.png"
$convert "$1" -resize 80x80 "$3/res/icon/ios/icon-40@2x.png"
# iPhone / iPod Touch
$convert "$1" -resize 57x57 "$3/res/icon/ios/icon.png"
$convert "$1" -resize 114x114 "$3/res/icon/ios/icon@2x.png"
# iPad
$convert "$1" -resize 72x72 "$3/res/icon/ios/icon-72.png"
$convert "$1" -resize 144x144 "$3/res/icon/ios/icon-72@2x.png"
# iPhone Spotlight and Settings Icon
$convert "$1" -resize 29x29 "$3/res/icon/ios/icon-small.png"
$convert "$1" -resize 58x58 "$3/res/icon/ios/icon-small@2x.png"
# iPad Spotlight and Settings Icon
$convert "$1" -resize 50x50 "$3/res/icon/ios/icon-50.png"
$convert "$1" -resize 100x100 "$3/res/icon/ios/icon-50@2x.png"

$convert "$1" -resize 64x64 "$3/res/icon/webos/icon-64.png"

$convert "$1" -resize 48x48 "$3/res/icon/windows-phone/icon-48.png"
$convert "$1" -resize 173x173 "$3/res/icon/windows-phone/icon-173-tile.png"
$convert "$1" -resize 62x62 "$3/res/icon/windows-phone/icon-62-tile.png"

convert="convert $1 -background $2 -gravity center"

$convert -resize 512x512 -extent 1280x720 "$3/res/screen/android/screen-xhdpi-landscape.png"
$convert -resize 256x256 -extent 480x800 "$3/res/screen/android/screen-hdpi-portrait.png"
$convert -resize 128x128 -extent 320x200 "$3/res/screen/android/screen-ldpi-landscape.png"
$convert -resize 512x512 -extent 720x1280 "$3/res/screen/android/screen-xhdpi-portrait.png"
$convert -resize 256x256 -extent 320x480 "$3/res/screen/android/screen-mdpi-portrait.png"
$convert -resize 256x256 -extent 480x320 "$3/res/screen/android/screen-mdpi-landscape.png"
$convert -resize 128x128 -extent 200x320 "$3/res/screen/android/screen-ldpi-portrait.png"
$convert -resize 256x256 -extent 800x480 "$3/res/screen/android/screen-hdpi-landscape.png"

$convert -resize 256x256 -extent 480x800 "$3/res/screen/bada/screen-portrait.png"

$convert -resize 128x128 -extent 320x480 "$3/res/screen/bada-wac/screen-type3.png"
$convert -resize 256x256 -extent 480x800 "$3/res/screen/bada-wac/screen-type4.png"
$convert -resize 128x128 -extent 240x400 "$3/res/screen/bada-wac/screen-type5.png"
$convert -resize 256x256 -extent 480x800 "$3/res/screen/bada-wac/screen-type5.png"

$convert -resize 128x128 -extent 225x225 "$3/res/screen/blackberry/screen-225.png"

$convert -resize 256x256 -extent 320x480 "$3/res/screen/ios/Default~iphone.png"
$convert -resize 512x512 -extent 640x960 "$3/res/screen/ios/Default@2x~iphone.png"
$convert -resize 1024x1024 -extent 768x1024 "$3/res/screen/ios/Default-Portrait~ipad.png"
$convert -resize 512x512 -extent 1536x2048 "$3/res/screen/ios/Default-Portrait@2x~ipad.png"
$convert -resize 256x256 -extent 1024x768 "$3/res/screen/ios/Default-Landscape~ipad.png"
$convert -resize 256x256 -extent 2048x1536 "$3/res/screen/ios/Default-Landscape@2x~ipad.png"
$convert -resize 256x256 -extent 640x1136 "$3/res/screen/ios/Default-568h@2x~iphone.png"

convert "$1" -resize 64x64 "$3/res/screen/webos/screen-64.png"

$convert -resize 256x256 -extent 480x800 "$3/res/screen/windows-phone/screen-portrait.jpg"
