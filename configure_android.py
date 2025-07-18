#!/usr/bin/env python3
import re
import sys


def configure_android_build_gradle(file_path):
    """Configure Android build.gradle.kts for dart-define support and icon switching"""
    
    with open(file_path, 'r') as f:
        content = f.read()
    
    # Add dart-define processing after plugins block
    dart_define_code = '''
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
'''
    
    # Insert after plugins block (find the closing } after plugins)
    plugins_pattern = r'(plugins\s*\{[^}]*\})'
    if re.search(plugins_pattern, content, re.DOTALL):
        content = re.sub(plugins_pattern, r'\1' + dart_define_code, content, flags=re.DOTALL)
    
    # Replace applicationId
    content = re.sub(
        r'applicationId\s*=\s*"[^"]*"',
        'applicationId = dartDefines["appId"] ?: "com.asility.app"',
        content
    )
    
    # Add resValue after versionName
    if 'resValue("string", "app_name"' not in content:
        content = re.sub(
            r'(versionName\s*=\s*flutter\.versionName)',
            r'\1\n        resValue("string", "app_name", dartDefines["appName"] ?: "App")',
            content
        )
    
    with open(file_path, 'w') as f:
        f.write(content)
    
    print("Android build.gradle.kts configured successfully with icon switching")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: configure_android.py <path_to_build.gradle.kts>")
        sys.exit(1)
    
    configure_android_build_gradle(sys.argv[1])
