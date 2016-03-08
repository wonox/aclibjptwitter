# 必要なライブラリを呼び出し。
require 'natto'

# nm(納豆めかぶ)を呼び出し。
nm = Natto::MeCab.new
word_array = []

# nmにテキストをフィードしてparse(解析)してもらう
# puts nm.parse("今日は雪が降ってて非常に寒い。おなか減った。")

text = 'すもももももももものうち'
nm.parse(text) do |n|
  puts "#{n.surface}\t#{n.feature}"
  # node = node.next
  if /^名詞/ =~ n.feature.force_encoding("UTF-8")
    word_array << n.surface.force_encoding("UTF-8")
  end
end

puts word_array.force_encoding("cp932")
