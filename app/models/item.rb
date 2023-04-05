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
  validates :product_name, :explanation, :image, presence: true

  #数値が300〜9,999,999の範囲かつ、半角数値でなければ値を保存しない
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/ }

  #各カラムの選択が「---」の時は値を保存しない
  validates :category_id, :condition_id, :shipping_cost_id,
            :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank" }
end
