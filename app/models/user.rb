class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :buys

  validates :nickname, :last_name, :first_name,
            :last_name_ruby, :first_name_ruby,
            :date_of_birth, presence:true
end
