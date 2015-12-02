#!/bin/bash
# Generate PhoneGap icon and splash screens.
# Copyright 2013 Tom Vincent <http://tlvince.com/contact>

usage() { echo "usage: $0 icon colour [dest_dir]"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

# Show the user some progress by outputing all commands being run.
set -x

devices=android,ios,windows-phone
eval mkdir -p "$3/assets/res/{icon,splash}/{$devices}"

# Explicitly set background in case image is transparent (see: #3)
convert="convert -background none"

### ICONS

# Default icon
$convert "$1" -resize 128x128 "$3/icon.png"

# Android icon
$convert "$1" -resize 36x36     "$3/assets/res/icon/android/icon-36-ldpi.png"
$convert "$1" -resize 72x72     "$3/assets/res/icon/android/icon-72-hdpi.png"
$convert "$1" -resize 48x48     "$3/assets/res/icon/android/icon-48-mdpi.png"
$convert "$1" -resize 96x96     "$3/assets/res/icon/android/icon-96-xhdpi.png"
$convert "$1" -resize 144x144   "$3/assets/res/icon/android/icon-144-xxhdpi.png"
$convert "$1" -resize 192x192   "$3/assets/res/icon/android/icon-192-xxxhdpi.png"

# iOS icons app
$convert "$1" -resize 57x57 	"$3/assets/res/icon/ios/icon.png"
$convert "$1" -resize 114x114   "$3/assets/res/icon/ios/icon-@2x.png"
$convert "$1" -resize 60x60     "$3/assets/res/icon/ios/icon-60.png"
$convert "$1" -resize 120x120   "$3/assets/res/icon/ios/icon-60@2x.png"
$convert "$1" -resize 180x180   "$3/assets/res/icon/ios/icon-60@3x.png"
$convert "$1" -resize 72x72 	"$3/assets/res/icon/ios/icon-72.png"
$convert "$1" -resize 144x144   "$3/assets/res/icon/ios/icon-72@2x.png"
$convert "$1" -resize 76x76 	"$3/assets/res/icon/ios/icon-76.png"
$convert "$1" -resize 152x152   "$3/assets/res/icon/ios/icon-76@2x.png"
$convert "$1" -resize 167x167   "$3/assets/res/icon/ios/icon-167.png"

# iOS icons spotlight
$convert "$1" -resize 29x29 	"$3/assets/res/icon/ios/icon-small.png"
$convert "$1" -resize 58x58 	"$3/assets/res/icon/ios/icon-small@2x.png"
$convert "$1" -resize 40x40 	"$3/assets/res/icon/ios/icon-40.png"
$convert "$1" -resize 80x80 	"$3/assets/res/icon/ios/icon-40@2x.png"
$convert "$1" -resize 50x50 	"$3/assets/res/icon/ios/icon-50.png"
$convert "$1" -resize 100x100 	"$3/assets/res/icon/ios/icon-50@2x.png"
$convert "$1" -resize 120x120 	"$3/assets/res/icon/ios/icon-40@3.png"
$convert "$1" -resize 180x180 	"$3/assets/res/icon/ios/icon-40@4.png"

# Windows Phone icon
$convert "$1" -resize 48x48     "$3/assets/res/icon/windows-phone/icon-48.png"
$convert "$1" -resize 62x62     "$3/assets/res/icon/windows-phone/icon-62-tile.png"
$convert "$1" -resize 99x99     "$3/assets/res/icon/windows-phone/ApplicationIcon.png"
$convert "$1" -resize 159x159   "$3/assets/res/icon/windows-phone/Background.png"
$convert "$1" -resize 173x173   "$3/assets/res/icon/windows-phone/icon-173-tile.png"

### SPLASH SCREENS
convert="convert $1 -background $2 -gravity center"

# Default splash screen
$convert -resize 1024x1024 -extent 1536x2008 	"$3/assets/res/splash/ios/Default-Portrait@2x.png"

# Android splash screens
$convert -resize 512x512 -extent 1280x720   "$3/assets/res/splash/android/screen-xhdpi-landscape.png"
$convert -resize 512x512 -extent 720x1280   "$3/assets/res/splash/android/screen-xhdpi-portrait.png"
$convert -resize 256x256 -extent 800x480    "$3/assets/res/splash/android/screen-hdpi-landscape.png"
$convert -resize 256x256 -extent 480x800    "$3/assets/res/splash/android/screen-hdpi-portrait.png"
$convert -resize 256x256 -extent 480x320    "$3/assets/res/splash/android/screen-mdpi-landscape.png"
$convert -resize 256x256 -extent 320x480    "$3/assets/res/splash/android/screen-mdpi-portrait.png"
$convert -resize 128x128 -extent 320x200    "$3/assets/res/splash/android/screen-ldpi-landscape.png"
$convert -resize 128x128 -extent 200x320    "$3/assets/res/splash/android/screen-ldpi-portrait.png"

# iOS splash screens
$convert -resize 256x256 -extent 320x480 		"$3/assets/res/splash/ios/Default.png"
$convert -resize 512x512 -extent 640x960 		"$3/assets/res/splash/ios/Default@2x.png"
$convert -resize 512x512 -extent 640x1136 		"$3/assets/res/splash/ios/Default-568h@2x.png"
$convert -resize 512x512 -extent 768x1024 		"$3/assets/res/splash/ios/Default-Portrait.png"
$convert -resize 512x512 -extent 1536x2048 	    "$3/assets/res/splash/ios/Default-Portrait@2x.png"
$convert -resize 512x512 -extent 1024x768 		"$3/assets/res/splash/ios/Default-Landscape.png"
$convert -resize 512x512 -extent 2048x1536 	    "$3/assets/res/splash/ios/Default-Landscape@2x.png"
$convert -resize 512x512 -extent 750x1334       "$3/assets/res/splash/ios/Default-667h@2x.png"
$convert -resize 512x512 -extent 1242x2208      "$3/assets/res/splash/ios/Default-Portrait-736h@3x.png"
$convert -resize 512x512 -extent 2208x1242      "$3/assets/res/splash/ios/Default-Landscape-736h@3x.png"
$convert -resize 512x512 -extent 2048x2732      "$3/assets/res/splash/ios/Default-Portrait-Pro.png"
$convert -resize 512x512 -extent 2732x2048      "$3/assets/res/splash/ios/Default-Landscape-Pro.png"

# Windows Phone splash screen
$convert -resize 256x256 -extent 480x800        "$3/assets/res/splash/windows-phone/screen-portrait.jpg"
$convert -resize 512x512 -extent 768x1280       "$3/assets/res/splash/windows-phone/SplashScreenImage.jpg"