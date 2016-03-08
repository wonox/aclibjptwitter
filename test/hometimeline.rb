#!/usr/bin/env ruby -Ku

require 'rubygems' # ←Ruby 1.9では不要
require 'twitter'
require 'pp'

# ログイン

#@client = Twitter::REST::Client.new do |config|
#Twitter.configure do |config|
client = Twitter::REST::Client.new do |config|
# Twitter::REST::Client.new do |config|
  config.consumer_key    = '8tzYE7ChwhXeZgzDgRAfRYpMW'
  config.consumer_secret = 'j4eATAkabzzes3jbA78PQpW0phFufAGEU6rkfWgeNcnAQYiHO0'
  config.access_token    = '87891064-VoyZhL9PwQMPSfDAzHuvjYUg55e0yhiQrIfBTFoE8'
  config.access_token_secret = '19Ug7qgFx61n0GxZPA7TkCbU1hn46DONHEuTV7gXTCLDD'
end


mytl = client.home_timeline #TLを取得
hist = []
while 1

  update = mytl - hist #前回取得したTLとの差分
  num = update.length - 1

  num.downto(0) do |i|
    id = update[i][:id] # TweetのID。ふぁぼRT等に使用
    username = update[i][:user][:screen_name] # 発言者ID
    contents = update[i][:text] # 発言内容
    str = username + ":" + contents
    puts str

  end
  hist = mytl
  sleep(90)
  mytl = client.home_timeline
end
