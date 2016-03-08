#!/bin/ruby -Ks
# -*- coding: euc-jp -*-
# 
# easymecab.rb
#
class MeCab
  def initialize(option)
   #  @path = "/cygdrive/c/MeCab/bin/mecab.exe" # MeCabへのパス
    @path = "mecab.exe" # MeCabへのパス
    @option = option
  end
  def parse_file(s)
    cmd_string = [@path, @option, s].join(" ")
    word_list = []
    io = IO.popen(cmd_string, "r")
    until io.eof?
      word_list.concat io.gets.split(' ')
    end
    return word_list
  end
end