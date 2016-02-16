# list up twitter followers
require "twitter"
$client = Twitter::REST::Client.new do |config|
  config.consumer_key    = 'xxxxxx'
  config.consumer_secret = 'xxxxxx'
  config.access_token    = 'xxxxxx'
  config.access_token_secret = 'xxxxxxx'
end

SLICE_SIZE = 100

def get_all_friends(screen_name)
  all_friends = []
  $client.friend_ids(screen_name).each_slice(SLICE_SIZE).each do |slice|
    $client.users(slice).each do |friend|
      name = friend.id.to_s + "\t" + friend.screen_name.to_s + "\t" + friend.name.to_s + "\t" +
      friend.tweets_count.to_s + "\t" + friend.description.to_s + "\n"
      all_friends << name
    end
  end
  puts all_friends
end

get_all_friends('aclibjp')
