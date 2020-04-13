# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#invite_categoryの初期データ
invite_categories = ["雑談", "オフラインゲーム", "オンラインゲーム", "ソーシャルゲーム", "PCゲーム", "家庭用ゲーム機", "その他"]
invite_categories.each { |category| InviteCategory.create(name: category) }

#group_categoryの初期データ
group_categories = ["オフラインゲーム", "オンラインゲーム", "ソーシャルゲーム", "PCゲーム", "家庭用ゲーム機", "その他"]
group_categories.each { |category| GroupCategory.create(name: category) }