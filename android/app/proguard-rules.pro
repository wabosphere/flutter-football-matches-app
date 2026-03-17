# Proguard rules for Flutter app

# Keep SLF4J classes to avoid R8 errors
-keep class org.slf4j.** { *; }
-keep interface org.slf4j.** { *; }
-keep class org.slf4j.impl.** { *; }
-dontwarn org.slf4j.**

# Keep Pusher Channels classes
-keep class com.pusher.** { *; }
-dontwarn com.pusher.**

# Keep OkHttp
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# Keep Okio
-keep class okio.** { *; }
-dontwarn okio.**
