#rake task to stream twitter feed for each hashtag
desc "Stream tweets"
task :stream_tweets => :environment do
  #twitter config info
  client = client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['consumer_key']
    config.consumer_secret     = ENV['consumer_secret']
    config.access_token        = ENV['access_token']
    config.access_token_secret = ENV['access_token_secret']
  end

  #get brands and battle objects the tweets are streaming for
  brands = [ENV["BRAND1"], ENV["BRAND2"]]
  battle = Battle.last

  #stream tweets
  client.filter(:track => brands.join(",")) do |object|
    if object.is_a?(Twitter::Tweet)
      message = object.text
      #create tweet objects for brand1 and store in db
      if message.include? brands[0]
        tweet = Tweet.new
        tweet.message = message
        tweet.brand = brands[0]
        tweet.battle_id = battle.id
        tweet.save
      end
      #create tweet objects for brand2 and store in db
      if message.include? brands[1]
        tweet = Tweet.new
        tweet.message = message
        tweet.brand = brands[1]
        tweet.battle_id = battle.id
        tweet.save
      end
    end
  end
end
