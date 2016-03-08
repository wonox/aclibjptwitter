# -*- coding: utf-8 -*-
# 必要なライブラリを呼び出し。
require 'natto'

# nm(納豆めかぶ)を呼び出し。
nm = Natto::MeCab.new
word_array = []
paraData = Array.new
noun_count = Hash.new(0)
adjective_count = Hash.new(0)
nounadj_count = Hash.new(0)

# nmにテキストをフィードしてparse(解析)してもらう
# puts nm.parse("今日は雪が降ってて非常に寒い。おなか減った。")

#text = 'すもももももももものうち今日はきれいな雪が降ってて非常に寒い。美しいおなか減った。美しい雪は冷たい。'
def read_file path
  array = []
  open(path){|f|
    array = f.readlines
    # puts array
  }
  return array
end

h = read_file('message.txt')
h.each {|text|

nm.parse(text) do |n|
  # puts "#{n.surface}\t#{n.feature}"
  # if /^名詞/ =~ n.feature.force_encoding("UTF-8")
  #  word_array << n.surface.force_encoding("UTF-8")
  #  noun_count[n.surface] += 1
  #end
  # next if n.surface.nil?
  # noun_count[n.surface] += 1 if n.feature.force_encoding("UTF-8") =~ /名詞/
  # adjective_count[n.surface] += 1 if n.feature.force_encoding("UTF-8") =~ /形容動詞/
  nounadj_count[n.surface] += 1 if n.feature.force_encoding("UTF-8") =~ /形容詞|名詞|形容動詞/
end

# puts word_array
# puts adjective_count.to_a.select {|k, v| v >= 0 }.sort_by {|k, v| v }.join("\t ")
puts nounadj_count.to_a.select {|k, v| v >= 2 }.sort_by {|k, v| v }.join("\t ")
# puts "noun_count: #{noun_count.to_a.select{|e| e.last > 2 }.sort_by{ |e| -e.last }.inspect}"                             # puts "adjective_count: #{adjective_count.to_a.select{|e| e.last > 1 }.sort_by{ |e| -e.last }.inspect}"
nounadj_count = Hash.new(0)
}
