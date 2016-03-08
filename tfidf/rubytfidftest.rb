# -*- coding: utf-8 -*-
require 'rubygems'
require 'ruby-tf-idf'

corpus = 
[
'A big enough hammer can usually fix anything',
'A bird in the hand is a big mistake .',
'A bird in the hand is better than one overhead!',
'A career is a job that takes about 20 more hours a week.',
'A clean desk is a sign of a cluttered desk drawer.',
'A cynic smells flowers and looks for the casket.',
'	皆さん	 1	 風邪	 1	 気	 1	 !(^^)　	 1	 図書館	 1	 クリスマスツリー	 1	 暖房	 1	 館内	 1	 クリスマス	 1	 気分	 1	 ♪	 1	 https	 1	 ://	 1	 t	 1	 .	 1	 co	 1	 /	 1	 z	 1	 jOPLTlTB	 1',
'	/	 1	 ジュンク	 1	 書店	 1	 学生	 1	 選書	 1	 お知らせ	 1	 HP	 1	 様子	 1	 意見	 1	 交換	 1	 図書館	 1	 本	 1	 ツアー	 2',
'	ロビー	 1	 学生	 1	 作成	 1	 POP	 1	 展示	 1	 どれ	 1	 カラフル	 1	 目	 1	 力作	 1	 気	 1	 本	 1	 (*^^*)♪	 1	 https	 1	 ://	 1	 t	 1	 .	 1	 co	 1	 /	 1	 gVSJMlUkg	 1',
'	Ｌｉｂｒａｒｙ	 1	 Ｌｏｖｅｒｓ	 1	 (*^^*)	 1	 参考	 1	 ブック	 1	 本	 1	 お気に入り	 1	 掲示	 1	 期間	 1	 レシピ	 2	 終了	 2	 キャンペーン	 2',
'	学生	 1	 選書	 1	 ツアー	 1	 以	 1	 募集	 1	 終了	 1	 応募	 1	 (*^^*)！	 1	 参加	 1	 連絡	 1',
'	学生	 1	 uoCi	 1	 HCEV	 1	 〆切	 1	 !!!	 1	 =≡	 1	 (((	 1	 ??	 1	 ??)	 1	 !!	 1	 受付	 1	 /	 1	 用紙	 1	 提出	 1	 https	 1	 ://	 1	 t	 1	 .	 1	 co	 1	 応募	 1	 ツアー	 2	 選書	 2',
'	スロヴァキアウィーク	 1	 企画	 1	 図書館	 1	 crtnG	 1	 BSik	 1	 作家	 1	 開催	 1	 本	 1	 機会	 1	 /	 1	 https	 1	 ://	 1	 t	 1	 .	 1	 co	 1	 見逃し	 1	 絵本	 2	 スロヴァキア	 2',
'	本学	 1	 音楽	 1	 講師	 1	 宮	 1	 添	 1	 (	 1	 杉	 1	 )	 1	 先生	 1	 ピアノ	 1'
]

p corpus

limit = 3 #restrict to the top 3 relevant words per document
exclude_stop_words = false

@t = RubyTfIdf::TfIdf.new(corpus,limit,exclude_stop_words)
output =  @t.tf_idf
print output.inspect.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') }
