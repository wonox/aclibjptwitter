begin
  @test = []
  @test2 = []
    # File.open('labmen.txt', 'r:utf-8')
    test = File.readlines('labmen.txt', rs = '\n')
    puts test

  test2 = ['かば ばか','とら たぬき','うま ねこ']
  puts test2
end
