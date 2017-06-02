class User < ApplicationRecord
  authenticates_with_sorcery! 

  has_many :cards, dependent: :destroy

  validates :password, confirmation: true, presence: true, length: { minimum: 3 }, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true
  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update, allow_blank: true
  validates :email, uniqueness: true, presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  def self.create_with_omniauth(auth)
    
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.password = auth["info"]["name"]
      user.password_confirmation = auth["info"]["name"]
    end
  end

end
