require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

#friend一人ずつ，遡れるまでtweetを取得
client.friend_ids("#{'wonox'}").each_slice(100).each do |slice|
  client.users(slice).each do |friend|
    print slice
    bef_id,max_id,bef_id = -1, client.user_timeline(friend.screen_name).first.id
    loop do
      client.user_timeline(friend.screen_name,{max_id: max_id,count: 20}).each do |tweet|
        puts 'neme: ' + tweet.user.name
        puts '@' + tweet.user.screen_name
        puts tweet.full_text
        puts tweet.id
        puts tweet.created_at
        print "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}\n"
        max_id = tweet.id unless tweet.retweeted?
      end
      sleep 15
      break if max_id == bef_id
      bef_if = max_id
    end
  end
end
