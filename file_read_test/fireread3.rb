open("labmen.txt", 'r:utf-8') do |file|
  array = []
      while l = file.gets
          array.push(l)
        # array = l.chomp.split(",")
  end
  p array
end
