class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/, message: "Full-width characters" }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validate :validate_name_kana

    def validate_name_kana
      if last_name_kana !~ /\A[\p{katakana}]+\z/
        errors.add(:last_name_kana, "Input full-width katakana characters")
      end

      if first_name_kana !~ /\A[\p{katakana}]+\z/
        errors.add(:first_name_kana, "Input full-width katakana characters")
      end
    end

end
