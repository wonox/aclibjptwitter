# f = []
def read_file path
  array = []
open(path){|f|
array = f.readlines
# puts array
}
return array
end

h = read_file('message.txt')
h.each {|l|
  puts l
}
