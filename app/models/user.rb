class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :email,           presence: true
  validates :password,
    format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: 'Include both letters and numbers' },
    presence: true
  validates :first_name,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' },
    presence: true
  validates :last_name,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' },
    presence: true
  validates :first_name_kana,
    format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' },
    presence: true
  validates :last_name_kana,
    format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' },
    presence: true
  validates :birth_day,       presence: true
  
end
