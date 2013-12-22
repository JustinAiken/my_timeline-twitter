require 'twitter'

require "my_timeline"
require "my_timeline/twitter/engine"

module MyTimeline
  module Twitter

    mattr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

    def self.setup
      yield self
    end
  end
end
