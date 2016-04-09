#!/bin/sh

UNITYLIBS="/Applications/Unity/Unity.app/Contents/PlaybackEngines/AndroidPlayer/development/bin/classes.jar"
#if you are using a version before Unity 4.5, comment the line above and use the below one instead
#UNITYLIBS="/Applications/Unity/Unity.app/Contents/PlaybackEngines/AndroidPlayer/bin/classes.jar"

# OTHERLIBS="/YourProjectPath/Assets/Plugins/OtherPlugin.jar"
# ANDROIDCOMMAND="/Users/xxxx/Library/Android/sdk/tools/android"
ANDROIDCOMMAND="/usr/local/bin/android"

# Do not modify lines below
DSTDIR="./"
export ANT_OPTS=-Dfile.encoding=UTF8
$ANDROIDCOMMAND update project -p . --target 1

mkdir -p libs
cp $UNITYLIBS libs
cp $OTHERLIBS libs
ant release
mkdir -p $DSTDIR
cp -a bin/classes.jar $DSTDIR/UniWebView.jar
ant clean
rm -rf libs res proguard-project.txt
