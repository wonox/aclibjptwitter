require "twitter"

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

max_id = client.home_timeline.first.id
5.times do
    client.home_timeline(max_id: max_id,count: 200).each do |tweet|
        puts tweet.user.name
        puts tweet.full_text
        puts "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}"
        max_id = tweet.id unless tweet.retweeted?
    end
    sleep 60
end
