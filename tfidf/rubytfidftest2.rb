# -*- coding: utf-8 -*-
require 'rubygems'
require 'ruby-tf-idf'

=begin

corpus =
[
'A big enough hammer can usually fix anything',
'A bird in the hand is a big mistake .',
'A bird in the hand is better than one overhead!',
'A career is a job that takes about 20 more hours a week.',
'A clean desk is a sign of a cluttered desk drawer.',
'A cynic smells flowers and looks for the casket.'
]

corpus = []


def read_file path
  array = []
  open(path){|f|
    array = f.readlines
    # puts array
  }
  return array
end

=end

corpus = []
test = []

def read_file path
  array = []
  open(path, 'r:utf-8') { |file|
  while l = file.gets
    array.push(l)
    # array = l.chomp.split(",")
  end
}
return array
end

corpus = read_file('message.txt')
# corpus.each {|h|
  # t1 = h.unpack('U*').map{ |i| "\\u" + i.to_s(16).rjust(4, '0') }.join
  # t1 = t1.gsub(/\\u0020/,"罰")
  # test.push ( t1.gsub(/\\u0020/,"\w") )
  #test.push( h.unpack('U*').map{ |i| "\\u" + i.to_s(16).rjust(4, '0') }.join )
# }

# p test
# p corpus

limit = 3 #restrict to the top 3 relevant words per document
exclude_stop_words = false

@t = RubyTfIdf::TfIdf.new(corpus,limit,exclude_stop_words)
# @t = RubyTfIdf::TfIdf.new(test,limit,exclude_stop_words)
output =  @t.tf_idf.sort_by {|k, v| v }
print output.inspect.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') }
