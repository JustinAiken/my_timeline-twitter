module MyTimeline
  module Twitter
    class Engine < ::Rails::Engine
      isolate_namespace MyTimeline::Twitter

      config.autoload_paths << File.expand_path("../../../app/classes/**", __FILE__)
      config.autoload_paths << File.expand_path("../../../app/scrapers/**", __FILE__)

      config.generators do |g|
        g.test_framework      :rspec,        fixture: false
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
        g.assets false
        g.helper false
      end

      config.after_initialize do |app|
        MyTimeline.config_object.key :twitter, defaults: {user_token: nil}
        MyTimeline.register_plugin :twitter
      end

      rake_tasks do
        load File::expand_path "railties/twitter_tasks.rake", File.dirname(__FILE__)
      end
    end
  end
end
