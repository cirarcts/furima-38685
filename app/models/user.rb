class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buys

  validates :nickname, :date_of_birth, presence:true
            # 各カラムの値が空では値の保存を受け付けない

  validates :password, presence: true, length: { minimum: 6 } , format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
            # パスワードは6文字以上、半角英数字を含む入力必須

  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥ー]+\z/ }
            # 全角（漢字・ひらがな・カタカナでのいずれか）の入力必須

  validates :last_name_ruby, :first_name_ruby, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
            # 全角カタカナでの入力必須
end

