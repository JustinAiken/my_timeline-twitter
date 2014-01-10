module MyTimeline
  module Twitter
    class Tweet < ActiveRecord::Base
      self.table_name = :my_timeline_twitter_tweets
      belongs_to :event #,dependant: :destroy

      attr_protected unless rails4?
    end
  end
end
