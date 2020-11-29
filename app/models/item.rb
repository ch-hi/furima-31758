class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :fee_id
  belongs_to :area_id
  belongs_to :day_id

  #空の投稿を保存できないようにする
  validates :name, :describe, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:condition_id,:fee_id,:area_id,:day_id, numericality: { other_than: 1 } 
end
