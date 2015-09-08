# encoding: utf-8
unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

module Motion::Project
  class Config
    def facebook(opts = {})
      set_up_cf_bundle_url_types(opts[:app_id])

      app.info_plist["FacebookAppID"] = opts[:app_id]
      app.info_plist["FacebookDisplayName"] = opts[:display_name]

      set_up_whitelist

      add_fb_pods(opts[:pods])
    end

    private

    def set_up_whitelist
      # Whitelist for iOS 9
      app.info_plist["NSAppTransportSecurity"] ||= {}
      app.info_plist["NSAppTransportSecurity"].merge!({
        "NSExceptionDomains" => {
          "facebook.com" => { "NSIncludesSubdomains" => true, "NSExceptionRequiresForwardSecrecy" => false },
          "fbcdn.net" => { "NSIncludesSubdomains" => true, "NSExceptionRequiresForwardSecrecy" => false },
          "akamaihd.net" => { "NSIncludesSubdomains" => true, "NSExceptionRequiresForwardSecrecy" => false },
        }
      })
    end

    def set_up_cf_bundle_url_types(app_id)
      app.info_plist["CFBundleURLTypes"] ||= []

      found = false
      app.info_plist["CFBundleURLTypes"].each do |hash|
        if hash["CFBundleURLSchemes"] && hash["CFBundleURLSchemes"].is_a?(Array)
          hash["CFBundleURLSchemes"] << "fb#{app_id}"
          hash["CFBundleURLName"] ||= app.identifier
          found = true
        end
      end

      unless found
        app.info_plist["CFBundleURLTypes"] << {
          "CFBundleURLName" => app.identifier,
          "CFBundleURLSchemes" => [ "convocode", "fb#{app_id}" ]
        }
      end
    end

    def add_fb_pods(fb_pods)
      possible_pods = {
        core: {
          pod: 'FBSDKCoreKit',
          version: '~> 4.5.1'
        },
        login: {
          pod: 'FBSDKLoginKit',
          version: '~> 4.5.1'
        },
        messenger: {
          pod: 'FBSDKMessengerShareKit',
          version: '~> 1.3.0'
        },
        share: {
          pod: 'FBSDKShareKit',
          version: '~> 4.5.1'
        }
      }

      app.pods do
        possible_pods.each do |key, data|
          if fb_pods.include?(key)
            pod data[:pod], data[:version]
          end
        end
      end
    end
  end
end
