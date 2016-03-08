require 'twitter'

@client = Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end

# 特定ユーザのtimeline取得
@client.user_timeline("wonox").each do |timeline|
  puts @client.status(timeline.id).text
end

# 特定ユーザのtimelineを件数(2件)指定して取得
@client.user_timeline("pso2_emg_hour", { count: 2 } ).each do |timeline|
  puts @client.status(timeline.id).text
end
