# coding: utf-8
# テキストファイルを読み込み、行ごとに 納豆めかぶでパースして、名詞と形容詞、形容動詞を取り出す。
require 'natto'

# nm(納豆めかぶ)を呼び出し。
nm = Natto::MeCab.new
paraData = Array.new
noun_count = Hash.new(0)
adjective_count = Hash.new(0)
nounadj_count = Hash.new(0)

def read_file path
  array = []
  open(path){|f|
    array = f.readlines
  }
  return array
end

# nmにテキストをフィードしてparse(解析)してもらう
h = read_file('message_accountogoto.txt')
h.each {|text|
  nm.parse(text) do |n|
    noun_count[n.surface] += 1 if n.feature.force_encoding("UTF-8") =~ /名詞,一般|固有名詞|名詞,サ変接続/
    adjective_count[n.surface] += 1 if n.feature.force_encoding("UTF-8") =~ /形容詞|形容動詞/
  end

  # n個以上ある単語のキーだけ取り出してタブ区切りで出力
  adjc = adjective_count.to_a.select {|k, v| v >= 5 }.sort_by {|k, v| v }.join("\t ")
  noun = noun_count.to_a.select {|k, v| v >= 5 }.sort_by {|k, v| v }.join("\t ")
  puts adjc + "\t" + noun

  # 行ごとに単語の数をクリア
  nounadj_count = Hash.new(0)
  noun_count = Hash.new(0)
  adjective_count = Hash.new(0)
}
