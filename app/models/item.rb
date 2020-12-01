class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :day

  #空の投稿を保存できないようにする
  validates :name, :describe, :payment,:image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:condition_id,:fee_id,:area_id,:day_id, numericality: { other_than: 1 } 

  #販売価格は半角数字での入力が必須であること
  validates :payment, format: { with: /\A[0-9]+\z/ }

  #¥300~¥9,999,999
  validates :payment, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
