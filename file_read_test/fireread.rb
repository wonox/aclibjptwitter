begin
      test = []
  File.open('labmen.txt', 'r:utf-8') do |file|
    # まずIO#readでファイル全体を文字列として読み込む
    # 次にString#splitで改行文字ごとに配列に変換
    # 最後にArray#eachで要素ごとにブロックを評価
    #
    # IO#read
    # 第1引数: 読み込むサイズ(デフォルト => nil)
    # 第2引数: 出力用のバッファ(デフォルト => '')
    # 読み込み用にオープンされていない場合にIOErrorが発生
    # データの読み込みに失敗した場合にErrno::EXXXが発生
    file.read.split('\n').each do |labmen|
      # puts labmen
      puts file
    end


    test = file.read.split('n')
    puts test.to_s + "gao"

  end
# 例外は小さい単位で捕捉する
rescue SystemCallError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
rescue IOError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
end
