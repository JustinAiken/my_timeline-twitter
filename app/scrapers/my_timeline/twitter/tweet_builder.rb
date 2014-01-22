module MyTimeline
  module Twitter
    class TweetBuilder

      attr_reader :user, :tweet_hash

      def initialize(user)
        @user = user
      end

      def build_tweet(tweet_hash)
        @tweet_hash = tweet_hash
        return false if already_exists_in_db?

        event.linkable = tweet
        event.user = user if MyTimeline.user_class
        event.save

        tweet.event = event
        tweet.save
      end

    private

      def event
        @event ||= MyTimeline::Event.create(
          happened_on:   tweet_hash.created_at,
          original_id:   tweet_hash.id,
          external_link: "http://twitter.com/#{user.settings(:twitter).user_name}/status/#{tweet_hash.id}",
          icon_name:     "tweetweet_hash.png",
          importance:    5,
          public:        1,
          description:   linkup_mentions_and_hashtags
        )
      end

      def tweet
        @tweet ||= MyTimeline::Twitter::Tweet.new(
         happened_on: tweet_hash.created_at,
         uri:         tweet_hash.id,
         post:        tweet_hash.text
        )
      end

      def already_exists_in_db?
        MyTimeline::Twitter::Tweet.find_by_uri tweet_hash.id
      end

      def linkup_mentions_and_hashtags
        text = tweet_hash.text.dup
        text.gsub!(/@([\w]+)(\W)?/, '<a href="http://twitter.com/\1">@\1</a>\2')
        text.gsub(/#([\w]+)(\W)?/, '<a href="http://twitter.com/search?q=%23\1">#\1</a>\2')
        %Q{"#{text}"}
      end
    end
  end
end
