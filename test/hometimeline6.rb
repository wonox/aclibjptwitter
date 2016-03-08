require "twitter"
# require 'bigdecimal'

$twitteraccount = '7Mvwl7Tk1FU6v4j'

client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

$tcount = client.user($twitteraccount).statuses_count
p $tcount

if !defined?(client.user_timeline($twitteraccount).statuses_count) then
  print "gaoooo"
  exit(10)
end

bef_id,max_id,bef_id = -1, client.user_timeline($twitteraccount).first.id

hasuu = $tcount/200.to_f
p hasuu - ($tcount/200)
if hasuu == 0 then $ttimes = $tcount/200
else
  $ttimes = $tcount/200 + 1
end
p $ttimes
# $start_id = client.user_timeline($twitteraccount).first.id - $tcount
$ttimes.times do
    client.user_timeline($twitteraccount,{max_id: max_id,count: 200}).each do |tweet|
        puts tweet.user.name
        puts tweet.full_text
        puts "Fav: #{tweet.favorite_count}, Retweet: #{tweet.retweet_count}"
        max_id = tweet.id unless tweet.retweeted?
    end
    sleep 15
    # break if max_id == bef_id
    # break if max_id > $start_id
    bef_if = max_id - 200
end
