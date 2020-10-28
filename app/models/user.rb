class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders, dependent: :destroy

  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze,
    message: 'Include both letters and numbers'
  }
  with_options presence: true do
    validates :nickname, :birth_day
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
      validates :first_name, :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
      validates :first_name_kana, :last_name_kana
    end
  end
end
