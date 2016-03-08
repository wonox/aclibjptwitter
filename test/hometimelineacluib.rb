require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

#friend一人ずつ，遡れるまでtweetを取得
client.friend_ids("#{'aclibjp'}").each_slice(100).each do |slice|
  client.users(slice).each do |friend|
    tcount = 1
    print slice
    # client.user_timeline(friend.screen_name).first.id
      client.user_timeline(friend.screen_name,{count: 200}).each do |tweet|
        #print tcount
        puts 'neme: ' + tweet.user.name
        puts '@' + tweet.user.screen_name
        puts tweet.full_text
        puts tweet.id
        puts tweet.created_at
        print "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}\n"
        max_id = tweet.id unless tweet.retweeted?
        tcount = tcount+1
      sleep 1
    end
  end
end
