analyzing @aclibjp tweet and dataset.
===

Try to analyze the tweet @aclibjp that is academic library in Japan.
And dataset of all @aclibjp follower's tweet that has been acquired by this script.

## Description
* twittertimeline.rb: @aclibjp のフォロワーすべてのtweetを現在から最初のtweetまで遡って取得します。時間かかります。
* aclibjp20151203tweet.txt: twittertimeline.rb で取得した2015年12月2日現在のtweet 264,866件のデータセット。
* twitterfollower.rb： @aclibjp のフォロワーのアカウントのディスクリプションを取得します。
* aclibjp20151203description.txt：twitterfollower.rb で取得した245件のデータセット。
* message_account.txt: アカウントごとに処理しやすいように、１行１アカウントにしたファイル。
* mecabtest.rb: テキストファイルを読み込み、行ごとに 納豆めかぶでパースして、名詞と形容詞、形容動詞を取り出す。
* tfidf.rb: 単語ごとに区切られたファイルを行ごとに tf-idf値と算出
* similar_acount_aclibjp.txt：抽出した単語ごとに bayon でクラスタリング
* similar_acount_aclibjp100.tsv：抽出した単語ごとに bayon でクラスタリング

## Usage
