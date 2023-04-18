class OrderShipping
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name,
                :phone_number

  with_options presence: true do
    validates :token, :item_id, :user_id, :municipalities, :house_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                    house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
