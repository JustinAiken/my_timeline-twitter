module MyTimeline
  class TwitterController < ApplicationController

    def new
      @user.settings(:twitter).user_name = params[:user_name]
      @user.save!
      redirect_to control_panel_path, notice: "Twitter added!"
    end

    def scrape
      scrapey = MyTimeline::Twitter::TweetScraper.new(@user).scrape
      redirect_to :back, notice: "Added #{scrapey} tweets."
    end
  end
end
