class ItemOrder
  include ActiveModel::Model
  attr_accssor :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥０-９]/, message: "is invalid. Input full-width characters."}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    Order.create(user_id: user.id, item_id: item.id)
    DeliverAddress.create(postal_code: postal_code, prefecture_id: prefecture.id, city: city, house_number: house_number, buiding: building, Phone_number: phone_number)
  end
end