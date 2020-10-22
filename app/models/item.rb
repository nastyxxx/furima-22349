class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash  :category, :condition, :delivery_charge,
                          :prefecture, :handling_time
  has_one_attached :image

  with_options presence: true do
    validates :name, :text, :price
    with_options numericality: { other_than: 1 } do
      validates :category, :condition,
                :delivery_charge, :prefecture,
                :handling_time
    end
  end
end
