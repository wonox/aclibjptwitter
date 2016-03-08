# 必要なライブラリを呼び出し。
require 'natto'

# nm(納豆めかぶ)を呼び出し。
nm = Natto::MeCab.new

# nmにテキストをフィードしてparse(解析)してもらう
# puts nm.parse("今日は雪が降ってて非常に寒い。おなか減った。")

text = 'すもももももももものうち'
nm.parse(text) do |n|
  puts "#{n.surface}\t#{n.feature}"
  #puts "#{n.surface}\t#{ n.feature.split(',')[0]}"

end
