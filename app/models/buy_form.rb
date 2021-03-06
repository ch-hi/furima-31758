class BuyForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :posta, :area, :city, :banchi, :building, :phonenumber, :buy_id, :token
  
  
  validates :user_id, :item_id, :token, :posta, :area, :city, :banchi, :phonenumber, presence: true
  #郵便番号にはハイフンが必要であること（123-4567となる）
  validates :posta, format: { with: /\A\d{3}[-]\d{4}\z/ }
  #電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
  validates :phonenumber, format: { with: /\A\d{11}\z/ }
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :area, numericality: { other_than: 1 } 

  validates :phonenumber, presence: true, length: { maximum: 11 }
  


def save
  buy = Buy.create(user_id: user_id, item_id: item_id)
  Receiver.create(posta: posta, area: area, city: city, banchi: banchi, building: building, phonenumber: phonenumber, buy_id: buy.id)
end

    
end