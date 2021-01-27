# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# railsにデフォルトで用意されている実行環境は３種類
# test: テスト用
# development: 開発用
# production: 本番用

# rails db:seed でseedのデータを作成できる

if Rails.env == 'development'
  (1..50).each do |i|
    Board.create(name: "ユーザー#{i}", title: "タイトル#{i}", body: "本文#{i}")
  end

  Tag.create([
    {name: 'バイト募集'},
    {name: '18禁'},
    {name: '研修中も時給変わらず'},
    {name: '単発'},
  ])
end
