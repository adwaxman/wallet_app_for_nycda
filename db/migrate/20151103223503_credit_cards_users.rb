class CreditCardsUsers < ActiveRecord::Migration
  def change
    create_table :credit_cards_users do |t|
      t.integer :credit_card_id
      t.integer :user_id
    end
  end
end
