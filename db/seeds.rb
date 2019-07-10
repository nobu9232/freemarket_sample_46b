ladies = Category.create(name: 'レディース')
mens = Category.create(name: 'メンズ')
child = Category.create(name: 'ベビー・キッズ')
furniture = Category.create(name: 'インテリア・住まい・小物')
culture = Category.create(name: '本・音楽・ゲーム')
hobby = Category.create(name: 'おもちゃ・ホビー・グッズ')
cosme = Category.create(name: 'コスメ・香水・美容')
appliance = Category.create(name: '家電・スマホ・カメラ')
sports = Category.create(name: 'スポーツ・レジャー')
handmaid = Category.create(name: 'ハンドメイド')
ticket = Category.create(name: 'チケット')
car = Category.create(name: '自動車・オートバイ')
other = Category.create(name: 'その他')

ladies_tops = ladies.children.create(name: 'トップス')
ladies_outer = ladies.children.create(name: 'ジャケット/アウター')
ladies_pants = ladies.children.create(name: 'パンツ')
ladies_skirt = ladies.children.create(name: 'スカート')
ladies_onepiece = ladies.children.create(name: 'ワンピース')
ladies_shoes = ladies.children.create(name: '靴')
ladies_roomwear = ladies.children.create(name: 'ルームウェア/パジャマ')
ladies_regwear = ladies.children.create(name: 'レッグウェア')
ladies_hat = ladies.children.create(name: '帽子')
ladies_bag = ladies.children.create(name: 'バッグ')
ladies_accessory = ladies.children.create(name: 'アクセサリー')
ladies_hair = ladies.children.create(name: 'ヘアアクセサリー')
ladies_goods = ladies.children.create(name: '小物')
ladies_watch = ladies.children.create(name: '時計')
ladies_wig = ladies.children.create(name: 'ウィッグ/エクステ')
ladies_swimwear = ladies.children.create(name: '浴衣/水着')
ladies_suits = ladies.children.create(name: 'スーツ/フォーマル/ドレス')
ladies_maternity = ladies.children.create(name: 'マタニティ')
ladies_other = ladies.children.create(name: 'その他')

mens_tops = mens.children.create(name: 'トップス')
mens_outer = mens.children.create(name: 'ジャケット/アウター')
mens_pants = mens.children.create(name: 'パンツ')
mens_shoes = mens.children.create(name: '靴')
mens_bag = mens.children.create(name: 'バッグ')
mens_suits = mens.children.create(name: 'スーツ')
mens_hat = mens.children.create(name: '帽子')
mens_accessory = mens.children.create(name: 'アクセサリー')
mens_goods = mens.children.create(name: '小物')
mens_watch = mens.children.create(name: '時計')
mens_swimwear = mens.children.create(name: '水着')
mens_regwear = mens.children.create(name: 'レッグウェア')
mens_underwear = mens.children.create(name: 'アンダーウェア')
mens_other = mens.children.create(name: 'その他')

baby_girl = child.children.create(name: 'ベビー服(女の子用) ~95cm')
baby_boy = child.children.create(name: 'ベビー服(男の子用) ~95cm')
baby_both = child.children.create(name: 'ベビー服(男女兼用) ~95cm')
kids_girl = child.children.create(name: 'キッズ服(女の子用) 100cm~')
kids_boy = child.children.create(name: 'キッズ服(男の子用) 100cm~')
kids_both = child.children.create(name: 'キッズ服(男女兼用) 100cm~')
kids_shoes = child.children.create(name: 'キッズ靴')
kids_goods = child.children.create(name: '子ども用ファッション小物')
kids_item = child.children.create(name: 'おむつ/トイレ/バス')
kids_carrier = child.children.create(name: '外出/移動用品')
kids_food = child.children.create(name: '授乳/食事')
kids_furniture = child.children.create(name: 'ベビー家具/寝具/室内用品')
kids_toy = child.children.create(name: 'おもちゃ')
kids_event = child.children.create(name: '行事/記念品')
kids_other = child.children.create(name: 'その他')

furniture_kitchen = furniture.children.create(name: 'キッチン/食器')
furniture_bed = furniture.children.create(name: 'ベッド/マットレス')
furniture_sofa = furniture.children.create(name: 'ソファ/ソファベッド')
furniture_chair = furniture.children.create(name: '椅子/チェア')
furniture_desk = furniture.children.create(name: '机/テーブル')
furniture_storage = furniture.children.create(name: '収納家具')
furniture_lug = furniture.children.create(name: 'ラグ/カーペット/マット')
furniture_curtain = furniture.children.create(name: 'カーテン/ブラインド')
furniture_light = furniture.children.create(name: 'ライト/照明')
furniture_pillow = furniture.children.create(name: '寝具')
furniture_goods = furniture.children.create(name: 'インテリア小物')
furniture_event = furniture.children.create(name: '季節/年中行事')
furniture_other = furniture.children.create(name: 'その他')

culture_book = culture.children.create(name: '本')
culture_comic = culture.children.create(name: '漫画')
culture_magazine = culture.children.create(name: '雑誌')
culture_cd = culture.children.create(name: 'CD')
culture_dvd = culture.children.create(name: 'DVD/ブルーレイ')
culture_record = culture.children.create(name: 'レコード')
culture_game = culture.children.create(name: 'テレビゲーム')

ladies_tops.children.create([
  {name: 'Tシャツ/カットソー(半袖/袖なし)'}, 
  {name: 'Tシャツ/カットソー(七分/長袖)'}, 
  {name: 'シャツ/ブラウス(半袖/袖なし)'}, 
  {name: 'シャツ/ブラウス(七分/長袖)'}, 
  {name: 'ポロシャツ'}, 
  {name: 'キャミソール'}, 
  {name: 'タンクトップ'}, 
  {name: 'ホルターネック'}, 
  {name: 'ニット/セーター'}, 
  {name: 'チュニック'}, 
  {name: 'カーディガン/ボレロ'}, 
  {name: 'アンサンブル'}, 
  {name: 'ベスト/ジレ'}, 
  {name: 'パーカー'}, 
  {name: 'トレーナー/スウェット'}, 
  {name: 'ベアトップ/チューブトップ'}, 
  {name: 'ジャージ'}, 
  {name: 'その他'}
])

ladies_outer.children.create([
  {name: 'テーラードジャケット'}, 
  {name: 'ノーカラージャケット'}, 
  {name: 'Gジャン/デニムジャケット'}, 
  {name: 'レザージャケット'}, 
  {name: 'ダウンジャケット'}, 
  {name: 'ライダースジャケット'}, 
  {name: 'ミリタリージャケット'}, 
  {name: 'ダウンベスト'}, 
  {name: 'ジャンパー/ブルゾン'}, 
  {name: 'ポンチョ'}, 
  {name: 'ロングコート'}, 
  {name: 'トレンチコート'}, 
  {name: 'ダッフルコート'}, 
  {name: 'ピーコート'}, 
  {name: 'チェスターコート'}, 
  {name: 'モッズコート'}, 
  {name: 'スタジャン'}, 
  {name: '毛皮/ファーコート'}, 
  {name: 'スプリングコート'}, 
  {name: 'スカジャン'}, 
  {name: 'その他'}
])

mens_tops.children.create([
  {name: 'Tシャツ/カットソー(半袖/袖なし)'}, 
  {name: 'Tシャツ/カットソー(七分/長袖)'}, 
  {name: 'シャツ'}, 
  {name: 'ポロシャツ'}, 
  {name: 'タンクトップ'}, 
  {name: 'ニット/セーター'}, 
  {name: 'パーカー'}, 
  {name: 'カーディガン'}, 
  {name: 'スウェット'}, 
  {name: 'ジャージ'}, 
  {name: 'ベスト'}
])

mens_outer.children.create([
  {name: 'テーラードジャケット'}, 
  {name: 'ノーカラージャケット'}, 
  {name: 'Gジャン/デニムジャケット'}, 
  {name: 'レザージャケット'}, 
  {name: 'ダウンジャケット'}, 
  {name: 'ライダースジャケット'}, 
  {name: 'ミリタリージャケット'}, 
  {name: 'ナイロンジャケット'}, 
  {name: 'フライトジャケット'}, 
  {name: 'ダッフルコート'}, 
  {name: 'ピーコート'}, 
  {name: 'ステンカラーコート'}, 
  {name: 'トレンチコート'}, 
  {name: 'モッズコート'}, 
  {name: 'チェスターコート'}, 
  {name: 'スタジャン'}, 
  {name: 'スカジャン'}, 
  {name: 'ブルゾン'}, 
  {name: 'マウンテンパーカー'}, 
  {name: 'ダウンベスト'}, 
  {name: 'ポンチョ'}, 
  {name: 'カバーオール'}, 
  {name: 'その他'}
])
