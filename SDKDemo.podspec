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

    spec.xcconfig = {
        'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO',
    }
end
