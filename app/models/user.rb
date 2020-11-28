class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }   #半角英数必須encrypted_
  validates :familyname, :firstname, :familykana,:firstkana,:birth,:nickname, presence: true        
  validates :familyname, :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }             #全角（漢字・ひらがな・カタカナ）での入力が必須であること
  validates :familykana, :firstkana, format: { with: /\p{katakana}/ }  #全角（カタカナ）必須

end
