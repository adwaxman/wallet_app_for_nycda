class ChangeDataTypesOnCcTable < ActiveRecord::Migration
  def change
    change_column :credit_cards, :card_number, :string
    change_column :users, :area_code, :string
    change_column :users, :local_exchange, :string
    change_column :users, :phone_ending, :string
  end
end
