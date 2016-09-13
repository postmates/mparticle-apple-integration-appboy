Pod::Spec.new do |s|
    s.name             = "mParticle-Appboy"
    s.version          = "6.8.0"
    s.summary          = "Appboy integration for mParticle"

    s.description      = <<-DESC
                       This is the Appboy integration for mParticle.
                       DESC

    s.homepage         = "https://www.mparticle.com"
    s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
    s.author           = { "mParticle" => "support@mparticle.com" }
    s.source           = { :git => "https://github.com/mparticle-integrations/mparticle-apple-integration-appboy.git", :tag => s.version.to_s }
    s.social_media_url = "https://twitter.com/mparticles"
    s.default_subspec  = "DefaultVersion"

    def s.subspec_common(ss)
        ss.ios.deployment_target = "7.0"
        ss.ios.source_files      = 'mParticle-Appboy/*.{h,m,mm}'
        ss.ios.dependency 'mParticle-Apple-SDK/mParticle', '~> 6.7'
        ss.ios.frameworks = 'CoreTelephony', 'SystemConfiguration'
        ss.libraries = 'z'

        ss.ios.pod_target_xcconfig = {
            'LIBRARY_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Appboy-iOS-SDK/**',
            'OTHER_LDFLAGS' => '$(inherited) -l"AppboyKitLibrary"'
        }

        ss.tvos.deployment_target = "9.0"
        ss.tvos.source_files      = 'mParticle-Appboy/*.{h,m,mm}'
        ss.tvos.dependency 'mParticle-Apple-SDK/mParticle', '~> 6.7'
        ss.tvos.frameworks = 'SystemConfiguration'

        ss.tvos.pod_target_xcconfig = {
            'LIBRARY_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Appboy-tvOS-SDK/**'
        }
    end

    s.subspec 'DefaultVersion' do |ss|
        ss.ios.dependency 'Appboy-iOS-SDK', '2.24.0'
        ss.tvos.dependency 'Appboy-tvOS-SDK', '2.24.0'
        s.subspec_common(ss)
    end

    s.subspec 'UserDefinedVersion' do |ss|
        ss.ios.dependency 'Appboy-iOS-SDK'
        ss.tvos.dependency 'Appboy-tvOS-SDK'
        s.subspec_common(ss)
    end
end
