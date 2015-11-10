class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :card_number
      t.string :card_type
      t.integer :exp_month
      t.integer :exp_year

      t.timestamps null: false
    end
  end
end
