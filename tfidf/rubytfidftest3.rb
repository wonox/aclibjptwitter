# -*- coding: utf-8 -*-
require 'rubygems'
require 'ruby-tf-idf'

=begin
corpus =
[
'A big enough hammer can usually fix anything',
'A cynic smells flowers and looks for the casket.'
]
=end

corpus = []
test = []

def read_file path
  array = []
  open(path, 'r:utf-8') { |file|
  while l = file.gets
    array.push(l)
  end
}
return array
end

corpus = read_file('message.txt')

limit = 3 #restrict to the top 3 relevant words per document
exclude_stop_words = false

@t = RubyTfIdf::TfIdf.new(corpus,limit,exclude_stop_words)
output =  @t.tf_idf.sort_by {|k, v| v }
print output.inspect.gsub(/\\u([\da-fA-F]{4})/) { [$1].pack('H*').unpack('n*').pack('U*') }
