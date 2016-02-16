require "twitter"

#get Twitter API key,Consumer key,Access token from https://apps.twitter.com/
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = 'xxxxxxx'
  config.consumer_secret = 'xxxxxxx'
  config.access_token    = 'xxxxxxx'
  config.access_token_secret = 'xxxxxxxx'
end

#https://twitter.com/intent/user?user_id=xxxxxxxx
p client.friend_ids("#{'aclibjp'}")

#friend(follower) one by one, get the tweet to go back
client.friend_ids("#{'aclibjp'}").each do |slice|
    client.users(slice).each do |friend|
      if !defined?(client.user_timeline(friend.screen_name).first.id) then
        puts "nodata: " + friend.screen_name
        break
      end
      bef_id,max_id,bef_id = -1, client.user_timeline(friend.screen_name).first.id
      client.user_timeline(friend.screen_name).first.id || 999999999999999999
      p client.user_timeline(friend.screen_name).first.id
      loop do
            client.user_timeline(friend.screen_name,{max_id: max_id,count: 200}).each do |tweet|
                puts 'neme: ' + tweet.user.name
                puts '@' + tweet.user.screen_name
                puts tweet.full_text
                puts tweet.id
                puts tweet.created_at
                print "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}\n"
                max_id = tweet.id unless tweet.retweeted?
            end
            sleep 15  # 60 or 15 by environment
            puts "bef_id: " + bef_id.to_s
            # break if max_id == bef_id
            if  max_id == bef_id then
              puts "owari: " + max_id.to_s
              break
            end
            bef_id = max_id
        end
    end
end
