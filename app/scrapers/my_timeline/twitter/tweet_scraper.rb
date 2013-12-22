require_relative 'tweet_builder'
require 'twitter'

module MyTimeline
  module Twitter
    class TweetScraper

      attr_accessor :user, :tweets

      def initialize(user)
        @user = user
      end

      def scrape
        load_tweets
        @count = 0

        tweets.each do |tweet_hash|
          @count = @count + 1 if builder.build_tweet(tweet_hash)
        end

        @count
      end

      def load_tweets
        @tweets = twitter.user_timeline(@user.settings(:twitter).user_name, count: 200)
      end

      def builder
        @builder ||= MyTimeline::Twitter::TweetBuilder.new(user)
      end

      def twitter
        @twitter ||= ::Twitter::REST::Client.new do |config|
          config.consumer_key        = MyTimeline::Twitter.consumer_key
          config.consumer_secret     = MyTimeline::Twitter.consumer_secret
          config.access_token        = MyTimeline::Twitter.access_token
          config.access_token_secret = MyTimeline::Twitter.access_token_secret
        end
      end
    end
  end
end
