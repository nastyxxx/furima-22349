class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :handling_time
  belongs_to_active_hash :prefecture
  
  belongs_to :user
  
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :text
    validates :price,
      format: {
        with: /\A[0-9]+\z/, message: 'Half-width number' },
      numericality: {
        greater_than_or_equal_to: 300,
        less_than_or_equal_to: 9999999,
        message: 'Out of setting range'
      }
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id, :condition_id,
                :delivery_charge_id, :prefecture_id,
                :handling_time_id
    end
  end
end
