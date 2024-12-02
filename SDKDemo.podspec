Pod::Spec.new do |spec|
    spec.name                     = 'SDKDemo'
    spec.version                  = '1.0.0'
    spec.homepage                 = 'https://github.com/YSJ330/SDKDemo'
    spec.source                   = { :git => 'https://github.com/YSJ330/SDKDemo.git'}
    spec.authors                  = ''
    spec.license                  = ''
    spec.summary                  = 'SDK Demo'
    spec.vendored_frameworks      = 'SDKDemo.xcframework'
    spec.libraries                = 'c++'

    spec.dependency 'Reachability'

    if !Dir.exist?('build/cocoapods/framework/SDKDemo.framework') || Dir.empty?('build/cocoapods/framework/SDKDemo.framework')
        raise "

        Kotlin framework 'SDKDemo' doesn't exist yet, so a proper Xcode project can't be generated.
        'pod install' should be executed after running ':generateDummyFramework' Gradle task:

            ./gradlew :SDKDemo:generateDummyFramework

        Alternatively, proper pod installation is performed during Gradle sync in the IDE (if Podfile location is set)"
    end
                
    spec.xcconfig = {
        'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO',
    }
                
    spec.pod_target_xcconfig = {
        'KOTLIN_PROJECT_PATH' => ':SDKDemo',
        'PRODUCT_MODULE_NAME' => 'SDKDemo',
    }
                
    spec.script_phases = [
        {
            :name => 'Build SDKDemo',
            :execution_position => :before_compile,
            :shell_path => '/bin/sh',
            :script => <<-SCRIPT
                if [ "YES" = "$OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED" ]; then
                  echo "Skipping Gradle build task invocation due to OVERRIDE_KOTLIN_BUILD_IDE_SUPPORTED environment variable set to \"YES\""
                  exit 0
                fi
                set -ev
                REPO_ROOT="$PODS_TARGET_SRCROOT"
                "$REPO_ROOT/../gradlew" -p "$REPO_ROOT" $KOTLIN_PROJECT_PATH:syncFramework \
                    -Pkotlin.native.cocoapods.platform=$PLATFORM_NAME \
                    -Pkotlin.native.cocoapods.archs="$ARCHS" \
                    -Pkotlin.native.cocoapods.configuration="$CONFIGURATION"
            SCRIPT
        }
    ]
end
