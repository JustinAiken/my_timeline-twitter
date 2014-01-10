MyTimeline::Engine.routes.draw do
  get 'twitter/scrape'  => 'twitter#scrape', as: "twitter_scrape"
  post  'twitter/new'   => 'twitter#new',    as: "new_twitter"
  resources :twitter
end
