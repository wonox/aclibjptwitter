#!/bin/ruby -Ks
# -*- coding: euc-jp -*-
# mecabtest.rb
require './easymecab.rb'
# m = MeCab.new("-O wakati")
# コストが見える引数を指定して結果を見てみる
# %pw : 単語生起コスト。上で説明した「naist-jdic.csv」に書いてあるコスト値と同じ。
# %pc : 連接コスト + 単語生起コスト (文頭から累積)。
# %pn : 連接コスト + 単語生起コスト (その形態素単独)
# 表層文字列	左文脈ID	右文脈ID	単語生起コスト	連接＋生起（累積）	連接＋生起（単独）
m = MeCab.new('-F"%m,%phl,%phr,%pb,%pw,%pc,%pn\n" -N2')
# p m.parse_file("./test.txt")
puts m.parse_file("./test.txt")
