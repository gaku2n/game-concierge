plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
import java.util.Base64

val dartDefines = mutableMapOf<String, String>()
if (project.hasProperty("dart-defines")) {
    project.property("dart-defines").toString().split(",").forEach { entry ->
        val pair = String(Base64.getDecoder().decode(entry)).split("=", limit = 2)
        if (pair.size == 2) {
            dartDefines[pair[0]] = pair[1]
        }
    }
}

val copySources by tasks.registering(Copy::class) {
    val flavor = dartDefines["flavor"]
    from("src/$flavor/res")
    into("src/main/res")
    onlyIf { file("src/$flavor/res").exists() }
}

tasks.named("preBuild").configure {
    dependsOn(copySources)
}


android {
    namespace = "com.asility.game_concierge"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = dartDefines["appId"] ?: "com.asility.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        resValue("string", "app_name", dartDefines["appName"] ?: "App")
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
