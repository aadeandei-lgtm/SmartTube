# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /usr/local/google/home/cartland/android-sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Begin Enable minification

#-ignorewarnings
-dontobfuscate

-keepattributes SourceFile,LineNumberTable
-keepattributes Signature
-keepattributes *Annotation*
#-keepattributes InnerClasses

#-keep public class com.liskovsoft.youtubeapi.** { *; }
#-keep class okhttp3.**{*;}
#-keep interface okhttp3.** { *; }

-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-dontwarn com.jayway.jsonpath.**
-dontwarn retrofit2.**
-dontwarn org.slf4j.**

# JNI-facing libraries: libj2v8.so resolves Java classes via FindClass in JNI_OnLoad;
# R8 renaming/stripping crashes the app (ClassNotFoundException V8Inspector -> abort).
-keep class com.eclipsesource.v8.** { *; }
-keepclassmembers class com.eclipsesource.v8.** { *; }

# App + API model classes (youtubeapi data models, app internals) are read/written via
# Gson reflection and leanback mods use reflection field injection; R8 stripping empties
# them -> API responses parse to null -> empty feed, no video.
-keep class com.liskovsoft.** { *; }

# SABR protobuf message classes are read via protobuf reflection by exact field names
# (e.g. StreamerContext$ClientInfo.hl_); R8 field renaming breaks parsing at stream
# build time -> "Field hl_ not found" RuntimeException, playback never starts.
-keep class com.google.android.exoplayer2.source.sabr.protos.** { *; }
-keepclassmembers class com.google.android.exoplayer2.source.sabr.protos.** { *; }

# End Enable minification
