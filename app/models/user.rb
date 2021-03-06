class User < ApplicationRecord
 
  has_many :items
  has_many :stores

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'
  
  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角漢字ひらがなカタカナを使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
   validates :last_name_kana
   validates :first_name_kana
  end

  validates :birthday, presence: true
end