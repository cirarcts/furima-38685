class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image

  #空の状態では値を保存しない
  validates :product_name, :explanation, :price, :image, presence: true

  #各カラムの選択が「---」の時は値を保存しない
  validates :category_id, :condition_id, :shipping_cost_id,
            :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" }
end
