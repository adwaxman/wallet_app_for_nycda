class AddCreatorIdToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :creator_id, :integer
  end
end
