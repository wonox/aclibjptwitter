# list up twitter followers
require "twitter"
$client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

SLICE_SIZE = 100

def get_all_friends(screen_name)

#  client = twitter_client

  all_friends = []
  $client.friend_ids(screen_name).each_slice(SLICE_SIZE).each do |slice|
    $client.users(slice).each do |friend|
      name = friend.id.to_s + "\t" + friend.screen_name.to_s + "\t" + friend.name.to_s + "\t" + friend.tweets_count.to_s + "\t" + friend.description.to_s + "\n"
      all_friends << name
    end
  end

  puts all_friends
end

get_all_friends('aclibjp')
