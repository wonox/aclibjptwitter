require "twitter"

#とりあえず雛形
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

#https://twitter.com/intent/user?user_id=xxxxxxxx
p client.friend_ids("#{'aclibjp'}")

#friend一人ずつ，遡れるまでtweetを取得
client.friend_ids("#{'aclibjp'}").each_slice(100).each do |slice|
    client.users(slice).each do |friend|
      if client.user_timeline(friend.screen_name).first.id == nil then
        break
      end
      # bef_id,max_id = -1
      # bef_id = client.user_timeline(friend.screen_name).first.id || 0
      bef_id,max_id,bef_id = -1, client.user_timeline(friend.screen_name).first.id
      client.user_timeline(friend.screen_name).first.id || 999999999999999999
      p client.user_timeline(friend.screen_name).first.id
      # bef_id,max_id,bef_id = -1
      # loop do
            client.user_timeline(friend.screen_name,{max_id: max_id,count: 200}).each do |tweet|
                puts 'neme: ' + tweet.user.name
                puts '@' + tweet.user.screen_name
                puts tweet.full_text
                puts tweet.id
                puts tweet.created_at
                print "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}\n"
                max_id = tweet.id unless tweet.retweeted?
            end
            sleep 60
            break if max_id == bef_id
            bef_if = max_id
        # end
    end
end
