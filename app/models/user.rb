class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  has_many :messages

  with_options presence: true do
    validates :nickname
    validates :birthday

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
    validates_format_of :password, :password_confirmation, with: PASSWORD_REGEX, message: '英数字を含めて設定してください'

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力して下さい' } do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ンー－]+\z/, message: '全角カタカナで入力して下さい' } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end
