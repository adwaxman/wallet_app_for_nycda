class CreditCardsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :credit_card

  validates_presence_of :user_id, :credit_card_id
  validates_uniqueness_of :user_id, scope: :credit_card_id
end
