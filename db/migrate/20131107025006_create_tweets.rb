class CreateTweets < ActiveRecord::Migration
  def change
    create_table :my_timeline_twitter_tweets do |t|
      t.datetime :happened_on

      t.text :uri
      t.text :post

      t.references :event
      t.timestamps
    end
  end
end
