#!/bin/bash
# Generate PhoneGap icon and splash screens.
# Copyright 2013 Tom Vincent <http://tlvince.com/contact>

usage() { echo "usage: $0 icon colour [dest_dir usually 'res']"; exit 1; }

[ "$1" ] && [ "$2" ] || usage
[ "$3" ] || set "$1" "$2" "."

# Show the user some progress by outputing all commands being run.
set -x

devices=android,ios,windows-phone
eval mkdir -p "$3/{icon,splash}/{$devices}"

# Explicitly set background in case image is transparent (see: #3)
convert="convert -background none"

### ICONS

# Default icon
$convert "$1" -resize 128x128 "$3/icon.png"

# Android icon
$convert "$1" -resize 36x36     "$3/android/icon-36-ldpi.png"
$convert "$1" -resize 72x72     "$3/android/icon-72-hdpi.png"
$convert "$1" -resize 48x48     "$3/android/icon-48-mdpi.png"
$convert "$1" -resize 96x96     "$3/android/icon-96-xhdpi.png"
$convert "$1" -resize 144x144   "$3/android/icon-144-xxhdpi.png"
$convert "$1" -resize 192x192   "$3/android/icon-192-xxxhdpi.png"

# iOS icons app
$convert "$1" -resize 57x57 	"$3/ios/icon.png"
$convert "$1" -resize 114x114   "$3/ios/icon@2x.png"
$convert "$1" -resize 60x60     "$3/ios/icon-60.png"
$convert "$1" -resize 120x120   "$3/ios/icon-60@2x.png"
$convert "$1" -resize 180x180   "$3/ios/icon-60@3x.png"
$convert "$1" -resize 72x72 	"$3/ios/icon-72.png"
$convert "$1" -resize 144x144   "$3/ios/icon-72@2x.png"
$convert "$1" -resize 76x76 	"$3/ios/icon-76.png"
$convert "$1" -resize 152x152   "$3/ios/icon-76@2x.png"
$convert "$1" -resize 167x167   "$3/ios/icon-83.5@2x.png"

# iOS icons spotlight
$convert "$1" -resize 29x29 	"$3/ios/icon-small.png"
$convert "$1" -resize 58x58 	"$3/ios/icon-small@2x.png"
$convert "$1" -resize 87x87     "$3/ios/icon-small@3x.png"
$convert "$1" -resize 40x40 	"$3/ios/icon-40.png"
$convert "$1" -resize 80x80 	"$3/ios/icon-40@2x.png"
$convert "$1" -resize 120x120 	"$3/ios/icon-40@3x.png"
$convert "$1" -resize 50x50 	"$3/ios/icon-50.png"
$convert "$1" -resize 100x100 	"$3/ios/icon-50@2x.png"
$convert "$1" -resize 120x120 	"$3/ios/icon-40@3.png"
$convert "$1" -resize 180x180 	"$3/ios/icon-40@4.png"

# Windows Phone icon
$convert "$1" -resize 44x44       "$3/windows/Square44x44Logo.scale-100.png"
$convert "$1" -resize 106x106     "$3/windows/Square44x44Logo.scale-240.png"
$convert "$1" -resize 150x150     "$3/windows/Square150x150Logo.scale-100.png"
$convert "$1" -resize 360x360     "$3/windows/Square150x150Logo.scale-240.png"
$convert "$1" -resize 71x71       "$3/windows/Square71x71Logo.scale-100.png"
$convert "$1" -resize 170x170     "$3/windows/Square71x71Logo.scale-240.png"
$convert "$1" -resize 150x150 extent 310x150    "$3/windows/Wide310x150Logo.scale-100.png"
$convert "$1" -resize 360x360 extent 744x150    "$3/windows/Wide310x150Logo.scale-240.png"

### SPLASH SCREENS
convert="convert $1 -background $2 -gravity center"

# Default splash screen
$convert -resize 1024x1024 -extent 1536x2008 	"$3/Default-Portrait@2x.png"

# Android splash screens
$convert -resize 512x512 -extent 1920x1280   "$3/android/screen-xxxhdpi-landscape.png"
$convert -resize 512x512 -extent 1280x1920   "$3/android/screen-xxxhdpi-portrait.png"
$convert -resize 512x512 -extent 1600x960   "$3/android/screen-xxhdpi-landscape.png"
$convert -resize 512x512 -extent 960x1600   "$3/android/screen-xxhdpi-portrait.png"
$convert -resize 512x512 -extent 1280x720   "$3/android/screen-xhdpi-landscape.png"
$convert -resize 512x512 -extent 720x1280   "$3/android/screen-xhdpi-portrait.png"
$convert -resize 256x256 -extent 800x480    "$3/android/screen-hdpi-landscape.png"
$convert -resize 256x256 -extent 480x800    "$3/android/screen-hdpi-portrait.png"
$convert -resize 256x256 -extent 480x320    "$3/android/screen-mdpi-landscape.png"
$convert -resize 256x256 -extent 320x480    "$3/android/screen-mdpi-portrait.png"
$convert -resize 128x128 -extent 320x200    "$3/android//screen-ldpi-landscape.png"
$convert -resize 128x128 -extent 200x320    "$3/android/screen-ldpi-portrait.png"

# iOS splash screens
$convert -resize 256x256 -extent 320x480 		"$3/ios/Default.png"
$convert -resize 512x512 -extent 640x960 		"$3/ios/Default@2x.png"
$convert -resize 512x512 -extent 640x1136 		"$3/ios/Default-568h@2x.png"
$convert -resize 512x512 -extent 768x1024 		"$3/ios/Default-Portrait.png"
$convert -resize 512x512 -extent 1536x2048 	    "$3/ios/Default-Portrait@2x.png"
$convert -resize 512x512 -extent 1024x768 		"$3/ios/Default-Landscape.png"
$convert -resize 512x512 -extent 2048x1536 	    "$3/ios/Default-Landscape@2x.png"
$convert -resize 512x512 -extent 750x1334       "$3/ios/Default-667h@2x.png"
$convert -resize 512x512 -extent 1242x2208      "$3/ios/Default-Portrait-736h@3x.png"
$convert -resize 512x512 -extent 2208x1242      "$3/ios/Default-Landscape-736h@3x.png"
$convert -resize 512x512 -extent 2048x2732      "$3/ios/Default-Portrait-Pro.png"
$convert -resize 512x512 -extent 2732x2048      "$3/ios/Default-Landscape-Pro.png"

# Windows Phone splash screen
$convert -resize 512x512 -extent 1152x1920      "$3/windows/windows-phone/SplashScreenPhone.scale-240.png"
$convert -resize 256x256 -extent 480x800        "$3/windows/windows-phone/screen-portrait.jpg"
$convert -resize 512x512 -extent 768x1280       "$3/windows/windows-phone/SplashScreenImage.jpg"