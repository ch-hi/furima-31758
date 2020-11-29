class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :day

  #空の投稿を保存できないようにする
  validates :name, :describe, :payment, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:condition_id,:fee_id,:area_id,:day_id, numericality: { other_than: 1 } 
end
