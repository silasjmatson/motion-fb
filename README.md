# motion-fb

Cleans up the Rakefile mess that occurs when integrating with Facebook in your RubyMotion App.


## Installation

```ruby
gem "motion-fb", github: "silasjmatson/motion-fb"
```

## Usage

In your Rakefile, add the following to the bottom of your setup block:

```ruby
# ...

Motion::Project::App.setup do |app|
  # ...

  # Pod keys correspond to their cocoapod
  # :core 'FBSDKCoreKit',
  # :login 'FBSDKLoginKit',
  # :messenger 'FBSDKMessengerShareKit',
  # :share 'FBSDKShareKit',
  app.facebook(app_id: "MYAPPID", display_name: "MYDISPLAY_NAME", pods: [:login, :core, :share, :messenger])
end
```

**Note:** Be sure to run `rake pod:install` to install the cocoapods

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
