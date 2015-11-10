class User < ActiveRecord::Base
  has_many :credit_cards_users, dependent: :destroy
  has_many :credit_cards, through: :credit_cards_users

  validates_uniqueness_of :email
  validates_presence_of :fname, :lname
  validates :password, confirmation: true, presence: true, length: { minimum: 4, maximum: 20}
  validates :area_code, format: { with: /\A\d{3}\z/, message: "is not valid" }
  validates :local_exchange, format: { with: /\A\d{3}\z/, message: "is not valid" }
  validates :phone_ending, format: { with: /\A\d{4}\z/, message: "is not valid" }
end
