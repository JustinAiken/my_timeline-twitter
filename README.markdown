[![Code Climate](https://codeclimate.com/github/JustinAiken/my_timeline-twitter.png)](https://codeclimate.com/github/JustinAiken/my_timeline-twitter)

# My Timeline - Twitter Plugin
#### Twitter Integration with My Timeline

### Requirements:
- [My Timeline](https://github.com/JustinAiken/my_timeline)
- [Twitter gem](https://github.com/sferik/twitter)

### Usage:

1. Add this gem to your Gemfile:
`gem 'my_timeline-twitter'` and `bundle install`
2. Edit `config/initializers/my_timeline.rb` to include your API keys:

```ruby
MyTimeline.setup do |config|
  ...
end

MyTimeline::Twitter.setup do |config|
  config.client_id           = "lotsofrandomhexchars"
  config.client_secret       = "lotsofrandomhexchars"
  config.access_token        = "lotsofrandomhexchars"
  config.access_token_secret = "lotsofrandomhexchars"
end
```

## Credits

Original author: [Justin Aiken](https://github.com/JustinAiken)

## Links

* [Source](https://github.com/JustinAiken/my_timeline-twitter)
* [Bug Tracker](https://github.com/JustinAiken/my_timeline-twitter/issues)
* [Rubygem](https://rubygems.org/gems/my_timeline-twitter)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  * If you want to have your own version, that is fine but bump version in a commit by itself so I can ignore when I pull
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2013 Justin Aiken Inc. MIT license (see LICENSE for details).
