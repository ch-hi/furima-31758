class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #バリデーション 冗長ではないか？レビュー時に確認
  validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }   #半角英数必須
  validates :familyname, :firstname, :familykana,:firstkana,:birth, presence: true        
  validates :familyname, :firstname, format: { with: /\A[ぁ-んァ-ヶ一-龥]/+\z }             #全角（漢字・ひらがな・カタカナ）必須
  validates :familykana, :firstkana, format: { with: /\p{katakana}/  /\A[ァ-ヶー－]+\z/ }  #全角（カタカナ）必須

end
