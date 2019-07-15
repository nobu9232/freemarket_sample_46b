crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ"#, users_path　パス仮置き
  parent :root
end

crumb :card do
  link "支払い方法", card_users_path
  parent :mypage
end

crumb :card_create do
  link "クレジットカード情報入力"#, card_users_path
  parent :card
end

crumb :profile do
  link "プロフィール"#, profile_users_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録"#, identification_users_path
  parent :mypage
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :exhibition do
  link "出品した商品-出品中"#, exhibition_users_path
  parent :mypage
end

crumb :trading do
  link "出品した商品-取引中"#, trading_users_path
  parent :mypage
end

crumb :sold do
  link "出品した商品-売却済み"#, sold_users_path
  parent :mypage
end

crumb :product do |product|
  link product.name
  parent :root
end

crumb :exhibitionDetail do
  link "出品商品画面"#, sold_users_path
  parent :exhibition
end